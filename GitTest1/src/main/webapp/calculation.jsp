<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>TEAM Intgram</title>
</head>
<body>
	<div class="contents">
		<aside class="menu">
			<span class="logo">{ Intgram }</span>
			<section class="menu-wrapper">
				<nav class="side-menu">
					<a class="menu-link" href="#"> <i class="fa-solid fa-house"></i>
						<span>Home</span>
					</a> <a class="menu-link" href="netzero.jsp"> <i
						class="fa-solid fa-seedling"></i> <span>Dashboard</span>
					</a> <a class="menu-link" href="archive.jsp"> <i
						class="fa-solid fa-file-zipper"></i> <span>Newsfeed</span>
					</a> <a class="menu-link" href="calculation.jsp"> <i
						class="fa-solid fa-calculator"></i> <span>Calculation</span>
					</a>
				</nav>
			</section>
		</aside>
	</div>
	<main class="contents-container">
		<section id="login-area" class="contents-header__login">
			<nav class="top-menu">
				<a class="top-menu-link" href="#"> <i
					class="fa-regular fa-circle-user"></i> <span>Welcome User</span>
				</a> <a class="top-menu-link" href="#"> <i
					class="fa-solid fa-arrow-right-from-bracket"></i> <span>Logout</span>
				</a>
			</nav>
		</section>
		<!--  -->
		+
		<section id="calc-area" class="calc-area">
			<!-- 운행일자 운송수단 사용연료 연료량 -->
			<div class="calc-trans">
				<nav class="calc-trans-list">
					<div class="calc-trans-item">
						<i class="fa-solid fa-plane"></i> <span>Flights</span>
					</div>
					<div class="calc-trans-item">
						<i class="fa-solid fa-car"></i> <span>Cars</span>
					</div>
					<div class="calc-trans-item">
						<i class="fa-solid fa-train"></i> <span>Train</span>
					</div>
				</nav>
			</div>
			<div class="calc-fuel">
				<nav class="calc-fuel-list">
					<div class="calc-fuel-item">
						<i class="fa-solid fa-gas-pump"></i> <span>Diesel</span>
						<!-- 경유 -->
					</div>
					<div class="calc-fuel-item">
						<i class="fa-solid fa-gas-pump"></i> <span>Kerosene</span>
						<!-- 등유 -->
					</div>
					<div class="calc-fuel-item">
						<i class="fa-solid fa-gas-pump"></i> <span>Gasoline</span>
						<!-- 휘발유 -->
					</div>
				</nav>
			</div>
			<div class="calc-FE fuelEfficiency">
				<div class="calc-FE__input">
					<label>Fuel Efficiency</label> <input type="number" />
				</div>
			</div>
			<div class="calc-date">
				<div class="calc-date__input">
					<label>Driving date</label> <input type="text"
						placeholder="예: 20240105" />
				</div>
			</div>
		</section>

		<section id="chart-area" class="chart-area">
			<p>월별현황</p>
			<p>연도별현황</p>
		</section>
	</main>
</body>
</html>