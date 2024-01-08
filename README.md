# :pushpin: Carboard
> 대시보드기반 탄소중립 실천 서비스  

</br>

## 1. 제작 기간 & 참여 인원
- 2019년 2월 18일 ~ 4월 5일
- 개인 프로젝트

</br>

## 2. 사용 기술
#### `Back-end`
  - Java 8
  - Spring Boot 2.3
  - Gradle
  - Spring Data JPA
  - QueryDSL
  - H2
  - MySQL 5.7
  - Spring Security
  - Jsoup
#### `Front-end`
  - Vue.js 3.0
  - Element UI

</br>

## 3. ERD 설계
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/final_erd.png)
![](https://github.com/JungHyung2/gitio.io/blob/master/assets/images/portfolio/p1.jpg)


## 4. 핵심 기능

이 서비스의 핵심 기능은 데이터 시각화입니다. <br/>
탄소 중립과 관련된 데이터를 공공데이터포털 오픈API에서 가져와 Chart.js 라이브러리를 사용하여 시각적으로 표현하였습니다.<br/>

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4-1. 공공데이터 API를 활용하여 탄소배출량, 평균기온, 폭염일수 등 데이터 시각화<br/>

#### 국가 온실가스 인벤토리 배출량 공공데이터 API 활용<br/>
- 인증키 발급 : 공공데이터포탈(https://www.data.go.kr)에서 오픈API 서비스의 [SERVICE KEY]를 발급 받아야 함<br/><br/>

#### 기타 데이터 출처<br/>
- 평균기온 (지역별,계절별)<br/>
(https://data.kma.go.kr/climate/RankState/selectRankStatisticsDivisionList.do)<br/>
- 폭염 일수<br/>
(https://data.kma.go.kr/climate/heatWave/selectHeatWaveChart.do)<br/>
- 탄소배출량 (지역별), 배출원별, 온실가스 비중<br/>
(https://www.data.go.kr/data/15049589/fileData.do)<br/>

</div>
</details>

</br>

## 5. 핵심 트러블 슈팅
### 5.1. 컨텐츠 필터와 페이징 처리 문제
- 저는 이 서비스가 페이스북이나 인스타그램 처럼 가볍게, 자주 사용되길 바라는 마음으로 개발했습니다.  
때문에 페이징 처리도 무한 스크롤을 적용했습니다.

- 하지만 [무한스크롤, 페이징 혹은 “더보기” 버튼? 어떤 걸 써야할까](https://cyberx.tistory.com/82) 라는 글을 읽고 무한 스크롤의 단점들을 알게 되었고,  
다양한 기준(카테고리, 사용자, 등록일, 인기도)의 게시물 필터 기능을 넣어서 이를 보완하고자 했습니다.

- 그런데 게시물이 필터링 된 상태에서 무한 스크롤이 동작하면,  
필터링 된 게시물들만 DB에 요청해야 하기 때문에 아래의 **기존 코드** 처럼 각 필터별로 다른 Query를 날려야 했습니다.

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 게시물 Top10 (기준: 댓글 수 + 좋아요 수)
 * @return 인기순 상위 10개 게시물
 */
public Page<PostResponseDto> listTopTen() {

    PageRequest pageRequest = PageRequest.of(0, 10, Sort.Direction.DESC, "rankPoint", "likeCnt");
    return postRepository.findAll(pageRequest).map(PostResponseDto::new);
}

/**
 * 게시물 필터 (Tag Name)
 * @param tagName 게시물 박스에서 클릭한 태그 이름
 * @param pageable 페이징 처리를 위한 객체
 * @return 해당 태그가 포함된 게시물 목록
 */
public Page<PostResponseDto> listFilteredByTagName(String tagName, Pageable pageable) {

    return postRepository.findAllByTagName(tagName, pageable).map(PostResponseDto::new);
}

// ... 게시물 필터 (Member) 생략 

/**
 * 게시물 필터 (Date)
 * @param createdDate 게시물 박스에서 클릭한 날짜
 * @return 해당 날짜에 등록된 게시물 목록
 */
public List<PostResponseDto> listFilteredByDate(String createdDate) {

    // 등록일 00시부터 24시까지
    LocalDateTime start = LocalDateTime.of(LocalDate.parse(createdDate), LocalTime.MIN);
    LocalDateTime end = LocalDateTime.of(LocalDate.parse(createdDate), LocalTime.MAX);

    return postRepository
                    .findAllByCreatedAtBetween(start, end)
                    .stream()
                    .map(PostResponseDto::new)
                    .collect(Collectors.toList());
    }
~~~

</div>
</details>

- 이 때 카테고리(tag)로 게시물을 필터링 하는 경우,  
각 게시물은 최대 3개까지의 카테고리(tag)를 가질 수 있어 해당 카테고리를 포함하는 모든 게시물을 질의해야 했기 때문에  
- 아래 **개선된 코드**와 같이 QueryDSL을 사용하여 다소 복잡한 Query를 작성하면서도 페이징 처리를 할 수 있었습니다.

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java
/**
 * 게시물 필터 (Tag Name)
 */
@Override
public Page<Post> findAllByTagName(String tagName, Pageable pageable) {

    QueryResults<Post> results = queryFactory
            .selectFrom(post)
            .innerJoin(postTag)
                .on(post.idx.eq(postTag.post.idx))
            .innerJoin(tag)
                .on(tag.idx.eq(postTag.tag.idx))
            .where(tag.name.eq(tagName))
            .orderBy(post.idx.desc())
                .limit(pageable.getPageSize())
                .offset(pageable.getOffset())
            .fetchResults();

    return new PageImpl<>(results.getResults(), pageable, results.getTotal());
}
~~~

</div>
</details>

</br>
