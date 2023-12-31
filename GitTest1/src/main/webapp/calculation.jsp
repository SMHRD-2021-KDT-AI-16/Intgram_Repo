<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.intgram.model.Co2VO"%>
<%@ page import="com.intgram.model.MemberVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
	.calc-outputChart2 {
		margin-left: 50px;
	}
</style>

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

					<c:if test="${member != null }"> 
						<span>${member.mem_name} </span>
						<a href="LogoutService">로그아웃</a>
					</c:if>
					<c:if test="${member == null }"> 
						<a class="login-menu-link" href="login.jsp"> 
					      <i class="fa-regular fa-circle-user"></i> <span>Login</span>
					    </a>
					    <a class="login-menu-link" href="join.jsp"> 
					       <i class="fa-solid fa-arrow-right-to-bracket"></i> <span>Register</span>
					    </a>
					</c:if>
				</nav>
			</section>

			<a href="#" class="navbar__toggleBtn"> <i
				class="fa-solid fa-bars"></i>
			</a>

			<section id="login-screen" style="display: none"></section>
			<section id="join-screen" style="display: none"></section>
		</header>
	</div>

	<main class="calc-container off">	
		<section class="calc-header">
			<article>
				<form action="CalculateService" method="get">
					<div class="input-list">
						<h1>운행일자</h1>
						<input type="text" placeholder="20240105" />
					</div>

					<div class="transport">
                  <h1>운송수단을 선택해주세요</h1>
                  <div class="inputdown inputdown-transport">
                     <select class="inputdown-toggle transport-toggle" name='transport'>
                        <option class="inputdown-option transport-option"
                            value="차량">차량</option>
                        <option class="inputdown-option transport-option"
                            value="선박">선박</option>
                        <option class="inputdown-option transport-option"
                             value="철도">철도</option>
                        <option class="inputdown-option transport-option"
                            value="항공기">항공기</option>
                     </select>
                  </div>
               </div>

               <div class="fuel">
                  <h1>사용연료를 선택해주세요</h1>
                  <div class="inputdown inputdown-transport">
                     <select class="inputdown-toggle transport-toggle" name='fuel'>
                        <option class="inputdown-option transport-option" 
                           value="경유">경유</option>
                        <option class="inputdown-option transport-option" 
                           value="중유">중유</option>
                        <option class="inputdown-option transport-option" 
                           value="휘발유">휘발유</option>
                        <option class="inputdown-option transport-option" 
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
			</div>

			<article class="calc-outputs">
				<div class="calc-outputChart1">
					<p class="output-title">
						<i class="fa-solid fa-user"></i> 2023년 월별 탄소 배출량
					</p>
					<canvas id="userCarbonChart" width="500px" height="250px">
					</canvas>
				</div>
				<div class="calc-outputChart2">
					<p class="output-title">
						<i class="fa-solid fa-user"></i> 2024년 월별 탄소 배출량
					</p>
					<canvas id="userCarbonChart2" width="500px" height="250px">
					</canvas>
				</div>
			</article>
		</section>
	</main>
	<div class="screen-alert">화면 크기를 늘여주세요🙏</div>

	<script src="../js/script.js" type="module" defer></script>
	<script src="js/jquery-3.7.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

	<script>
<<<<<<< HEAD
			const toggleBtn = document.querySelector('.navbar__toggleBtn');
			const SIDE_MENU = document.querySelector('.menu-wrapper');
			const LOGIN_AREA = document.getElementById('login-area');
=======
   //
         const toggleBtn = document.querySelector('.navbar__toggleBtn');
         const SIDE_MENU = document.querySelector('.menu-wrapper');
         const LOGIN_AREA = document.getElementById('login-area');
>>>>>>> branch 'master' of https://github.com/SMHRD-2021-KDT-AI-16/Intgram_Repo.git

			toggleBtn.addEventListener('click', () => {
				SIDE_MENU.classList.toggle('active');
				LOGIN_AREA.classList.toggle('active');
			});
	</script>	
	<script>
	
	let year_test = 2023
	<%
		float total = 0;
		
		int[] year = new int[3];
		float[] month_Total = new float[12];
		float[] month_Co2 = new float[12];
		float[] month_Ch4 = new float[12];
		float[] month_N2o = new float[12];
		float[] month_Total_2 = new float[12];
		float[] month_Co2_2 = new float[12];
		float[] month_Ch4_2 = new float[12];
		float[] month_N2o_2 = new float[12];
		
		String returnData_Total = "";
		String returnData_Co2 = "";
		String returnData_Ch4 = "";
		String returnData_N2o = "";
		String returnData_Total_2 = "";
		String returnData_Co2_2 = "";
		String returnData_Ch4_2 = "";
		String returnData_N2o_2 = "";
		
		if(session.getAttribute("member") != null) {
			List<Co2VO> l_co2 = (List<Co2VO>)session.getAttribute("member_data");
			
			for(int i = 0; i < l_co2.size(); i++) {
				String date = l_co2.get(i).getDriving_date();
				
				String[] temp = date.split("-");
				for(int j = 0; j < 12; j++) {
					if(Integer.parseInt(temp[1]) == (j + 1) && Integer.parseInt(temp[0]) == 2023) {
						month_Total[j] += l_co2.get(i).getTotal_emission();
						month_Co2[j] += l_co2.get(i).getCo2_emission();
						month_Ch4[j] += l_co2.get(i).getCh4_emission();
						month_N2o[j] += l_co2.get(i).getN2o_emission();
						total += (l_co2.get(i)).getTotal_emission();
					}
					if(Integer.parseInt(temp[1]) == (j + 1) && Integer.parseInt(temp[0]) == 2024) {
						month_Total_2[j] += l_co2.get(i).getTotal_emission();
						month_Co2_2[j] += l_co2.get(i).getCo2_emission();
						month_Ch4_2[j] += l_co2.get(i).getCh4_emission();
						month_N2o_2[j] += l_co2.get(i).getN2o_emission();
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
			returnData_Total += month_Total[i] + "/";
			returnData_Co2 += month_Co2[i] + "/";
			returnData_Ch4 += month_Ch4[i] + "/";
			returnData_N2o += month_N2o[i] + "/";
			returnData_Total_2 += month_Total_2[i] + "/";
			returnData_Co2_2 += month_Co2_2[i] + "/";
			returnData_Ch4_2 += month_Ch4_2[i] + "/";
			returnData_N2o_2 += month_N2o_2[i] + "/";
		}

	%>
		var temp = 	'<%= total %>'
		var returnData_Total = '<%= returnData_Total %>'
		var returnData_Co2 = '<%= returnData_Co2 %>'
		var returnData_Ch4 = '<%= returnData_Ch4 %>'
		var returnData_N2o = '<%= returnData_N2o %>'
		var returnData_Total_2 = '<%= returnData_Total_2 %>'
		var returnData_Co2_2 = '<%= returnData_Co2_2 %>'
		var returnData_Ch4_2 = '<%= returnData_Ch4_2 %>'
		var returnData_N2o_2 = '<%= returnData_N2o_2 %>'
		
		var month_total = []
		var month_co2 = []
		var month_ch4 = []
		var month_n2o = []
		var month_total_2 = []
		var month_co2_2 = []
		var month_ch4_2 = []
		var month_n2o_2 = []
		
		month_total = returnData_Total.split("/")
		month_co2 = returnData_Co2.split("/")
		month_ch4 = returnData_Ch4.split("/")
		month_n2o = returnData_N2o.split("/")
		month_total_2 = returnData_Total_2.split("/")
		month_co2_2 = returnData_Co2_2.split("/")
		month_ch4_2 = returnData_Ch4_2.split("/")
		month_n2o_2 = returnData_N2o_2.split("/")


		document.querySelector('#totalE').innerHTML = temp
		$('.transport-option').on('click', (e) => {
		})
			let select_year = 2023
			$("select[name=year]").change(function () {
				select_year = $(this).val()
				document.getElementById('year').innerHTML = select_year
			});
			
	 var userChart = document.getElementById('userCarbonChart').getContext('2d');
	 var userChart2 = document.getElementById('userCarbonChart2').getContext('2d');
			
	 var userCarbonChart = new Chart(userChart, {
        type: 'line',
        data: {
          labels: ['1월', '2월', '3월', '4월', '5월', '6월',
        	  '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [
            {
              label: '총배출량',
              type: 'line',
              data: month_total,     
              borderColor: 'black', 
              borderWidth: 1,              
              fill: false
            }, {
              label: 'C2O',
              type: 'line',
              data: month_co2,              
              borderWidth: 2,
              borderColor: '#32CD32',
              fill: false
            }, {
              label: 'CH4',
              type: 'line',
              data: month_ch4,              
              borderWidth: 2,
              borderColor: '#0052C4',
              fill: false
            }, {
              label: 'N2O',
              type: 'line',
              data: month_n2o,              
              borderWidth: 2,
              borderColor: '#FB0019',
              fill: false
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
	 
	 var userCarbonChart2 = new Chart(userChart2, {
	        type: 'line',
	        data: {
	          labels: ['1월', '2월', '3월', '4월', '5월', '6월',
	        	  '7월', '8월', '9월', '10월', '11월', '12월'],
	          datasets: [
	            {
	              label: '총배출량',
	              type: 'line',
	              data: month_total_2,     
	              borderColor: 'black', 
	              borderWidth: 1,              
	              fill: false
	            }, {
	              label: 'C2O',
	              type: 'line',
	              data: month_co2_2,              
	              borderWidth: 2,
	              borderColor: '#32CD32',
	              fill: false
	            }, {
	              label: 'CH4',
	              type: 'line',
	              data: month_ch4_2,              
	              borderWidth: 2,
	              borderColor: '#0052C4',
	              fill: false
	            }, {
	              label: 'N2O',
	              type: 'line',
	              data: month_n2o_2,              
	              borderWidth: 2,
	              borderColor: '#FB0019',
	              fill: false
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