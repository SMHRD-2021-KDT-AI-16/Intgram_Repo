<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/style.css?20231228" />
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="css/climate.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="js/dashboard-apis.js" type="module" defer></script>
  <script src="js/emitYear.js" defer></script>
  <script src="js/script.js" type="module" defer></script>
  <script src="js/menu_min510.js" defer></script>
  <script src="js/mouseover.js" defer></script>
  <script src="js/jquery-3.7.1.min.js"></script>
  <title>TEAM Intgram</title>
  <style>
    .climate-map-area {
      width: 90%;
      height: 80%;
    }
    .rap2 {
      display: none;
    }
  </style>
</head>
<body>
  <div class="contents">
    <header class="menu">
      <div class="logo">
					<img src="img/logo.png" class="logo_img" width=300px height=300px/>
				</div>

				<section class="menu-wrapper">
					<nav class="side-menu">
						<div id="horizontal-underline"></div>
						<a class="menu-link" href="home.jsp">
							<i class="fa-solid fa-house"></i>
							<span>Home</span>
						</a>

						<a
							href="netzero_carbon.jsp"
							class="menu-link"
							id="dashboard"
						>
							<i class="fa-solid fa-seedling"></i>
							<span>Carbon</span>
						</a>
						<a
							href="components/netzero_climate.html"
							class="menu-link"
							id="dashboard"
						>
							<i class="fa-solid fa-temperature-three-quarters"></i>
							<span>Climate</span>
						</a>

						<a class="menu-link" href="archive.jsp">
							<i class="fa-regular fa-folder-open"></i>
							<span>Newsfeed</span>
						</a>
						<a class="menu-link" href="calculation.jsp">
							<i class="fa-solid fa-calculator"></i>
							<span>Calculation</span>
						</a>
					</nav>
				</section>

      <section id="login-area" class="contents-header__login">
				<nav class="login-menu">
					
					<c:if test="${member != null }"> <!-- 로그인 했을 때 -->
						<span>${member.mem_name} </span>
						<a href="LogoutService">로그아웃</a>
					</c:if>
					<c:if test="${member == null }"> <!-- 로그아웃일 때 -->
						<a class="login-menu-link" href="login.jsp"> 
					      <i class="fa-regular fa-circle-user"></i> <span>Login</span>
					    </a>
					    <a class="login-menu-link" href="join.jsp"> 
					       <i class="fa-solid fa-arrow-right-to-bracket"></i> <span>Register</span>
					    </a>
					</c:if>
				</nav>
			</section>

      <a href="#" class="navbar__toggleBtn">
        <i class="fa-solid fa-bars"></i>
      </a>
      <!-- 비동기 방식으로 로그인 화면 이동 -->
      <section id="login-screen" style="display: none"></section>

      <!-- 비동기 방식으로 회원가입 화면 이동 -->
      <section id="join-screen" style="display: none"></section>
    </header>
  </div>

  <div class="climate-container">
    <section class="climate-part1">
      <div class="climate-part1-menu">
        <div class="climate-part1-menu-title">
          <h2 class="climate-title">전국 폭염 일수</h2>
        </div>
        <div class="climate-part1-menu-button">
          <button onclick="calendar()">캘린더</button>
          <button onclick="linechart()">그래프</button>
        </div>
      </div>
      <div class='rap'>
        <div class="header">
          <div class="btn prevDay"></div>
          <h2 class='dateTitle'></h2>
          <div class="btn nextDay"></div>
        </div>
        <div class="grid dateHead">
          <div>일</div>
          <div>월</div>
          <div>화</div>
          <div>수</div>
          <div>목</div>
          <div>금</div>
          <div>토</div>
        </div>
        <div class="grid dateBoard"></div>
      </div>
      <div class='rap2'>
        <canvas id="yearTropicalChart" width="630px" height="400px"></canvas>
      </div>

      <h2 class="climate-title">국내 해역별 연평균 해수면 온도</h2>
      <canvas id="seasurfaceTempChart" height="300%"></canvas>
    </section>
    
    <section class="climate-part2">
      <h2 class="climate-title">사계절 길이 변화</h2>
      <div class="season">        
        <div>          
          <canvas id="seasonlengthChart"></canvas>
        </div>
        <div id="season_color">
          <ul>
            <li id="current">최근 30년 여름 길이 : 65일</li>
            <li id="past">과거 30년 여름 길이 : 65일</li>
          </ul>
        </div>
      </div>
      <div>
        여름은 20일 길어지고 겨울은 22일 짧아짐
      </div>
      <div class="climate-part1-menu">
        <div class="season2">
          <div class="climate-part1-menu">
          <h2 class="climate-title">계절별 온도 변화</h2>
          <select name="season">
            <option value="봄">봄</option>
            <option value="여름">여름</option>
            <option value="가을">가을</option>
            <option value="겨울">겨울</option>
            <option value="전체">전체</option>
            <option value="평균">평균</option>
          </select>    
        </div>   
        <canvas id="seasonclimateChart" width="700px" height="400px"></canvas>
      </div>
    </section>

    <section class="climate-part3">
      <div class="map">
        <h2 class="climate-title">지역별 온도 변화</h3>
          <div class="climate-map-area">
            <iframe src="components/map_climate.html" width="500px" height="750px" frameborder='0' scrolling="no"></iframe>
          </div>
      </div>
    </section>
  </div>
  <script src="js/temperature.js" defer></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  <script>
    // 계절별 온도
    let select_season = '겨울'
    drawSCC(select_season)
    $("select[name=season]").change(function () {
			select_season = $(this).val()
			drawSCC(select_season)
		});
    function drawSCC(select_season) {
    fetch("json/season_temperature.json")
      .then((res) => {
        return res.json()
      })
      .then((obj) => {
        let min_year = 2010
        let max_year = 2023
        let season = select_season
        let ys = []
        let ys_min = []
        let ys_max = []
        let ys_avg = []
        let temp_ys_min = 0
        console.log(obj)
        for (let i = 0; i < obj.length; i++) {          
          let temp = obj[i]['년계절'].split(" ")
          if (season == '전체') {
            if ((temp[0] <= max_year && temp[0] >= min_year)) {
              ys.push(obj[i]['년계절'])
              ys_min.push(obj[i]['평균최저기온(℃)'])
              ys_max.push(obj[i]['평균최고기온(℃)'])
              ys_avg.push(obj[i]['평균기온(℃)'])
            }
          } else if(season == '평균') {
            if(i % 4 == 0) {
              if ((temp[0] <= max_year && temp[0] >= min_year)) {
                ys.push(temp[0])
                ys_min.push( (obj[i]['평균최저기온(℃)'] + obj[i + 1]['평균최저기온(℃)'] 
                + obj[i + 2]['평균최저기온(℃)'] + obj[i + 3]['평균최저기온(℃)']) / 4 )
                ys_max.push( (obj[i]['평균최고기온(℃)'] + obj[i + 1]['평균최고기온(℃)'] 
                + obj[i + 2]['평균최고기온(℃)'] + obj[i + 3]['평균최고기온(℃)']) / 4 )
                ys_avg.push( (obj[i]['평균기온(℃)'] + obj[i + 1]['평균기온(℃)'] 
                + obj[i + 2]['평균기온(℃)'] + obj[i + 3]['평균기온(℃)']) / 4 )
              }
            }


            // if ((temp[0] <= max_year && temp[0] >= min_year)) {
            //   ys.push(temp[0])
            //  // console.log(ys)
              
            //   for(let j = 0; j < 4; j++) {
            //     temp_ys_min += obj[i]['평균최저기온(℃)']
            //   }
            //   ys_min.push(temp_ys_min / 4)
            // }
            
          }else {
            if ((temp[0] <= max_year && temp[0] >= min_year) && temp[1] == season) {
              ys.push(obj[i]['년계절'])              
              ys_min.push(obj[i]['평균최저기온(℃)'])
              ys_max.push(obj[i]['평균최고기온(℃)'])
              ys_avg.push(obj[i]['평균기온(℃)'])
            }
          }
        }
        let seasonclimateChart = new Chart(scc, {
          type: 'line',
          data: {
            labels: ys,
            datasets: [{
              label: '평균최저기온',
              data: ys_min,
              borderColor: '#0052C4',
              borderWidth: 2,
              tension: 0.2,
              fill: false
            }, {
              label: '평균기온',
              data: ys_avg,
              borderColor: '#32CD32',
              borderWidth: 2,
              tension: 0.2,
              fill: false
            }, {
              label: '평균최고기온',
              data: ys_max,
              borderColor: '#FB0019',
              borderWidth: 2,
              tension: 0.2,
              fill: false
            }
            ]
          },
          options: {
            elements: {
              point: {
                radius: 2
              }
            },
            responsive: false,
            scales: {
              yAxes:[{
                ticks: {
                  //min : 15
                }
              }]
            },
            plugins: {
              legend: {
                position: 'top'
              }
            }
          }
        })

      })
    }
    // 열대야 그래프
    // yearTropicalChart

    var ytc = document.getElementById('yearTropicalChart').getContext('2d');
    fetch("json/year_tropical.json")
      .then((res) => {
        return res.json()
      })
      .then((obj) => {  
        console.log(obj['년'])
        let get_year = []
        let get_days = []

        for(let i = 0; i < obj.length; i++) {
          get_year.push(obj[i]['년'])
          get_days.push(obj[i]['폭염일수'])
        }
        let yearTropicalChart = new Chart(ytc, {
          type: 'bar',
          data: {
            labels: get_year, 
            datasets: [{
              label: '폭염일수',
              data: get_days,
              backgroundColor: 'red'
            }]
          },
          options: {
            responsive: false,
            scales: {
              yAxes:[{
                ticks: {
                  max : 70
                }
              }]
            },
            plugins: {
              legend: {
                position: 'right'
              }
            }
          }
        })
      })
    // 열대야 달력
    fetch("json/temperature_data.json")
      .then((res) => {
        return res.json()
      })
      .then((obj) => {    
    	  console.log('1111111111111111111111')
    	  console.log(obj)
          const makeCalendar = (date) => {
	          const currentYear = new Date(date).getFullYear();
	          const currentMonth = new Date(date).getMonth() + 1;
	
	          const firstDay = new Date(date.setDate(1)).getDay();
	          const lastDay = new Date(currentYear, currentMonth, 0).getDate();
	
	          const limitDay = firstDay + lastDay;
	          const nextDay = Math.ceil(limitDay / 7) * 7;
	
	          let htmlDummy = '';
	          let date_Temper = []
	          for (let i = 0; i < obj.length; i++) {
	            let ymd = obj[i]['날짜'].split("-")
	            if (parseInt(ymd[0]) == currentYear && parseInt(ymd[1]) == currentMonth) {
	              date_Temper.push(obj[i]['최고기온(℃)'])
	            }
	          }
	          for (let i = 0; i < firstDay; i++) {
	            htmlDummy += `<div class="noColor"></div>`;
	          }
	
	          for (let i = 1; i <= lastDay; i++) {
	            htmlDummy += `<div class='date'>${i}`;
	            if (date_Temper[i - 1] >= 33)
	              htmlDummy += `<span class='heatwave'>${date_Temper[i - 1]}(℃)</span></div>`;
	            else
	              htmlDummy += `</div>`
	          }
	
	          for (let i = limitDay; i < nextDay; i++) {
	            htmlDummy += `<div class="noColor"></div>`;
	          }
	          
	          document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
	          document.querySelector(`.dateTitle`).innerText = `${currentYear}년 ${currentMonth}월`;
	    
        }
        const date = new Date();
        makeCalendar(date);
        console.log('aekjfkaejfkeajf')
        console.log(htmlDummy)
        // 이전달 이동
        document.querySelector(`.prevDay`).onclick = () => {
          let temp
          if(date.getMonth() == 6 || date.getMonth() == 7 || date.getMonth() == 8 ) {
            makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));          
          } else { //else if(date.getMonth() )
            //console.log('test!')
            while(true) {
              temp = date.getMonth()
              if(temp != 7) {
                date.setMonth(date.getMonth() - 1)
                //console.log(cnt)
              } else {
                makeCalendar(new Date(date.setMonth(date.getMonth())));   
                break;
              }
            }
          }
        }
        // 다음달 이동
        document.querySelector(`.nextDay`).onclick = () => {
          //makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
          let temp
          if(date.getMonth() == 4 || date.getMonth() == 5 || date.getMonth() == 6 ) {
            makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));          
          } else { //else if(date.getMonth() )
            //console.log('test!')
            while(true) {
              temp = date.getMonth()
              if(temp != 5) {
                date.setMonth(date.getMonth() + 1)
                //console.log(cnt)
              } else {
                makeCalendar(new Date(date.setMonth(date.getMonth())));   
                break;
              }
            }
          }
        }
      }
      )
    
    let dtc_year = []
    // 국내 해수면 온도
    fetch("json/seasurface_temp.json")
      .then((res) => {
        return res.json()
      })
      .then((obj) => {        
        console.log(obj)
        let getYear = []
        let getEast = []
        let getWest = []
        let getSouth = []

        // for(let i = 10; i < obj.length; i++) {
        //   dtc_year.push(obj[i]['연도'])
        //   dtc_days.push(obj[i]['지속일수'])
        // }
        for(let i = 0; i < obj.length; i++) {
          getYear.push(obj[i]['연도'])
          getEast.push(obj[i]['동해'])
          getWest.push(obj[i]['서해'])
          getSouth.push(obj[i]['남해'])
        }
        
        let seasurfaceTempChart = new Chart(sst, {
          type: 'line',
          data: {
            labels: getYear,
            datasets: [{
              label: '서해',
              data: getWest,
              borderColor: '#a0d667',
              borderWidth: 2,
              tension: 0.2,
              fill: false
            } , {
              label: '동해',
              data: getEast,
              borderColor: '#0070c0',
              borderWidth: 2,
              tension: 0.2,
              fill: false
            }, {
              label: '남해',
              data: getSouth,
              borderColor: '#c0504d',
              borderWidth: 2,
              tension: 0.2,
              fill: false
            }
            ]
          },
          options: {
            elements: {
              point: {
                radius: 0
              }
            },
            responsive: false,
            plugins: {
              legend: {
                position: 'top'
              }
            }
          }
        })
      })
    function calendar() {
      document.querySelector('.rap').style.display = 'block'
      document.querySelector('.rap2').style.display = 'none'
    }
    function linechart() {
      document.querySelector('.rap').style.display = 'none'
      document.querySelector('.rap2').style.display = 'block'
    }
    let a = 0
    let cnt = 0
    let season_bgColor = [ '#f9a73f', '#6aafac', '#e96551', '#596f84']
    function update_slc() {
      
      a += 1 * Math.PI / 24
      cnt++
      if(cnt >= 48) cnt = 0
      seasonlengthChart.options.rotation = a
      seasonlengthChart.update();

      if(cnt >= 36) {
        //85, 98, 73, 109
        document.getElementById('current').innerHTML = "최근 30년 봄 길이 : 91일"
        document.getElementById('past').innerHTML = "과거 30년 봄 길이 : 85일"
        document.querySelector('#season_color').style.backgroundColor = season_bgColor[0]
      }
      else if(cnt >= 20) {
        document.getElementById('current').innerHTML = "최근 30년 여름 길이 : 118일"
        document.getElementById('past').innerHTML = "과거 30년 여름 길이 : 98일"
        document.querySelector('#season_color').style.backgroundColor = season_bgColor[1]
      }
      else if(cnt >= 12) {
        document.getElementById('current').innerHTML = "최근 30년 가을 길이 : 69일"
        document.getElementById('past').innerHTML = "과거 30년 가을 길이 : 73일"
        document.querySelector('#season_color').style.backgroundColor = season_bgColor[2]
      }
      else {
        document.getElementById('current').innerHTML = "최근 30년 겨울 길이 : 87일"
        document.getElementById('past').innerHTML = "과거 30년 겨울 길이 : 109일"
        document.querySelector('#season_color').style.backgroundColor = season_bgColor[3]
      }
      document.querySelector('#season_color').style.transition = '2s';
    }

    var scc = document.getElementById('seasonclimateChart').getContext('2d');

    setInterval(() => {
      update_slc()
    }, 250)
    var sst = document.getElementById('seasurfaceTempChart').getContext('2d');
    var slc = document.getElementById('seasonlengthChart').getContext('2d');

    let seasonlengthChart = new Chart(slc, {
      type: 'doughnut',
      data: {
        labels: ['봄', '여름', '가을', '겨울'],
        datasets: [{
          //data: [91, 118, 69, 87],
          data: [90, 120, 60, 90],
          backgroundColor: [
            '#f9a73f',
            '#6aafac',
            '#e96551',
            '#596f84'],
          borderColor: [
            '#f9a73f',
            '#6aafac',
            '#e96551',
            '#596f84'],
          hoverBorderColor: ['#f78d08', '#59a6a2', '#e3361c', '#678098'],
          hoverBackgroundColor: ['#f78d08', '#59a6a2', '#e3361c', '#678098'],
          hoverBorderWidth: 5
        }, {
          data: [85, 98, 73, 109],
          backgroundColor: ['#fbc683', '#8bc1be', '#f19b8e', '#94a6b7'],
          borderColor: ['#fbc683', '#8bc1be', '#f19b8e', '#94a6b7'],
          hoverBorderColor: ['#f78d08', '#59a6a2', '#e3361c', '#678098'],
          hoverBackgroundColor: ['#f78d08', '#59a6a2', '#e3361c', '#678098'],
          hoverBorderWidth: 5
        }]
      },
      options: {
		
        events: ["mouseout", "click", "touchstart", "touchmove", "touchend"],
        responsive: false,
        legend: {
          position: 'left',
          align: 'center',
          fontSize: '2px'
        },
        label: {
          align: 'start'
        },
        cutoutPercentage: 0
      }
    })
  </script>

</body>
</html>