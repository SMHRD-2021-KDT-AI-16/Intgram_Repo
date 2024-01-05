<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.intgram.model.Co2VO"%>
<%@ page import="com.intgram.model.MemberVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- <link rel="stylesheet" href="../css/style.css" /> -->
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>TEAM Intgram</title>
<script type="module" src="js/script.js" defer></script>
<script src="js/menu_min510.js" defer></script>
<script src="js/mouseover.js" defer></script>
<script src="js/jquery-3.7.1.min.js" defer></script>
<style>
	.inputdown-transport {
		z-index = 100;
	}
</style>

</head>
<body>
	<div class="contents off">
		<header class="menu">
			<div class="logo">
				<img src="img/logo.png" width=300px height=300px>
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
							href="netzero_climate.jsp"
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
					    <a class="login-menu-link" href="components/join.html"> 
					       <i class="fa-solid fa-arrow-right-to-bracket"></i> <span>Register</span>
					    </a>
					</c:if>
				</nav>
			</section>

			<a href="#" class="navbar__toggleBtn"> <i
				class="fa-solid fa-bars"></i>
			</a>

			<!-- 비동기 방식으로 로그인 화면 이동 -->
			<section id="login-screen" style="display: none"></section>

			<!-- 비동기 방식으로 회원가입 화면 이동 -->
			<section id="join-screen" style="display: none"></section>
		</header>
	</div>

	<main class="calc-container off">	
		<section class="calc-header">
			<article>
				<form action="CalculateService" method="post">
					<div class="input-list">
						<h1>운행일자</h1>
						<input type="text" placeholder="20240105" />
					</div>

					<div class="transport">
                  <h1>운송수단을 선택해주세요</h1>
                  <div class="inputdown inputdown-transport">
                     <select class="inputdown-toggle transport-toggle">
                        <option class="inputdown-option transport-option"
                           name="transport" value="차량">차량</option>
                        <option class="inputdown-option transport-option"
                           name="transport" value="선박">선박</option>
                        <option class="inputdown-option transport-option"
                           name="transport" value="철도">철도</option>
                        <option class="inputdown-option transport-option"
                           name="transport" value="항공기">항공기</option>
                     </select>
                  </div>
               </div>

               <div class="fuel">
                  <h1>사용연료를 선택해주세요</h1>
                  <div class="inputdown inputdown-transport">
                     <select class="inputdown-toggle transport-toggle">
                        <option class="inputdown-option transport-option" name="fuel"
                           value="경유">경유</option>
                        <option class="inputdown-option transport-option" name="fuel"
                           value="중유">중유</option>
                        <option class="inputdown-option transport-option" name="fuel"
                           value="휘발유">휘발유</option>
                        <option class="inputdown-option transport-option" name="fuel"
                           value="LPG">LPG</option>
                     </select>
                  </div>
               </div>
               <div class="input-list">
               		<h1>연료량</h1>
						<input type="text" name="amount" />
			   </div>
			   <div class="inputSave" align="center">
			      <input type="submit" value="저장" class="inputSave-btn next-btn" />
			   </div>
				</form>
			</article>
			<div class="calc-line"></div>
		</section>

		<section class="calc-outputArea">
			<div class="calc-header-title">
				<p>
					<span>${member.mem_name}</span> <span>님의</span> <span id='year'>2023</span><span>년 탄소배출
						현황</span> <span id='buttontest'></span>
						<select name='year'>
							<option>2023</option>
							<option>2021</option>
							<option>2020</option>
						</select>
				</p>
			</div>
			<div class="calc-header-board">
				<div class="calc-nowEmit">
					<p class="calc-emit__text">
						<i class="fa-solid fa-face-smile"></i> 현재 탄소 배출량
					</p>
					<p class="calc-emit__amount">					
						<span id='totalE'></span><span>tonCO<sub>2</sub>eq
						</span>
					</p>
				</div>

				<div class="calc-goalEmit">
					<p class="calc-emit__text">
						<i class="fa-solid fa-pen-to-square"></i> 목표 탄소 배출량
					</p>
					<p class="calc-emit__amount">
						1억 4천 5백만<span>CO<sub>2</sub>eq
						</span>
					</p>
				</div>
			</div>

			<article class="calc-outputs">
				<div class="calc-outputChart1">
					<p class="output-title">
						<i class="fa-solid fa-user"></i> 월별 탄소 배출량
					</p>
					<canvas id="userCarbonChart" width="500px" height="250px">
					</canvas>
				</div>
				<div class="calc-outputChart2">
					<p class="output-title">
						<i class="fa-solid fa-building"></i> 기업의 탄소 배출량
					</p>
					<canvas id="allCarbonChart">
					</canvas>
				</div>
			</article>
		</section>
	</main>
	<!--  -->
	<div class="screen-alert">화면 크기를 늘여주세요🙏</div>

	<script src="../js/script.js" type="module" defer></script>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

	<script>
	//
			const toggleBtn = document.querySelector('.navbar__toggleBtn');
			const SIDE_MENU = document.querySelector('.menu-wrapper');
			const LOGIN_AREA = document.getElementById('login-area');

			toggleBtn.addEventListener('click', () => {
				console.log('click!');
				SIDE_MENU.classList.toggle('active');
				LOGIN_AREA.classList.toggle('active');
			});
	</script>	
	<script>
	
	let year_test = 2023
	<%
		float total = 0;
		int[] year = new int[3];
		float[] month = new float[12];
		String returnData = "";
		if(session.getAttribute("member") != null) {
			List<Co2VO> l_co2 = (List<Co2VO>)session.getAttribute("member_data");
			
			for(int i = 0; i < l_co2.size(); i++) {
				String date = l_co2.get(i).getDriving_date();
				System.out.println((i + 1 ) + " = " + date + " : " + l_co2.get(i).getTotal_emission());
				
				String[] temp = date.split("-");
				for(int j = 0; j < 12; j++) {
					if(Integer.parseInt(temp[1]) == (j + 1) && Integer.parseInt(temp[0]) == 2023) {
						//System.out.println((j + 1) + " 월 " + temp[1]);
						//System.out.println(l_co2.get(i).getTotal_emission());
						month[j] += l_co2.get(i).getTotal_emission();
						total += (l_co2.get(i)).getTotal_emission();
					}
				}	
				for(int j = 0; j < 3; j++) {
					if(Integer.parseInt(temp[0]) == 23) {
						year[j] += l_co2.get(i).getTotal_emission();
					}
				}
			}			
		}
		for(int i = 0; i < 12; i++) {
			returnData += month[i] + "/";
		}
		//System.out.println(l_co2);

	%>
		var temp = 	'<%= total %>'
		returnData = '<%= returnData %>'
		var month_data = []
		month_data = returnData.split("/")
		for(let i = 0; i < 12; i++) {			
			console.log(month_data[i])
		}
		document.querySelector('#totalE').innerHTML = temp
		$('.transport-option').on('click', (e) => {
		  console.log(e.target.value);
		})
		
			///////////////////////////////////////
			let select_year = 2023
			$("select[name=year]").change(function () {
				select_year = $(this).val()
				document.getElementById('year').innerHTML = select_year
			});
			
	 var userChart = document.getElementById('userCarbonChart').getContext('2d');
	 var allChart = document.getElementById('allCarbonChart').getContext('2d');
			
	 var userCarbonChart = new Chart(userChart, {
        type: 'line',
        data: {
          labels: ['1월', '2월', '3월', '4월', '5월', '6월',
        	  '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [
            {
              labels: '총배출량',
              type: 'line',
              data: month_data,              
              borderWidth: 1,
            }
          ],
        },
        options: {
            elements: {
              point: {
                radius: 2
              }
            },
            responsive: false,
            plugins: {
              legend: {
                position: 'top'
              }
            }
          }
      });	
	 
	</script>
</body>
</html>