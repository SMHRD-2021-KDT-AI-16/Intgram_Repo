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
				<img src="img/logo.png" class="logo_img">
			</div>

			<section class="menu-wrapper">
					<nav class="side-menu">
						<div id="horizontal-underline"></div>
						<a class="menu-link" href="components/home.html">
							<i class="fa-solid fa-house"></i>
							<span>Home</span>
						</a>
						<a class="menu-link dropdown-toggle" href="components/netzero_carbon.html">
							<i class="fa-solid fa-seedling"></i>
							<span>Carbon Dashboard</span>
						</a>
						<a class="menu-link dropdown-toggle" href="components/netzero_climate.html" >
							<i class="fa-solid fa-seedling"></i>
							<span>Climate Dashboard</span>
						</a>
						<a class="menu-link" href="components/archive.html">
							<i class="fa-solid fa-file-zipper"></i>
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

					<h1>운송수단을 선택해주세요</h1>
					<div class="inputdown inputdown-transport">
						<button name = "transportation" type="button" class="inputdown-toggle transport-toggle">
							운송수단 선택하기</button>

						<ul class="inputdown-menu transport-menu">
							<li class="inputdown-item transport-item">
								<button type="button" class="inputdown-option transport-option"
									name = transportation value="차량" data-value="차량">차량</button>
							</li>							
							<li class="inputdown-item transport-item">
								<button type="button" class="inputdown-option transport-option"
									name = transportation value="철도" data-value="철도">철도</button>
							</li>	
							<li class="inputdown-item transport-item">
								<button type="button" class="inputdown-option transport-option"
									name = transportation value="선박" data-value="선박">선박</button>
							</li>
							<li class="inputdown-item transport-item">
								<button type="button" class="inputdown-option transport-option"
									name = transportation value="항공기" data-value="항공기">항공기</button>
							</li>
						</ul>
					</div>

					<h1>사용연료를 선택해주세요</h1>
					<div class="inputdown inputdown-fuel">
						<button name = "fuel_name" value = "" type="button" class="inputdown-toggle fuel-toggle">
							사용연료 선택하기</button>

						<ul class="inputdown-menu fuel-menu" >
							<li class="inputdown-item fuel-item">
								<button type="button" class="inputdown-option fuel-option"
									data-value="경유">경유</button>
							</li>
							<li class="inputdown-item fuel-item">
								<button type="button" class="inputdown-option fuel-option"
									data-value="중유">중유</button>
							</li>
							<li class="inputdown-item fuel-item">
								<button type="button" class="inputdown-option fuel-option"
									data-value="휘발유">휘발유</button>
							</li>
							<li class="inputdown-item fuel-item">
								<button type="button" class="inputdown-option fuel-option"
									data-value="LPG">LPG</button>
							</li>
						</ul>
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
					<span>${member.mem_name}</span> <span>님의</span> <span>2023년 12월 탄소배출
						현황</span> <span id='buttontest'></span>
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
						<i class="fa-solid fa-user"></i> 개인의 탄소 배출량
					</p>
					<canvas id="userCarbonChart">
					</canvas>
				</div>
				<div class="calc-outputChart2">
					<p class="output-title">
						<i class="fa-solid fa-building"></i> 기업의 탄소 배출량
					</p>
					<canvas>
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
	<%
		float total = 0;
		if(session.getAttribute("member") != null) {
			List<Co2VO> l_co2 = (List<Co2VO>)session.getAttribute("member_data");
			for(int i = 0; i < l_co2.size(); i++) {
				
				total += (l_co2.get(i)).getTotal_emission();
			}
		}
		//System.out.println(l_co2);

	%>
		var temp = 	'<%= total %>'
		var temp2 = parseInt(temp)
		
		document.querySelector('#totalE').innerHTML = temp
		console.log(temp)
		$('.transport-option').on('click', (e) => {
		  console.log(e.target.value);
		})
		function transClick() {
			document.querySelector('.inputdown-fuel').style.display = 'none';
		}
			const transport = document.querySelector('.inputdown-transport');
			const transportToggleBtn = document.querySelector('.transport-toggle');
			const transportMenu = document.querySelector('.transport-menu');
			const transportOptions = document.querySelectorAll('.transport-option');

			transportToggleBtn.addEventListener('click', function () {
				transportMenu.classList.toggle('show');
			});
			transportToggleBtn.addEventListener('blur', function () {
				transportMenu.classList.remove('show');
			});

			transportOptions.forEach(function (item) {
				item.addEventListener('click', function (e) {
					const buttonLabel = e.currentTarget.textContent.trim();
					transportToggleBtn.textContent = buttonLabel;
					transportToggleBtn.classList.add('selected');
				});
			});

			///////////////////////////////////////
			const fuel = document.querySelector('.inputdown-fuel');
			const fuelToggleBtn = document.querySelector('.fuel-toggle');
			const fuelMenu = document.querySelector('.fuel-menu');
			const fuelOptions = document.querySelectorAll('.fuel-option');

			fuelToggleBtn.addEventListener('click', function () {
				fuelMenu.classList.toggle('show');
			});
			fuelToggleBtn.addEventListener('blur', function () {
				fuelMenu.classList.remove('show');
			});

			fuelOptions.forEach(function (item) {
				item.addEventListener('click', function (e) {
					const buttonLabel = e.currentTarget.textContent.trim();
					fuelToggleBtn.textContent = buttonLabel;
					fuelToggleBtn.classList.add('selected');
				});
			});

			///////////////////////////////////////
	 var userChart = document.getElementById('userCarbonChart').getContext('2d');
			
	var userCarbonChart = new Chart(userChart, {
        type: 'line',
        data: {
          labels: ['1월', '2월', '3월', '4월', '5월', '6월',
        	  '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [
            {
              type: 'line',
              data: [temp2,temp2,temp2,temp2,temp2,temp2,temp2,temp2,temp2,temp2,temp2,temp2],              
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