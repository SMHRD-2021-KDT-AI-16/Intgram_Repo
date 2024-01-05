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
  <link rel="stylesheet" href="css/carbon.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script src="js/script.js" type="module" defer></script>
  <script src="js/menu_min510.js" defer></script>
  <script src="js/mouseover.js" defer></script>
  <title>TEAM Intgram</title>
  <style>
    .climate-map-area {
      width: 90%;
      height: 80%;
    }
    body > div.contents > header > section.menu-wrapper > nav > a > span {
    	font-family: 'S-CoreDream-3Light';
    }
  </style>
</head>

<body>
  <div class="contents">
    <header class="menu">
      <div class="logo">
        <div>
          <img src="img/logo.png" width=300px height=300px>
        </div>
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

      <!-- 비동기 방식으로 로그인 화면 이동 -->
      <section id="login-screen" style="display: none"></section>

      <!-- 비동기 방식으로 회원가입 화면 이동 -->
      <section id="join-screen" style="display: none"></section>
    </header>
  </div>

  <div class="carbon-container">
    <section class="carbon-part1">
      <div class="carbon-part1-top">
        <div class="carbon-part1-top-left">
          <div class="carbon-part1-top-left-head">
            <h2 class="carbon-title"><span id="part1_year"></span>년 총 탄소 배출량</h2>
            <select name="year">
              <option value="2020">2020</option>
              <option value="2019">2019</option>
              <option value="2018">2018</option>
              <option value="2017">2017</option>
              <option value="2016">2016</option>
              <option value="2015">2015</option>
              <option value="2014">2014</option>
              <option value="2013">2013</option>
              <option value="2012">2012</option>
              <option value="2011">2011</option>
              <option value="2010">2010</option>
            </select>
          </div>
          <div class="temp">
            <div class="emit-list-item">
              <div class="img">
                <img src="img/tot.png" alt="총계이미지" />
                <p>총계</p>
              </div>
              <div class="txt" id="total">
                <p id='total_Emission'>총 배출량 : 314,173,770 tonCO2eq</p>
                <p id='total_Absorption'>산림흡수량 : 164,452,476 tonCO2eq</p>
                <p id='total_NetEmission'>순 배출량 : 164,452,476 tonCO2eq</p>
              </div>
            </div>
          </div>          
        </div>
        <div class="carbon-part1-top-right">
          <div class="carbon-part1-top-left-head">
            <h2 class="carbon-title">2030년 목표 탄소 배출량</h2>            
          </div>
          <div class="temp">
            <div class="emit-list-item"  id="div_2">
              <div class="img">
                <img src="img/tot.png" alt="총계이미지" />
                <p>총계</p>
              </div>
              <div class="txt" id="total">
                <p id='total_Emission'>목표 배출량 : 314,173 tonCO2eq</p>
              </div>
            </div>
          </div>          
        </div>
      </div>
      <div class="carbon-part1-bottom">
          <h2 class="carbon-title">목표까지 남은 탄소감축량</h2>  
       <div class="emit-list-item_3"> 
         <h2>319,727,000 tonCO2eq</h2> <span>만큼 탄소를 감축해야 합니다</span>
      </div> 
      </div>
      
      <div class="carbon-part1-bottom">
        <h2 class="carbon-title"  id="first_3">연도별 탄소배출 현황</h2>
        <canvas id="yearCarbonChart" height="130px"></canvas>
      </div>
    </section>
    <section class="carbon-part2">
      <div class="season">
        <h2 class="carbon-title">온실가스 비중(%)</h2>
        <canvas id="gasPieChart"></canvas>
      </div>
      <div class="carbon carbon">
        <h2 class="carbon-title">배출원별 비중(%)</h2>
        <canvas id="myPieChart"></canvas>
      </div>
    </section>
    <section class="carbon-part3">
      <div class="map">
        <h2 class="carbon-title">지역별 탄소 배출 변화</h3>
          <div class="carbon-map-area">
            <iframe src="components/map.html" width="500px" height="750px" frameborder='0' scrolling="no"></iframe>
          </div>          
      </div>
    </section>
  </div>
  <script src="js/temperature.js" defer></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  <script src="js/dashboard-apis.js" type="module" defer></script>
  <script src="js/emitYear.js" defer></script>
  <script src="js/script.js" type="module" defer></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <script>
    //import 'https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js';
    //import 'https://code.jquery.com/jquery-3.7.1.min.js';

    let background_Color = ['rgb(79, 132, 254, 1)',
      'rgb(118, 159, 254, 1)',
      'rgb(157, 186, 255, 1)',
      'rgb(196, 214, 255, 1)',
      'rgb(235, 241, 255, 1)']

    // 온실가스 비중

    let r = 0
    function update_ctx() {
      gasPieChart.options.rotation = r
      r += 3
      gasPieChart.update();
    }

    var ctx = document.getElementById('gasPieChart').getContext('2d');
    var cpc = document.getElementById('myPieChart').getContext('2d');
    var ycc = document.getElementById('yearCarbonChart').getContext('2d');
    setInterval(() => {
      update_ctx()
    }, 300)
    let ch4_data = []
    let co2_data = []
    let n2o_data = []
    fetch("json/gas.json")
      .then((res) => {
        return res.json()
      })
      .then((obj) => {
        console.log(obj)
        for (let i = 0; i < obj.length; i++) {
          if (obj[i]['year'] == 2020) {
            ch4_data.push(obj[i]['CH4'])
            co2_data.push(obj[i]['CO2'])
            n2o_data.push(obj[i]['N2O'])
          }
        }
      })

    let gasPieChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        labels: ['CO₂', 'CH₄', 'N₂O'],
        datasets: [{
          data: [co2_data, ch4_data, n2o_data],
          backgroundColor: [
            '#ff9999',
            '#8FD9B6',
            '#b5cde1']
        }]
      },
      options: {
        responsive: false,
        plugins: {
          legend: {
            position: 'right'
          }
        }
      }
    })
    // 년도별 탄소배출 현황
    let select_year = 2020
    drawChart(select_year)
    $("select[name=year]").change(function () {
      select_year = $(this).val()
      drawChart(select_year)
      
    });
    function drawChart(select_year) {
      $.ajax({
        url: 'https://api.odcloud.kr/api/15049589/v1/uddi:779e44b1-25d9-48a8-bb63-8a90148adf9a?page=1&perPage=144&serviceKey=2dzr5Pgj1lthBgwtsb98tVqVqURheXyse3jsH2m7Zyp0JJxEXsduX39%2BqWsmKP8YJR30bUA2aHmq%2F3%2FL18m5CA%3D%3D',
        success: function (result) {
          console.log("result");
          console.log(result);

          let temp = result
          let select_data = []

          select_data.push(result.data[0])
          select_data.push(result.data[1])
          select_data.push(result.data[2])
          select_data.push(result.data[37])
          select_data.push(result.data[65])
          select_data.push(result.data[129])
          select_data.push(result.data[102])
          let year_label = []
          for (let i = 0; i < 31; i++) {
            year_label.push(i + 1990)
          }
          /*   0 - 총배출량    1 - 순배출량    2 - 에너지
              37 - 산업공정   65 - 농업      102 - LULUCF    129 - 폐기물  */
          document.getElementById('part1_year').innerHTML = select_year
          document.getElementById('total_Emission').innerHTML =
            "<p id = 'total_Emission'>총 배출량 : " +
            parseInt(select_data[0][select_year]).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +
            ' tonCO2eq</p>';
          document.getElementById('total_Absorption').innerHTML =
            "<p id = 'total_Absorption'>흡수량 : " +
            parseInt(select_data[6][select_year]).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +
            ' tonCO2eq</p>';
          document.getElementById('total_NetEmission').innerHTML =
            "<p id = 'total_NetEmission'>순 배출량 : " +
            parseInt(select_data[1][select_year]).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') +
            ' tonCO2eq</p>';

          data_nonIron = Object.keys(result.data[0]);
          var yearCarbonChart = new Chart(ycc, {
            type: 'bar',
            data: {
              labels: year_label,
              datasets: [
                {
                  type: 'line',
                  label: result.data[0]['분야 및 연도'],
                  data: Object.values(result.data[0]),
                  backgroundColor: ['rgba(0, 0, 0, 1)'],
                  borderColor: 'rgba(0, 0, 0, 1)',
                  borderWidth: 1,
                }, { // 에너지
                  label: result.data[2]['분야 및 연도'],
                  data: Object.values(result.data[2]),
                  backgroundColor: background_Color[0],
                  borderColor: background_Color[0]
                }, { // 산업공정
                  label: result.data[37]['분야 및 연도'],
                  data: Object.values(result.data[37]),
                  backgroundColor: background_Color[1],
                  borderColor: background_Color[1],
                }, { // 농업
                  label: result.data[65]['분야 및 연도'],
                  data: Object.values(result.data[65]),
                  backgroundColor: background_Color[2],
                  borderColor: background_Color[2]
                }, { // 폐기물
                  label: result.data[129]['분야 및 연도'],
                  data: Object.values(result.data[129]),
                  backgroundColor: background_Color[3],
                  borderColor: background_Color[3]
                }, { // LULUCF
                  label: result.data[102]['분야 및 연도'],
                  data: Object.values(result.data[102]),
                  backgroundColor: '#00d27a',
                  borderColor: '#00d27a',
                  borderWidth: 1,
                }
              ],
            },
            options: {
              scales: {
                
                x: {
                  ticks: {
                    fontColor: 'black',
                    color: 'black'
                  },
                  grid: {
                    color: 'rgba(255, 255, 255, 0)'
                  },
                  stacked: true,
                },
                y: {
                  beginAtZero: true,
                  ticks: {
                    max:70000,
                    fontColor: 'black',
                    color: 'black'
                  },
                  grid: {
                    color: 'rgba(255, 255, 255, 0)'
                  },
                  stacked: true,
                }
              },
              plugins: {
                legend: {
                  labels: {
                    fontSize: 5,
                    color: 'rgba(0, 0, 0, 1)'
                  },
                },
              },
            },
          });
          // 배출원별 비중
          var myPieChart = new Chart(cpc, {
            type: 'pie',
            data: {
              labels: ['에너지', '산업공정', '농업', '폐기물'],
              datasets: [{
                data: [result.data[2]['2020'],
                result.data[37]['2020'],
                result.data[65]['2020'],
                result.data[129]['2020']],
                backgroundColor: [
                  background_Color[0],
                  background_Color[1],
                  background_Color[2],
                  background_Color[3]]
              }]
            },
            options: {
              responsive: false,
              plugins: {
                legend: {
                  position: 'bottom'
                },
                showValue: {
                  fontSize: 20
                }
              }
            }
          });
        },
        error: function () {
          console.log('통신실패');
        },
      });
    }



  </script>
</body>
</html>