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

		<main id="login">
			<div class="login">
				<section class="login-title">
					<p>Welcome Login</p>
				</section>
				<section class="login-input">
					<!-- <div class="login-userType">
							<span>Enterprise</span>
							<span>Individual</span>
						</div> -->
					<form action="LoginService" method="post">
					<div class="login-input__inputs">
						<input name="id" type="text" placeholder="ID" />
						<input name="pw"		type="password"  placeholder="Password"/>
					</div>
					<div class="login-input__checkbox">
						<span class="checkbox"> <input type="checkbox" /> Auto
							login
						</span> <span class="forgot"> <a href="#">Forgot Password?</a>
						</span>
					</div>
				</section>

				<section class="login-btn">
						<input type="submit" value="Login" />
					</form>

					<!-- <div class="login-btn__line"></div> -->
					<!-- <div class="login-social-btn">
            <a href="/components/netzero.html">
              <div class="login-google">
                <i class="fa-brands fa-google"></i>
                <span>Google</span>
              </div>
            </a>
            <a href="/components/netzero.html">
              <div class="login-kakao">
                <i class="fa-solid fa-comment"></i>
                <span>Kakao</span>
              </div>
            </a>
          </div> -->
				</section>
			</div>
		</main>
	</main>

	<script src="js/script.js" type="module" defer></script>
</body>
</html>