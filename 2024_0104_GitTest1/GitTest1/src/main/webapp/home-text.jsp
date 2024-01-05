<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Document</title>
		<link rel="stylesheet" href="css/main.css" />
		<link
			rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
			integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
			crossorigin="anonymous"
			referrerpolicy="no-referrer"
		/>
		<script src="js/dashboard-apis.js" type="module" defer></script>
		<script src="js/emitYear.js" defer></script>
		<script src="js/script.js" type="module" defer></script>
		<script src="js/menu_min510.js" defer></script>
		<script src="js/mouseover.js" defer></script>

		<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

		<style>
			@keyframes fadeIn {
				from {
					opacity: 0;
				}
				to {
					opacity: 1;
				}
			}

			.netzero-h1,
			.netzero_detail > p,
			.netzero-img {
				animation: fadeIn 3s;
			}

			.netzero_detail > p {
				animation-delay: 300;
			}

			.netzero-img {
				animation-delay: 450;
			}
		</style>
	</head>
	<body>
		<script>
			AOS.init();
		</script>


		<div class="contents off">
			<header class="menu">
				<div class="logo">
					<img src="img/logo.png" class="logo_img" />
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
						<a class="login-menu-link" href="components/login.html">
							<i class="fa-regular fa-circle-user"></i>
							<span>Login</span>
						</a>
						<a class="login-menu-link" href="components/join.html">
							<i class="fa-solid fa-arrow-right-to-bracket"></i>
							<span>Register</span>
						</a>
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

		<main class="home-container">
			<section class="home-area">
				<div class="netzero_detail">
					<h1 class="netzero-h1" data-aos="fade-up">WHAT IS NET ZERO?</h1>
					<br />
					<br />
					<p data-aos="fade-up" data-aos-delay="100">
						대기 중 온실가스 농도 증가를 막기 위해 인간 활동에 의한 배출량을
						감소시키고,<br />
						흡수량을 증대하여 순배출량이 ‘0’이 되는 것을<br />
						<strong>탄소중립</strong> 혹은
						<strong>‘넷제로(Net-Zero)’</strong>라고 말합니다. <br />우리나라는
						2050년을 목표로 탄소중립을 이루기 위해 노력하고 있습니다.
					</p>
				</div>
				<img
					src="imgs/zerolife2_img.png"
					alt="탄소중립정의"
					class="netzero-img"
				/>
			</section>

			<section class="home-area">
				<div class="netzero_bg">
					<h1 class="netzero-h1" data-aos="fade-right">탄소중립 추진배경</h1>

					<p data-aos="fade-right" data-aos-delay="100">
						국제사회는 인간이 배출한 온실가스에 따른 지구온난화에 대한 심각성을
						인식하고, <br />기후 위기에 대응하기 위해 노력하고 있습니다.
						<br />
						기후변화협약(1992년)을 맺고 교토의정서(1997년)와 파리협정(2015년)
						채택을 통해<br />
						지구 평균기온 상승 억제를 논의해왔습니다.
					</p>
				</div>

				<div class="netzero_conference">
					<div class="conference_history">
						<div class="conf_title" data-aos="fade-right" data-aos-delay="100">
							<p>1992년</p>
						</div>
						<div class="conf_detail" data-aos="fade-right" data-aos-delay="100">
							<p>유엔기후변화협약 UNFCCC</p>
							<p>
								- UN주관의 기후변화에 대한 선언적 국제연합 기본협약 (강제사항
								없음)
							</p>
							<p>
								- 가입 당사국들은 각각 자국의 실정에 알맞은 온실가스 배출량
								감축을 위한 국가 정책 수립·시행
							</p>
							<p>
								- 온실가스 배출량 및 흡수량에 대한 국가통계와 정책이행에 관한
								보고서 제출
							</p>
						</div>
					</div>

					<div class="conference_history">
						<div class="conf_title" data-aos="fade-right" data-aos-delay="200">
							<p>1997년</p>
						</div>
						<div class="conf_detail" data-aos="fade-right" data-aos-delay="200">
							<p>교토의정서</p>
							<p>
								- UN주관의 기후변화에 대한 선언적 국제연합 기본협약 (강제사항
								없음)
							</p>

							<p>
								- 가입 당사국들은 각각 자국의 실정에 알맞은 온실가스 배출량
								감축을 위한 국가 정책 수립·시행
							</p>
							<p>
								- 온실가스 배출량 및 흡수량에 대한 국가통계와 정책이행에 관한
								보고서 제출
							</p>
						</div>
					</div>

					<div class="conference_history">
						<div class="conf_title" data-aos="fade-right" data-aos-delay="300">
							<p>2015년</p>
						</div>
						<div class="conf_detail" data-aos="fade-right" data-aos-delay="300">
							<p>파리협정</p>
							<p>
								- UN주관의 기후변화에 대한 선언적 국제연합 기본협약 (강제사항
								없음)
							</p>
							<p>
								- 가입 당사국들은 각각 자국의 실정에 알맞은 온실가스 배출량
								감축을 위한 국가 정책 수립·시행
							</p>
							<p>
								- 온실가스 배출량 및 흡수량에 대한 국가통계와 정책이행에 관한
								보고서 제출
							</p>
						</div>
					</div>

					<div class="conference_history">
						<div class="conf_title">
							<p data-aos="fade-right" data-aos-delay="400">2018년</p>
						</div>
						<div class="conf_detail" data-aos="fade-right" data-aos-delay="400">
							<p>IPCC 1.5°C 특별보고서 채택</p>
							<p>
								- UN주관의 기후변화에 대한 선언적 국제연합 기본협약 (강제사항
								없음)
							</p>
							<p>
								- 가입 당사국들은 각각 자국의 실정에 알맞은 온실가스 배출량
								감축을 위한 국가 정책 수립·시행
							</p>
							<p>
								- 온실가스 배출량 및 흡수량에 대한 국가통계와 정책이행에 관한
								보고서 제출
							</p>
						</div>
					</div>
				</div>
			</section>

			<section class="home-area">
				<div class="netzero_goal">
					<h1 class="netzero-h1" data-aos="zoom-in" data-aos-delay="100">
						왜 지구 온도상승을 1.5℃ 이내로 억제하는 목표를 설정했나요?
					</h1>

					<div class="netzero_goals">
						<div class="goals-img">
							<img
								src="imgs/zerolife2_bg3.png"
								alt="온도계"
								data-aos="zoom-in"
								data-aos-delay="200"
							/>
						</div>
						<div class="goals-text">
							<div
								class="netzero_goal_temp"
								data-aos="zoom-in"
								data-aos-easing="ease-in-back"
								data-aos-delay="300"
								data-aos-offset="0"
							>
								<p>2°C 상승</p>
								<p>
									- 해수면 상승<br />
									- 생태계 파괴<br />
									- 이상 기후<br />
									- 건강 악화, 인구 감소
								</p>
							</div>
							<div
								class="netzero_goal_temp"
								data-aos="zoom-in"
								data-aos-easing="ease-in-back"
								data-aos-delay="300"
								data-aos-offset="0"
							>
								<p>1.5°C 상승</p>
								<p>
									- 평균 온도 상승<br />
									- 호우 및 가뭄 피해 증가<br />
									- 해양 · 어획량 피해<br />
									- 생태계 절반 이상 상실
								</p>
							</div>
						</div>
					</div>

					<div
						class="netzero_goal_detail"
						data-aos="fade-up"
						data-aos-anchor-placement="center-bottom"
						data-aos-delay="400"
					>
						<p>
							<strong>기후저지선</strong>은 인류 생존 및 생태계 보전을 담보하기
							위해<br />
							넘지 말아야 할 최후의 한계선을 뜻합니다.
						</p>

						<p>
							지구 평균기온이 2℃ 상승할 경우<br /><strong
								>‘돌이킬 수 없는’</strong
							>
							기후변화가 나타날 수 있다는 사실이 받아들어져<br />
							2015년 파리협정 체결시 1.5℃가 기준선이 되었습니다.
						</p>
					</div>
				</div>
			</section>

			<section class="home-area">
				<h1 class="netzero-h1" data-aos="fade-up" data-aos-delay="500">
					탄소중립은 왜 <span>2050</span>년이 목표인가요?
				</h1>

				<div class="netzero-2050">
					<div class="netzero_paris" data-aos="fade-up" data-aos-delay="600">
						<img src="imgs/2015_Climate_Conference.png" alt="파리협정" />

						<p>파리협정</p>
						<p>
							2015년 12월 파리협정에서는 산업혁명 이전 (1850~1900년 평균) 대비
							2°C보다 훨씬 아래로 유지하고, 나아가 1.5°C 아래로 억제하기 위해
							노력해야한다는 목표를 설정하였습니다
						</p>
					</div>

					<div class="netzero_report" data-aos="fade-up" data-aos-delay="700">
						<img src="imgs/carbon2.jpg" alt="지구온난화 1.5°C 특별보고서" />
						<p>지구온난화 1.5°C 특별보고서</p>

						<p>
							IPCC는 2018년 발표한 1.5도 특별보고서를 통해 지구 평균온도 상승을
							1.5°C 이내로 억제하기 위해서는 전 지구적으로 2030년까지 온실가스
							배출량을 2010년 대비 45% 이상 감축해야 하고, 2050년에는 탄소중립을
							달성해야 한다고 제시했습니다, 이에 국제사회에서는 2050년 탄소배출
							중립 목표를 이루기 위해 많은 노력을 기울이고 있습니다
						</p>
					</div>
					<div class="netzero_korea" data-aos="fade-up" data-aos-delay="800">
						<img src="imgs/carbon3.png" alt="2050 탄소중립 선언" />
						<p>2050 탄소중립 선언</p>
						<p>
							우리나라는 국제사회의 노력에 동참하고 건강한 미래를 만들기 위해
							2020년 10월 28일 '2050년 탄소중립 선언' 및 12월 10일 '2050
							탄소중립 비전'을 선포하였습니다.
						</p>
					</div>
				</div>
			</section>
		</main>

		<div class="screen-alert">화면 크기를 늘여주세요🙏</div>
	</body>
</html>