<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<c:if test="${member==null}">
					<a class="top-menu-link" href="login.jsp"> <i
						class="fa-regular fa-circle-user"></i> <span>Login</span>
					</a>
					<a class="top-menu-link" href="join.jsp"> <i
						class="fa-solid fa-arrow-right-to-bracket"></i> <span>Register</span>
					</a>
				</c:if>
				<c:if test="${member!=null}">
				<a class="top-menu-link" href="#"> <i
						class="fa-regular fa-circle-user"></i> <span>${member.mem_name}</span>
					</a>
				
				<a class="top-menu-link" href="LogoutService"> <i
						class="fa-solid fa-arrow-right-to-bracket"></i> <span>Logout</span>
					</a>
				</c:if>
			</nav>
		</section>
		<!-- 비동기 방식으로 로그인 화면 이동 -->
		<section id="login-screen" style="display: none"></section>

		<!-- 비동기 방식으로 회원가입 화면 이동 -->
		<section id="join-screen" style="display: none"></section>

		<!--  -->
		<section id="netZero-area">
			<article class="netZero-item">
				<div class="netZero-item__title">
					<p></p>
				</div>
				<div class="netZero-item__txt"></div>
			</article>
		</section>
		<!--  -->
		<section class="contents-area">
			<article class="content-area">
				<div class="content-area__title">전국 배출, 흡수 통계</div>
				<div class="content-area__select">
					<select id="emitYear" name="eYear">
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
						<option selected>2021</option>
					</select> <span>년 전국 기준</span>
				</div>
			</article>
			<article class="emit-list-area">
				<div class="emit-list">
					<div class="emit-list-item">
						<div class="img">
							<img src="img/tot.png" alt="총계이미지" />
							<p>총계</p>
						</div>
						<div class="txt" id="total">
							<p>
								배출량 : <br />314,173,770 tonCO2eq
							</p>
							<p>
								흡수량 : <br />164,452,476 tonCO2eq
							</p>
						</div>
					</div>
					<div class="emit-list-item">
						<div class="img">
							<img src="img/tot.png" alt="총계이미지" />
							<p>총계</p>
						</div>
						<div class="txt" id="total">
							<p>
								배출량 : <br />314,173,770 tonCO2eq
							</p>
							<p>
								흡수량 : <br />164,452,476 tonCO2eq
							</p>
						</div>
					</div>
					<div class="emit-list-item">
						<div class="img">
							<img src="img/tot.png" alt="총계이미지" />
							<p>총계</p>
						</div>
						<div class="txt" id="total">
							<p>
								배출량 : <br />314,173,770 tonCO2eq
							</p>
							<p>
								흡수량 : <br />164,452,476 tonCO2eq
							</p>
						</div>
					</div>
				</div>
			</article>
		</section>
		<section class="emitCharts-area">
			<article class="emitChart-area">
				<div class="emitChart-area__title">탄소배출량 현황</div>
				<div class="emitChart-area__canvas">
					<canvas id="myChart" width="100%"></canvas>
				</div>
			</article>
		</section>
	</main>
</body>
</html>