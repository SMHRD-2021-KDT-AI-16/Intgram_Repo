'use strict';

var jsonFilePath = '../json/news.json';
var itemsPerPage = 5;
var currentPage = 1;

function createNewsElement(newsData) {
  var container = document.getElementById('newsListContainer');

  var newsListItem = document.createElement('li');
  newsListItem.className = 'news-list-item';

  var newsElement = document.createElement('div');
  newsElement.className = 'news-txt';

  var titleElement = document.createElement('div');
  titleElement.className = 'news-txt__title';
  var titleLink = document.createElement('a');
  titleLink.href = newsData.url;
  titleLink.textContent = newsData.title;
  titleElement.appendChild(titleLink);

  var detailElement = document.createElement('div');
  detailElement.className = 'news-txt__detail';
  detailElement.textContent = newsData.detail;

  newsElement.appendChild(titleElement);
  newsElement.appendChild(detailElement);
  newsListItem.appendChild(newsElement);
  container.appendChild(newsListItem);
}

function handlePageClick(pageNumber, data) {
  currentPage = pageNumber;
  updateNewsList(data);
}

function createPagination(data) {
  var totalItems = data.newsList.length;
  var totalPages = Math.ceil(totalItems / itemsPerPage);
  var paginationContainer = document.getElementById('paginationContainer');
  paginationContainer.innerHTML = '';

  for (var i = 1; i <= totalPages; i++) {
    var pageItem = document.createElement('li');
    pageItem.textContent = i;
    pageItem.addEventListener('click', function (event) {
      handlePageClick(parseInt(event.target.textContent), data);
    });
    paginationContainer.appendChild(pageItem);
  }
}

function updateNewsList(data) {
  var startIdx = (currentPage - 1) * itemsPerPage;
  var endIdx = startIdx + itemsPerPage;
  var slicedData = data.newsList.slice(startIdx, endIdx);

  var container = document.getElementById('newsListContainer');
  container.innerHTML = '';

  slicedData.forEach(createNewsElement);
}

fetch(jsonFilePath)
  .then((response) => response.json())
  .then((data) => {
    currentPage = 1;

    updateNewsList(data);

    createPagination(data);
  })
  .catch((error) => console.error('데이터를 불러오지 못했습니다:', error));

