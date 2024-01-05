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
			<span class="logo">회원가입 성공!!!!!!!!!!!!!</span> <span>
				<%
				String mem_name = (String) request.getAttribute("mem_name");
				%> <%=mem_name%>님 환영합니다
			</span>
			<a href="netzero.jsp">메인화면으로 돌아가기</a>
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

		<main id="join">
			<form action="JoinService" method="post">
				<section class="join-title">
					<p>Register</p>
					<div class="join-line"></div>
				</section>
				<section class="join-input">
					<div class="join-input__inputs">
						<label for="bizNumber"> <span class="asterisk">*</span> <span>Business
								Number</span>
						</label> <input type="text" id="bizID" required />
					</div>

					<div class="join-input__inputs">
						<label> <span class="asterisk">*</span> <span>ID</span>
						</label> <input type="text" id="id" required />
					</div>

					<div class="join-input__inputs">
						<label> <span class="asterisk">*</span> <span>Email</span></label>
						<input type="text" id="email" />
					</div>

					<div class="join-input__inputs">
						<label> <span class="asterisk">*</span> <span>Password</span>
						</label> <input type="password" id="password" required />
					</div>

					<div class="join-input__inputs">
						<label> <span class="asterisk">*</span> <span>Company</span>
						</label> <input type="text" id="company" required />
					</div>

					<div class="join-input__inputs">
						<label> <span class="asterisk"></span> <span>Position
								Titles</span>
						</label> <input type="text" id="rank" required />
					</div>

					<div class="join-btns">
						<div class="join-input-btn">
							<input type="reset" value="Cancel" /> <input type="submit"
								value="Confirm" />
						</div>
					</div>
				</section>
			</form>
		</main>
	</main>
</body>
</html>