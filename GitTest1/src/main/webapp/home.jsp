<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

		
      <style>
         @import url('https://fonts.googleapis.com/css2?family=Passion+One&display=swap');
         @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
               format('woff');
            font-weight: normal;
            font-style: normal;
         }

         .cloud1,
         .cloud2,
         .cloud3 {
            animation-duration: 2s;
            animation-timing-function: ease-out;
            animation-direction: alternate;
            animation-iteration-count: infinite;
            animation-fill-mode: none;
            animation-play-state: running;
         }
         .cloud1 {
            position: absolute;
            top: 20%;
            left: 10vw;
            max-width: 14vw;
            transform: translateX(-1vw);
            animation-name: moving;
            animation-delay: 0.5s;
         }

         .cloud2 {
            position: absolute;
            right: 29vw;
            width: 5%;
            animation-name: stretch;
            animation-delay: 0s;
         }

         .cloud3 {
            position: absolute;
            top: 24%;
            right: 7vw;
            width: 13%;
            transition: all 0.5s ease-in-out 0.5s;
            animation-name: moving;
            animation-delay: 0.8s;
         }

         .tree1,
         .tree2,
         .tree3,
         .tree4,
         .tree5,
         .tree6,
         .tree7,
         .tree8,
         .tree9,
         .tree10,
         .tree11,
         .tree12 {
            position: absolute;
         }

         .tree1 {
            bottom: 20vh;
            left: 4vw;
            z-index: 3;
         }

         .tree2 {
            bottom: 8vh;
            left: 9vw;
            z-index: 3;
         }

         .tree3 {
            bottom: 8vh;
            left: 21vw;
            z-index: 3;
         }

         .tree4 {
            bottom: 5vh;
            left: 27vw;
            z-index: 3;
         }
         .tree5 {
            left: 22vw;
            bottom: 5vh;
            z-index: 3;
         }
         .tree6 {
            right: 37vw;
            bottom: 17vh;
            z-index: 3;
         }
         .tree7 {
            right: 31vw;
            bottom: 14vh;
            z-index: 3;
         }
         .tree8 {
            right: 23vw;
            bottom: 14vh;
            z-index: 3;
         }
         .tree9 {
            right: 21vw;
            bottom: 9vh;
            z-index: 3;
         }
         .tree10 {
            right: 9vw;
            bottom: 9vh;
            z-index: 3;
         }
         .tree11 {
            right: 4vw;
            bottom: 17vh;
            z-index: 3;
         }
         .tree12 {
            right: 2vw;
            bottom: 17vh;
            z-index: 3;
         }

         .earth-img {
            background-image: url('../imgs/earth.png');
            height: 25vh;
            background-size: cover;
            background-position: top;
            max-height: 25vh;
            overflow: hidden;
            position: absolute;
            bottom: 0;
            width: 100%;
            background-repeat: no-repeat;
         }
         .earth {
            width: 1920px;
            z-index: 4;
         }

         /*keyframes*/
         @keyframes moving {
            0% {
               transform: translateX(-0.5rem);
            }

            to {
               transform: translateX(0.5rem);
            }
         }

         @keyframes moving-y {
            0% {
               transform: translateY(-0.5rem);
            }

            to {
               transform: translateY(0.5rem);
            }
         }

         @keyframes stretch {
            0% {
               transform: scale(0.9);
            }

            to {
               transform: scale(1);
            }
         }

         @keyframes move-stretch {
            0% {
               transform: translateX(-0.5rem) scale(0.9);
            }

            50% {
               transform: translateX(0.5rem) scale(0.9);
            }

            to {
               transform: scale(1);
            }
         }

         .mainHome-text {
            font-family: 'GmarketSansMedium';
            font-weight: 700;
            display: flex;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            position: relative;
            top: 150px;
         }

         .mainHome-header {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
         }

         .mainHome-header {
            animation: stretch2 4s;
         }

         .mainHome-header > p:first-child {
            font-family: 'GmarketSansMedium';
            font-weight: 700;
            margin-top: 30px;
            font-size: 40px;
         }

         .mainHome-header > p:nth-child(2) {
            margin-top: 30px;
            font-size: 28px;
            font-weight: 700;
         }

         .aLink-area {
            margin-top: 40px;
            font-size: 18px;
            animation: stretch2 4s;
         }

         @keyframes stretch2 {
            0% {
               transform: scale(0);

            }

            to {
               transform: scale(1);

            }
         }
         @keyframes stretch3 {
            0% {
               transform: scale(0);
               transform: translateY(50rem);      

            }

            to {
               transform: scale(1);
                  transform: translateY(-10.5rem);
            }
         }

         #underline {
            position: absolute;
            left: 0;
            height: 4px;
            width: 0;
            border-radius: 3px;
            transition: 0.2s;
            background-color: #61c64e;
            top: 0;
         }

         @media (min-width: 455px) and (max-width: 575px) {
            div.mainHome-text {
               font-size: 16px;
            }
         }

         .home-main {
            animation: stretch3 4s cubic-bezier(.41,.13,0,.88);
         }

      </style>

		<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	</head>
	<body>
		<script>
			AOS.init();
		</script>

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

		<main class="main-container">
			<div class="mainHome-text">
				<div class="mainHome-header">
					<p class="header-title">탄소중립 실천을 위한 대시보드</p>
					<p>CARBOARD</p>
				</div>
				<div class="aLink-area">
					<div id="underline"></div>
					<a href="home-text.jsp" class="more-link"
						>탄소중립에 대해 알아보기</a
					>
				</div>
			</div>
			<div class="home-main">
				<div class="cloud-img">
					<img src="imgs/cloud1.png" alt="" class="cloud1" />
					<img src="imgs/cloud2.png" alt="" class="cloud2" />
					<img src="imgs/cloud3.png" alt="" class="cloud3" />
				</div>
				<div class="tree-img">
					<img src="imgs/tree1.png" alt="" class="tree1" />
					<img src="imgs/tree2.png" alt="" class="tree2" />
					<img src="imgs/tree3.png" alt="" class="tree3" />
					<img src="imgs/tree4.png" alt="" class="tree4" />
					<img src="imgs/tree5.png" alt="" class="tree5" />
					<img src="imgs/tree6.png" alt="" class="tree6" />
					<img src="imgs/tree7.png" alt="" class="tree7" />
					<img src="imgs/tree8.png" alt="" class="tree8" />
					<img src="imgs/tree9.png" alt="" class="tree9" />
					<img src="imgs/tree10.png" alt="" class="tree10" />
					<img src="imgs/tree11.png" alt="" class="tree11" />
					<img src="imgs/tree12.png" alt="" class="tree12" />
				</div>
				<div class="earth-img">
					<img src="imgs/earth.png" alt="" class="earth" />
				</div>
			</div>
		</main>

		<div class="screen-alert">화면 크기를 늘여주세요🙏</div>

		<script>
			let underlineBar = document.getElementById('underline');
			let underlineMenu = document.querySelector('.more-link');

			function underLineIndicator(e) {
				underlineBar.style.width = e.offsetWidth + 'px';
				underlineBar.style.left = e.offsetLeft + 'px';
				underlineBar.style.top = e.offsetTop + e.offsetHeight + 'px';
			}

			function hideUnderLineBar() {
				underlineBar.style.width = '0';
			}

			underlineMenu.addEventListener('mouseover', function (e) {
				underLineIndicator(e.currentTarget);
			});

			underlineMenu.addEventListener('mouseleave', function () {
				hideUnderLineBar();
			});
		</script>
	</body>
</html>