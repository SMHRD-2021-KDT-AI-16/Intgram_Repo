<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />
    <link rel="stylesheet" href="../css/style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style>
      body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
      }

      .contents {
        display: flex;
      }

      .menu {
        background-color: #2c3e50;
        color: #ecf0f1;
        padding: 20px;
        width: 200px;
      }

      .logo {
        font-size: 1.5em;
        font-weight: bold;
        color: #3498db;
      }

      .menu-link {
        color: #ecf0f1;
        text-decoration: none;
        display: block;
        margin: 10px 0;
        padding: 10px;
      }

      .contents-container {
        padding: 20px;
      }

      .top-menu {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        background-color: #3498db;
        color: #ecf0f1;
      }

      .news-area {
        background-color: #ffffff;
        padding: 20px;
        margin-top: 20px;
      }

      .news-list-item {
        list-style: none;
        margin-bottom: 20px;
        border: 3px solid #ecf0f1;
        border-radius: 8px;
        overflow: hidden;
        background-color: #fff;
        display: none;
      }

      .news-list__img {
        max-width: 100%;
        height: auto;
        border-radius: 8px 0 0 8px;
        flex-shrink: 0;
      }
      .news-list-item img {
        max-width: 100%;
        height: auto;
        border-radius: 8px 0 0 8px;
        flex-shrink: 0;
      }

      .news-list-item .news-txt {
        padding: 20px;
      }

      .news-txt__title {
        font-size: 1.2em;
        font-weight: bold;
        margin-bottom: 10px;
      }

      .news-txt__detail {
        color: #555;
      }
      .video-area {
      background-color: #ffffff;
      padding: 20px;
      margin-top: 20px;
    }

    .video-list__title {
      font-size: 1.5em;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .video-list-item {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      cursor: pointer;
    }

    .video-list__img {
      max-width: 600px;
      height: auto;
      border-radius: 8px;
      margin-right: 20px;
    }

    .video-txt {
      flex-grow: 1;
    }

    .video-txt__title {
      font-size: 1.2em;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .video-txt__detail {
      color: #555;
    }
    table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 4px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .pagination {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.page-link {
  margin: 0 5px;
  padding: 8px 12px;
  text-decoration: none;
  background-color: #3498db;
  color: #ecf0f1;
  border-radius: 4px;
  cursor: pointer;
}

.page-link:hover {
  background-color: #2980b9;
}

.page-link:disabled {
  background-color: #bdc3c7;
  color: #7f8c8d;
  cursor: not-allowed;
}
    </style>
    <title>TEAM Intgram</title>
  </head>
  <body>
    <div class="contents">
      <aside class="menu">
        <span class="logo">{ Intgram }</span>
        <section class="menu-wrapper">
          <nav class="side-menu">
            <a class="menu-link" href="#">
              <i class="fa-solid fa-house"></i>
              <span>Home</span>
            </a>
            <a class="menu-link" href="../components/netzero.html">
              <i class="fa-solid fa-seedling"></i>
              <span>Dashboard</span>
            </a>
            <a class="menu-link" href="../components/archive.html">
              <i class="fa-solid fa-file-zipper"></i>
              <span>Newsfeed</span>
            </a>
            <a class="menu-link" href="../components/calculation.html">
              <i class="fa-solid fa-calculator"></i>
              <span>Calculation</span>
            </a>
          </nav>
        </section>
      </aside>
    </div>
    <main class="contents-container">
      <section id="login-area" class="contents-header__login">
        <nav class="top-menu">
          <a class="top-menu-link" href="#">
            <i class="fa-regular fa-circle-user"></i>
            <span>Welcome User</span>
          </a>
          <a class="top-menu-link" href="#">
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
            <span>Logout</span>
          </a>
        </nav>
      </section>
      <section id="news-area" class="news-area">
        <p class="news-list__title">News</p>
        <ul class="news-list">
          <li class="news-list-item">
            <div>
              <img
                src="img/new1.png"
                alt="뉴스썸네일"
                class="news-list__img"
              />
            </div>
            <div class="news-txt">
              <div class="news-txt__title">
                <a href="http://digitalchosun.dizzo.com/site/data/html_dir/2023/12/27/2023122780048.html">
                  폭스바겐그룹코리아, 사회공헌 활동… 교육과 환경, 지역사회 지원에 초점
                </a>
              </div>
              <div class="news-txt__detail">
                파리기후협약에 동참한 최초의 자동차 제조업체다. 이에 대한 그룹 전략과 목표는 2050년까지 탄소중립이... 이산화탄소 배출량을 30%까지 줄이는 것을 목표로 한 탈탄소화 노력을 토대로 생물 다양성의 핵심 기반인...
              </div>
            </div>
          </li>
          <li class="news-list-item">
            <div>
              <img
                src="img/new2.png"
                alt="뉴스썸네일"
                class="news-list__img"
              />
            </div>
            <div class="news-txt">
              <div class="news-txt__title">
                <a href="http://www.fnnews.com/news/202312261439094969">
                북미·유럽 '이것' 보조금 확대에...美알래스카에 연구소까지 만든 LG전자
              </a>
              </div>
              <div class="news-txt__detail">
                보고서는 최근 에너지 공급 불안 및 가격상승과 탄소중립 실현을 위한 리파워EU(REpowerEU) 계획 등에 따른 것으로 분석했다. 북미와 유럽 각국 정부가 탈탄소 기조에 발맞춰 히트펌프 보급 확대에 나서면서 수요도 늘고...
                <li class="news-list-item">
                  <div>
                    <img
                      src="img/new3.png"
                      alt="뉴스썸네일"
                      class="news-list__img"
                    />
                  </div>
                  <div class="news-txt">
                    <div class="news-txt__title">
                      <a href="https://www.esgeconomy.com/news/articleView.html?idxno=5490">
                      재무제표에 기후변화 영향 반영 요구 거세져
                    </a>
                    </div>
                    <div class="news-txt__detail">
                      재무제표에 ▶기후변화에 따른 물리적 위험과 ▶기업의 기후행동이나 각국 정부의 탈탄소 전환 정책에... 내용연수에 기후변화가 미치는 영향 ▲재무제표와 탄소중립 선언의 일관성이라는 세 가지 측면에서 지적하고...
                    </div>
                  </div>
                </li>
                <li class="news-list-item">
                  <div>
                    <img
                      src="img/new4.png"
                      alt="뉴스썸네일"
                      class="news-list__img"
                    />
                  </div>
                  <div class="news-txt">
                    <div class="news-txt__title">
                      <a href="https://www.ksg.co.kr/news/main_newsView.jsp?pNum=140119">
                      송년특집 / [2023년 10대 뉴스] 05 친환경 연료 시대 개막…글로벌 선사들 탈...
                    </a>
                    </div>
                    <div class="news-txt__detail">
                      잡고 탈탄소 기술력 강화에 나섰다. 스위스 MSC는 싱가포르 소재 글로벌해사탈탄소화센터(GCMD)와 5년의... 확대하는 기후변화 대책 강화안을 승인했다. EU 회원국이 비준한 새로운 ETS 규정은 2050년 탄소중립...
                    </div>
                  </div>
                </li>
                <li class="news-list-item">
                  <div>
                    <img
                      src="img/new5.png"
                      alt="뉴스썸네일"
                      class="news-list__img"
                    />
                  </div>
                  <div class="news-txt">
                    <div class="news-txt__title">
                      <a href="https://www.ceoscoredaily.com/page/view/2023122216024735946">
                      선택 아닌 필수 된 ‘탈탄소’…현대·GS건설·DL이앤씨 등 탄소중립 박차
                    </a>
                    </div>
                    <div class="news-txt__detail">
                      건설사의 탈탄소 경영 추진이 점차 중요해지고 있다. 자산 2조원 이상 상장사는 오는 2025년부터 탄소... 대우건설은 기후변화대응위원회를 설립하고 2050 탄소중립 로드맵을 구축했다. 로드맵에 따르면 대우건설은 연... 
                    </div>
                  </div>
                </li>
              </div>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new6.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.hankyung.com/article/2023122590821">
                      철강 거인들, 탈탄소 전환에 긴장하는 이유는
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    따라서 그린 수소 생산이 불가능하고 철강의 탄소중립인 수소환원제철도 불가능해진다. 철강기업의... 안보와 기후변화에 360억달러(약 480조원, 2022~2030년)를 투자하고 있다. 일본은 2021년부터 저탄소 기술 개발을 위해...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new7.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://news.jtbc.co.kr/article/article.aspx?news_id=NB12157672">
                      [박상욱의 기후 1.5] 막 내린 COP28, 혼돈의 RE100과 CF100 (상)
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    기후위기를 완전히 막는 것도 아니고, 그 영향과 피해를 줄이기 위해선 탈탄소, 탈화석연료가 나아가야할... 넘어 탄소중립 이행과 기후위기 대응에 있어서 선도적인 나라로 거듭났죠. 2020년 기준, 영국의...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new8.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="http://www.ifs.or.kr/bbs/board.php?bo_table=News&wr_id=53824">
                      ‘글로벌 사우스’와 한국 외교
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    지원 △탈탄소 등 지구적 차원의 과제 해결 △공급망 강화 △인적자원의 교류 등 네트워크 확대가 주된... 열린 기후변화 정상회의에서 석탄의 단계적 감축 약정을 방해하여 태평양 도서국 이익을 저해 ※ 탄소국경...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new9.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.esgeconomy.com/news/articleView.html?idxno=5478">
                      MSCI가 선정한 2024년 ESG 8대 트렌드
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    기후금융에서 비상장 자산 비중 커질 것 사모펀드 등 비상장 자산(Unlisted asset)에 대한 투자가 급증하면서 현재 주요 투자자의 포트폴리오의 25%를 차지하고 있다. 사모펀드는 앞으로 탄소중립 전환에도 중요한 역할을...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new10.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.thebell.co.kr/free/content/ArticleView.asp?key=202312211257510600108079">
                      [더벨][LG에너지솔루션 2.0]전기차 다음은 ESS, 미국·유럽 공략할 새 선봉장
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    각국 정부의 탄소중립 정책과 기업들의 탈탄소 기조에 따라 시장 규모가 빠르게 성장하고 있다.... 사회가 기후 변화에 대처하기 위해 이산화탄소 배출을 줄이는 '탄소중립'을 내세우면서 ESS 산업 성장에 속도가...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new11.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="http://www.danbinews.com/news/articleView.html?idxno=25178">
                      먹거리 전환이 에너지 전환만큼 중요하다
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    에너지 분야의 탈탄소가 성공해도 식품 생산과 소비 과정에서 발생하는 온실가스가 늘어나고 있다면... 기후정의, 먹거리 정의를 이루는 탄소중립 농식체계로 전환이 필요합니다. 이어 박일진 농어촌특별위원회...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new12.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.mk.co.kr/article/10904177">
                      세운지구, IT기술 접목한 친환경 도시로 재개발
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    구체적인 청사진에 대해 기후 변화에 어떻게 대응하느냐가 도시 위상을 높이는 데 중요한 요소가 되고 있다며 세운지구에 탄소 중립 도시를 구현해 서울의 위상을 올리겠다고 답했다. 실제 디블록그룹은 세운지구...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new13.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.siminilbo.co.kr/news/newsview.php?ncode=1160290839431187">
                      경기도, 美 에어프로덕츠 5억달러 투자 유치
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    김동연 지사는 “지난번 본사 방문시 경기도 기후변화 대책을 설명했을 때 세이피 가세미 회장께서 지사의... 2050년까지 넷제로(Net Zeroㆍ탄소중립) 달성 목표를 실행 중이며, 2030년까지 현재 배출되는 에어프로덕츠 전체...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new14.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.businesspost.co.kr/BP?command=article_view&num=337493">
                      [Who Is ?] 추형욱 SKE&S 대표이사 사장
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    민간주도 탈탄소 정책협의체 에너지얼라이언스가 개최한 'CF100 토론회
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new15.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.ekn.kr/web/view.php?key=20231228010008384">
                      [EE칼럼] 수소배관망 구축, 네덜란드 '하수니'가 좋은 본보기
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    기후변화에 대응하는 차원도 있지만, 그보다는 가스 추출로 지반 침하가 심해져 1991년부터 주변 지역에... 더욱이 탄소중립 이행에 따른 예정된 천연가스 수요 감소로 새로운 활로를 찾아야만 하는 상황으로 내몰렸다....
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new16.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="http://www.hansbiz.co.kr/news/articleView.html?idxno=674031">
                      [한스초대석] 심재성 기후에너지본부장, '경기RE100' 세계적인 사례 만들 것...
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    탄소 배출 부분 가장 큰 비중을 차지하는 에너지와 산업 부문에서 화석 연료의 사용을 줄이고, 탈탄소... / 경기환경에너지원 제공 ▲ 2024년 '기후행동 기후소득' 사업 추진으로 탄소중립 활동 실천 활성화 심재성...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new17.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="http://www.ilemonde.com/news/articleView.html?idxno=18172">
                      COP28, 화석연료로부터의 전환 선언 ... 남겨진 과제와 이행방안은?
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    산업·학계의 치열한 기후변화 토론 탄소중립 원천기술 이미 있다, 스케일업 기술로 이어져야 이어서... 정기석 상무는 EU, 미국 및 중국 등은 청정 수소의 생산기술 확보와 실증에 집중하며 산업 부분의 탈탄소화를...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new18.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.ekn.kr/web/view.php?key=20231219010005829">
                      [COP28 결과와 향후 전망 세미나] 일자리 창출·지속가능 발전 위해 해외 감...
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    해양수산부문 국제감축사업 발굴 및 개도국 탄소중립 역량강화 프로그램을 운영할 계획이라고 설명했다. 이어 이번 총회를 통해 국제해운 분야의 탈탄소화 선도적 역할, 특히 세계 4위 해운강국으로서 시장의 새로운...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new19.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="http://www.snmnews.com/news/articleView.html?idxno=527825">
                      저탄소 친환경 체제로 전환 대비 시급하다
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    탄소중립을 주도하고 있는 유럽을 중심으로 한 저탄소 제로의 전환은 수요 시장에서도 본격적인 적용 확대가 추진되고 있다. 최근 열린 '제28차 유엔 기후 변화 회의'에서 캐나다, 독일, 영국, 미국 정부는 저탄소 제품을...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new20.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.busan.com/view/busan/view.php?code=2023121911092257994">
                      KRISO, 국제무대서 ‘대한민국 친환경선박 기술’ 선보여
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    대한민국 탈탄소 R&D 현황(R&D Status of Korea for Green Shipping Corridor)’을 발표해 국제사회의 높은 관심을... 모여 기후변화 대응 방안을 논의하고 탄소 배출 감축 등을 약속하는 국제회의이다. 특히 올해 개최된...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new21.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="http://www.g-enews.com/ko-kr/news/article/news_all/202312191050191363edf69f862c_1/article.html">
                      [데스크칼럼] 금융권, 기후변화 따른 기후금융 강화해야
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    자본이 고탄소 산업에서 저탄소, 궁극적으로 탈탄소 산업에 대규모로 그리고 빠른 속도로 유입되어야만 실질적인 변화가 가능하다. 그 때문에 기후변화 대응에서 금융은 핵심적 역할을 해야 한다. 기후변화는 최근 몇...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new22.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.businesspost.co.kr/BP?command=article_view&num=336701">
                      EU 이어 영국도 탄소장벽 쌓기, 철강·시멘트부터 조여오는 무역장벽
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    비슷한 탄소 가격을 부담하도록 할 것이라며 영국의 탈탄소화 노력이 전 세계 탄소배출량 감소로 이어질... 유엔기후변화협약 당사국총회(COP28)의 부대행사에서 현재 세계적으로 73가지 탄소 가격제가 시행 중이나...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new23.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.hani.co.kr/arti/science/science_general/1121039.html">
                      유럽 7개국 “2035년까지 발전 부문 무탄소”…목표보다 5년 당겨
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    독일과 프랑스 등 유럽 7개국이 2035년까지 발전 부문의 탄소중립을 달성하겠다고 선언했다. ‘탈탄소화’ 속도를 높여 기존 목표보다 5년 당기기로 한 것이다. 제28차 유엔기후변화협약 당사국총회(COP28)에서...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new24.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://www.dnews.co.kr/uhtml/view.jsp?idxno=202312191154186860293">
                      캐나다 냉난방시설 수요 급증…탈탄소 기회 잡아라
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    해외‘탈탄소’ 기계설비의 기회의장이 열리고 있다. 전세계적으로 기후변화에 대한 경각심이 더욱... 등 기후변화로 인한 직접적인 영향을 받으면서 탄소중립에 대한 필요성이 커졌고, 냉난방시장이 급속도로...
                  </div>
                </div>
              </li>
              <li class="news-list-item">
                <div>
                  <img
                    src="img/new25.png"
                    alt="뉴스썸네일"
                    class="news-list__img"
                  />
                </div>
                <div class="news-txt">
                  <div class="news-txt__title">
                    <a href="https://view.asiae.co.kr/article/2023121911411780105">
                      최태원 넷제로 가는길 원전 빼고 갈 수 없어…무탄소연합 필요
                  </a>
                  </div>
                  <div class="news-txt__detail">
                    회장이 탄소중립을 구현하기 위한 에너지원에 원전과 수소 등을 포함하는 무탄소에너지(CFE)를 국제적 규범... 최근 여러 나라에서 기후변화와 관련해 탈탄소에서 역행하는 조짐을 보이는 것에 대해서는 증권시장에서...
                  </div>
                </div>
              </li>
              <div class="pagination" id="news-pagination">
                <!-- Pagination buttons will be added dynamically here -->
              </div>
              
              <script>
                const itemsPerPage = 5;
                let currentPage = 1;
              
                function renderNewsList() {
                  const newsItems = document.querySelectorAll('.news-list-item');
                  const startIndex = (currentPage - 1) * itemsPerPage;
                  const endIndex = startIndex + itemsPerPage;
              
                  newsItems.forEach((item, index) => {
                    if (index >= startIndex && index < endIndex) {
                      item.style.display = 'block';
                    } else {
                      item.style.display = 'none';
                    }
                  });
                }
              
                function renderNewsPagination() {
                  const totalNewsItems = document.querySelectorAll('.news-list-item').length;
                  const totalNewsPages = Math.ceil(totalNewsItems / itemsPerPage);
                  const newsPagination = document.getElementById('news-pagination');
                  newsPagination.innerHTML = '';
              
                  for (let i = 1; i <= totalNewsPages; i++) {
                    const pageItem = document.createElement('a');
                    pageItem.href = '#';
                    pageItem.classList.add('page-link');
                    pageItem.textContent = i;
              
                    pageItem.addEventListener('click', () => {
                      currentPage = i;
                      renderNewsList();
                    });
              
                    newsPagination.appendChild(pageItem);
                  }
                }
              
                // Initial rendering
                renderNewsList();
                renderNewsPagination();
              </script>
            </section>
            <table>
              <thead>
                  <tr>
                      <th colspan="2">지구를 뜨겁게 만드는 탄소 이야기 🌎 탄소 중립 | 지식채널e | 기후 변화&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;지식채널e - 탄소이야기2 슬기로운 탄소 식생활</th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td><img src="img/vd1.png" alt="영상썸네일" class="video-list__img" onclick="window.location.href='https://www.youtube.com/watch?v=XVAoQ60yAZc'"></td>
                      <td><img src="img/vd3.png" alt="영상썸네일" class="video-list__img" onclick="window.location.href='https://www.youtube.com/watch?v=JZWjHd2yVdg'"></td>   
                      </td>
                  </tr>
              </tbody>
          </table>
          <table>
              <thead>
                  <tr>
                      <th colspan="2">전 세계를 강타한 기후 재앙💥 지금도 빠르게 오르고 있는 지구의 온도가 불러일으킨 각종 피해😢&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;이과는 이산화탄소를 묻어~ 우리나라 탄소 중립 근황｜크랩</th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td><img src="img/vd2.png" alt="영상썸네일" class="video-list__img" onclick="window.location.href='https://www.youtube.com/watch?v=a2Tpe18CLq0'"></td>
                      <td><img src="img/vd4.png" alt="영상썸네일" class="video-list__img" onclick="window.location.href='https://www.youtube.com/watch?v=Gdf8LcZLrXQ'"></td>
                         
                      </td>
                  </tr>
              </tbody>
          </table>
            </section>
    </main>
  </body>
</html>
