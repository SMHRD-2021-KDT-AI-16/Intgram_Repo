import 'https://d3js.org/d3.v3.js';
import '../js/emitYear.js';
import '../js/jquery-3.7.1.min.js';


var div = document.getElementById('ctprvn_test');
for (let i = 0; i < emitYear2019[0].analysisList.length; i++) {
  let temp = emitYear2019[0].analysisList[i].finsum / 1000;
  if (temp > 59184) {
    document.getElementById(emitYear2019[0].analysisList[i].sdNm).style.fill =
      '#FF2A2A';
  } else if (temp > 53558) {
    document.getElementById(emitYear2019[0].analysisList[i].sdNm).style.fill =
      '#FF5555';
  } else if (temp > 27978) {
    document.getElementById(emitYear2019[0].analysisList[i].sdNm).style.fill =
      '#FF8080';
  } else if (temp > 13891) {
    document.getElementById(emitYear2019[0].analysisList[i].sdNm).style.fill =
      '#FFAAAA';
  } else if (temp > 5880) {
    document.getElementById(emitYear2019[0].analysisList[i].sdNm).style.fill =
      '#FFD5D5';
  } else {
    document.getElementById(emitYear2019[0].analysisList[i].sdNm).style.fill =
      '#FFFFBF';
  }
}
div.addEventListener('mousemove', function (e) {
  document.getElementById('container').style.left = e.clientX + 'px';
  document.getElementById('container').style.top = e.clientY + 'px';
  document.getElementById('popup').style.display = 'block';
 
  document.getElementById('city').innerHTML = '시도 : ' + e.target.id;
  for (let i = 0; i < emitYear2019[0].analysisList.length; i++) {
    if (emitYear2019[0].analysisList[i].sdNm === e.target.id) {
      document.getElementById('c_emission').innerHTML =
        '총 배출량 : ' +
        parseInt(emitYear2019[0].analysisList[i].finsum / 1000) +
        ' tonCO2eq';
      break;
    }
  }

});
div.addEventListener('mouseout', function (e) {
  document.getElementById('popup').style.display = 'none';
});

const emitYears = document.querySelector('.inputdown-year');
const yearToggleBtn = document.querySelector('.year-toggle');
const yearMenu = document.querySelector('.year-menu');
const yearOptions = document.querySelectorAll('.year-option');

yearToggleBtn.addEventListener('click', function () {
  yearMenu.classList.toggle('show');
});
yearToggleBtn.addEventListener('blur', function () {
  yearMenu.classList.remove('show');
});

yearOptions.forEach(function (item) {
  item.addEventListener('click', function (e) {
    const buttonLabel = e.currentTarget.textContent.trim();
    yearToggleBtn.textContent = buttonLabel;
    yearToggleBtn.classList.add('selected');
  });
});
