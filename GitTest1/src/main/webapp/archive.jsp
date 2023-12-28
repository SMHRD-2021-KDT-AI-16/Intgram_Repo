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
		<section id="news-area" class="news-area">
			<p class="news-list__title">News</p>
			<div class="news-list">
				<li class="news-list-item">
					<div>
						<img src="img/net-zero.png" alt="뉴스썸네일" class="news-list__img" />
					</div>
					<div class="news-txt">
						<div class="news-txt__title">Lorem ipsum dolor sit amet
							consectetur adipisicing elit.</div>
						<div class="news-txt__detail">Lorem, ipsum dolor sit amet
							consectetur adipisicing elit. Inventore earum amet officiis quae,
							rem id perferendis omnis beatae culpa neque optio consequuntur
							ratione ea ex fugit ipsum dolorum necessitatibus accusamus,
							excepturi nesciunt nemo ad! Molestiae, repellendus provident
							aliquid temporibus laudantium et suscipit doloremque quam animi
							culpa enim modi neque id.</div>
					</div>
				</li>
				<li class="news-list-item">
					<div>
						<img src="img/net-zero.png" alt="뉴스썸네일" class="news-list__img" />
					</div>
					<div class="news-txt">
						<div class="news-txt__title">Lorem ipsum dolor sit amet
							consectetur adipisicing elit.</div>
						<div class="news-txt__detail">Lorem, ipsum dolor sit amet
							consectetur adipisicing elit. Inventore earum amet officiis quae,
							rem id perferendis omnis beatae culpa neque optio consequuntur
							ratione ea ex fugit ipsum dolorum necessitatibus accusamus,
							excepturi nesciunt nemo ad! Molestiae, repellendus provident
							aliquid temporibus laudantium et suscipit doloremque quam animi
							culpa enim modi neque id.</div>
					</div>
				</li>
				<li class="news-list-item">
					<div>
						<img src="img/net-zero.png" alt="뉴스썸네일" class="news-list__img" />
					</div>
					<div class="news-txt">
						<div class="news-txt__title">Lorem ipsum dolor sit amet
							consectetur adipisicing elit.</div>
						<div class="news-txt__detail">Lorem, ipsum dolor sit amet
							consectetur adipisicing elit. Inventore earum amet officiis quae,
							rem id perferendis omnis beatae culpa neque optio consequuntur
							ratione ea ex fugit ipsum dolorum necessitatibus accusamus,
							excepturi nesciunt nemo ad! Molestiae, repellendus provident
							aliquid temporibus laudantium et suscipit doloremque quam animi
							culpa enim modi neque id.</div>
					</div>
				</li>
				<li class="news-list-item">
					<div>
						<img src="img/net-zero.png" alt="뉴스썸네일" class="news-list__img" />
					</div>
					<div class="news-txt">
						<div class="news-txt__title">Lorem ipsum dolor sit amet
							consectetur adipisicing elit.</div>
						<div class="news-txt__detail">Lorem, ipsum dolor sit amet
							consectetur adipisicing elit. Inventore earum amet officiis quae,
							rem id perferendis omnis beatae culpa neque optio consequuntur
							ratione ea ex fugit ipsum dolorum necessitatibus accusamus,
							excepturi nesciunt nemo ad! Molestiae, repellendus provident
							aliquid temporibus laudantium et suscipit doloremque quam animi
							culpa enim modi neque id.</div>
					</div>
				</li>
				<li class="news-list-item">
					<div>
						<img src="img/net-zero.png" alt="뉴스썸네일" class="news-list__img" />
					</div>
					<div class="news-txt">
						<div class="news-txt__title">Lorem ipsum dolor sit amet
							consectetur adipisicing elit.</div>
						<div class="news-txt__detail">Lorem, ipsum dolor sit amet
							consectetur adipisicing elit. Inventore earum amet officiis quae,
							rem id perferendis omnis beatae culpa neque optio consequuntur
							ratione ea ex fugit ipsum dolorum necessitatibus accusamus,
							excepturi nesciunt nemo ad! Molestiae, repellendus provident
							aliquid temporibus laudantium et suscipit doloremque quam animi
							culpa enim modi neque id.</div>
					</div>
				</li>
			</div>
		</section>
		<!--  -->
		<section id="video-area" class="video-area">
			<p class="video-list__title">Videos</p>
			<div class="video-list">
				<div class="video-list-item">
					<div>
						<!-- <img
                src="/net-zero.png"
                alt="영상썸네일"
                class="video-list__img"
              /> -->
					</div>
					<div class="video-txt">
						<div class="video-txt__title"></div>
						<div class="video-txt__detail"></div>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>