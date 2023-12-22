
let data_nonIron = [];
//let page = document.querySelector('input')
var chartArea = document.getElementById('myChart').getContext('2d');
let all = [];
let totalEmissions = [];
let netEmissions = [];
// 차트를 생성한다.
function getData() {
	$.ajax({
		// 1. 통신할 url
		url: 'https://api.odcloud.kr/api/15049589/v1/uddi:779e44b1-25d9-48a8-bb63-8a90148adf9a?page=1&perPage=144&serviceKey=2dzr5Pgj1lthBgwtsb98tVqVqURheXyse3jsH2m7Zyp0JJxEXsduX39%2BqWsmKP8YJR30bUA2aHmq%2F3%2FL18m5CA%3D%3D',
		// 2. 통신 성공할 경우 로직
		success: function (result) {
			//alert("통신 성공!!!")
			console.log(result);
			/*
                        0 - 총배출량
                        1 - 순배출량
                        2 - 에너지
                        3 - A 연료연소
                        32 - B 탈루
                        37 - 산업공정
                        65 - 농업
                        102 - LULUCF
                        129 - 폐기물
                    */
			data_nonIron = Object.keys(result.data[0]);
			//console.log(data_nonIron)
			var myChart = new Chart(chartArea, {
				// ①차트의 종류(String)
				type: 'bar',
				// ②차트의 데이터(Object)
				data: {
					// ③x축에 들어갈 이름들(Array)
					labels: Object.keys(result.data[0]),
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets: [
						{
							// ⑤dataset의 이름(String)
							label: result.data[2]['분야 및 연도'],
							// ⑥dataset값(Array)
							data: Object.values(result.data[2]),
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							//backgroundColor: ['rgba(255, 99, 132, 0.2)'],
							backgroundColor: ['rgba(255, 99, 132, 0.2)'],
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor: 'rgba(255, 99, 132, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth: 0,
						},
						{
							label: result.data[37]['분야 및 연도'],
							// ⑥dataset값(Array)
							data: Object.values(result.data[37]),
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							backgroundColor: ['rgba(75, 192, 192, 0.2)'],
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor: 'rgba(75, 192, 192, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth: 0,
						},
						{
							label: result.data[65]['분야 및 연도'],
							// ⑥dataset값(Array)
							data: Object.values(result.data[65]),
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							backgroundColor: ['rgba(255, 99, 132, 0.2)'],
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor: 'rgba(255, 99, 132, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth: 0,
						},
						{
							label: result.data[102]['분야 및 연도'],
							// ⑥dataset값(Array)
							data: Object.values(result.data[102]),
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							backgroundColor: ['rgba(255, 205, 86, 0.2)'],
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor: 'rgba(255, 205, 86, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth: 0,
						},
						{
							label: result.data[129]['분야 및 연도'],
							// ⑥dataset값(Array)
							data: Object.values(result.data[129]),
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							backgroundColor: ['rgba(75, 192, 192, 0.2)'],
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor: 'rgba(75, 192, 192, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth: 0,
						},
						{
							type: 'line',
							label: result.data[1]['분야 및 연도'],
							// ⑥dataset값(Array)
							data: Object.values(result.data[0]),
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							backgroundColor: ['rgba(75, 192, 192, 0.5)'],
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor: 'rgba(75, 192, 192, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth: 1,
						},
					],
				},
				// ⑩차트의 설정(Object)
				options: {
					//grouped: false,
					responsive: false,
					// ⑪축에 관한 설정(Object)
					scales: {
						// ⑫y축에 대한 설정(Object)
						x: {
							stacked: true,
						},
						y: {
							stacked: true,
							// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
							beginAtZero: true,
						},
					},
					legend: {
						display: false,
					},
				},
			});
		},
		// 3. 통신 실패할 경우 로직
		error: function () {
			alert('통신 실패...');
		},
	});

	console.log(all);
}

getData();

// 원래 있던 js code
$(function () {
	$('.sidebar-link').click(function () {
		$('.sidebar-link').removeClass('is-active');
		$(this).addClass('is-active');
	});
});

$(window)
	.resize(function () {
		if ($(window).width() > 1090) {
			$('.sidebar').removeClass('collapse');
		} else {
			$('.sidebar').addClass('collapse');
		}
	})
	.resize();

const allVideos = document.querySelectorAll('.video');

allVideos.forEach((v) => {
	v.addEventListener('mouseover', () => {
		const video = v.querySelector('video');
		video.play();
	});
	v.addEventListener('mouseleave', () => {
		const video = v.querySelector('video');
		video.pause();
	});
});

$(function () {
	$('.logo, .logo-expand, .discover').on('click', function (e) {
		$('.main-container').removeClass('show');
		$('.main-container').scrollTop(0);
	});
	$('.trending, .video').on('click', function (e) {
		$('.main-container').addClass('show');
		$('.main-container').scrollTop(0);
		$('.sidebar-link').removeClass('is-active');
		$('.trending').addClass('is-active');
	});

	$('.video').click(function () {
		var source = $(this).find('source').attr('src');
		var title = $(this).find('.video-name').text();
		var person = $(this).find('.video-by').text();
		var img = $(this).find('.author-img').attr('src');
		$('.video-stream video').stop();
		$('.video-stream source').attr('src', source);
		$('.video-stream video').load();
		$('.video-p-title').text(title);
		$('.video-p-name').text(person);
		$('.video-detail .author-img').attr('src', img);
	});
});

const counter = document.querySelector('.counter');
let count = 0;
setInterval(() => {
	if (count == 92) {
		clearInterval(count);
	} else {
		count += 1;
		counter.textContent = count + '%';
	}
}, 42);
