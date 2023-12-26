
        // JSON 데이터
        import News from 'news.json'

        // 뉴스피드 요소
        const newsFeed = document.getElementById('news-feed');
        const pagination = document.getElementById('pagination');
        const itemsPerPage = 5; // Number of items per page

        // JSON 데이터를 반복하면서 HTML 생성
        function renderNewsFeed(page) {
            newsFeed.innerHTML = ''; // Clear existing content

            const start = (page - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const pageData = jsonData.slice(start, end);

            for (let i = 0; i < pageData.length; i++) {
                const newsItem = pageData[i];

                const listItem = document.createElement('li');
                listItem.classList.add('news-item');

                // 썸네일 추가
                if (newsItem.thumbnail) {
                    const thumbnailElement = document.createElement('img');
                    thumbnailElement.classList.add('thumbnail');
                    thumbnailElement.src = newsItem.thumbnail;
                    listItem.appendChild(thumbnailElement);
                }

                // 제목과 내용 추가
                const contentContainer = document.createElement('div');
                const titleElement = document.createElement('div');
                titleElement.classList.add('news-title');
                titleElement.innerHTML = `<a href="${newsItem.link}" target="_blank">${newsItem.title}</a>`;

                const contentElement = document.createElement('div');
                contentElement.classList.add('news-content');
                contentElement.textContent = newsItem.description;

                contentContainer.appendChild(titleElement);
                contentContainer.appendChild(contentElement);

                // 리스트 아이템에 내용 컨테이너 추가
                listItem.appendChild(contentContainer);

                // 리스트에 추가
                newsFeed.appendChild(listItem);
            }
        }

        // Pagination 버튼 생성
        function renderPagination() {
            pagination.innerHTML = ''; // Clear existing content

            const totalPages = Math.ceil(jsonData.length / itemsPerPage);

            for (let i = 1; i <= totalPages; i++) {
                const pageItem = document.createElement('li');
                pageItem.classList.add('pagination-item');
                pageItem.textContent = i;
                pageItem.addEventListener('click', () => {
                    renderNewsFeed(i);
                });

                pagination.appendChild(pageItem);
            }
        }

// 초기 페이지 렌더링
let currentPage = 1;
        renderNewsFeed(currentPage);
renderPagination();
        
const newsLink = document.getElementById('news-link');

if (newsLink) {
	newsLink.addEventListener('click', () => {
		currentPage = 1; // 뉴스 페이지로 전환 시 첫 번째 페이지로 재설정
		renderNewsFeed(currentPage);
		renderPagination();
	});
}