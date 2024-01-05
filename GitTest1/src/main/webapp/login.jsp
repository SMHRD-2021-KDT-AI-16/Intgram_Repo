<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- <link rel="stylesheet" href="../css/style.css" /> -->
		<link rel="stylesheet" href="css/main.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <title>TEAM Intgram</title>
    <script src="js/script.js" type="module" defer></script>
    <script src="js/menu_min510.js" defer></script>
        <script src="js/mouseover.js" defer></script>
  </head>
<body>
		<div class="contents off">
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
						<a class="login-menu-link" href="login.jsp">
							<i class="fa-regular fa-circle-user"></i>
							<span>Login</span>
						</a>
						<a class="login-menu-link" href="cjoin.jsp">
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

    <main class="contents-container off">
      <form action="LoginService" method="post">
        <div id="login">
          <div class="login">
            <section class="login-title">
              <p>로그인</p>
            </section>

            <section class="login-input">
              <div class="login-input__inputs">
                <label for="">아이디</label>
                <input type="text" name="id" />
                <label for="">비밀번호</label>
                <input type="password" name="pw" />
              </div>
            </section>

            <section class="login-btn">
              <input type="submit" value="Login" />
            </section>
          </div>
          <div>
          </div>
        </div>
      </form>
    </main>
    <div class="screen-alert">화면 크기를 늘여주세요🙏</div>
    <script src="js/script.js" type="module" defer></script>
  </body>
</html>