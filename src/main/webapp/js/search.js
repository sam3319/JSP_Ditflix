document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById('searchInput');
    const searchResults = document.getElementById('searchResults');
    const emptyState = document.getElementById('emptyState');

    let searchTimer; // 디바운싱 기능 300ms 기준(과부하를 줄이기 위해 사용.)

    // 입력 이벤트 메소드
    searchInput.addEventListener('input', function () {
        const query = this.value.trim();

        clearTimeout(searchTimer);

        searchTimer = setTimeout(() => {
            // 입력 값이 있을 경우 비동기 함수 실행
            if (query.length > 0) {
                searchContent(query);
            } else {
                // 입력 값이 없을 경우는 Empty함수 실행
                showEmptySearch();
            }
        }, 300);

    });

    // 엔터 이벤트 메소드
    searchInput.addEventListener('keypress', function (e) {
        if (e.key === 'Enter') {
            const query = this.value.trim();
            if (query.length > 0) {
                clearTimeout(searchTimer);
                searchContent(query);
            }
        }
    })
});

async function searchContent(query) {
    try {
        // 서버에 접근 하기 로딩
        showLodingSearch();

        const response = await axios.get('/search.contentDo', {
            params: {
                keyword: query,
                limit: 20
            }
        });

        showResultSearch(response.data, query);
    }catch(error){
        // 서버에서 에러 메시지로 응답을 했을 경우 에러 메시지 출력 메소드 실행
        if (error.response && error.response.status === 400){
            showErrorSearch('검색어를 확인해주세요');
        }else{
            showErrorSearch('검색 중 오류가 발생했습니다.');
        }
    }
}

// 검색 결과 출력 메소드
function showResultSearch(result, query){
    const searchResults = document.getElementById('searchResults');

    // 검색창에 입력이 없을 경우 화면에 표시할 내용
    if (!result || result.length === 0){
        searchResults.innerHTML = `
        <div class="empty-state">
                <i class="bi bi-search empty-icon"></i>
                <div class="empty-text">"${query}"에 대한 검색 결과가 없습니다</div>
                <div class="empty-subtext">다른 키워드로 검색해보세요</div>
            </div>`;
        return;
    }

    // 검색결과로 쓸 변수
    let resultHTML = `
        <div class="mb-4">
            <h4 class="text-white">"${query}" 검색 결과 (${result.length}개)</h4>
        </div>
    `;
    
    result.forEach(content => {
        resultHTML += `
        <div class="result-item" onclick="showContentModal(${content.contentId})">
                <div class="result-title">${content.title}</div>
                <div class="result-info text-white mt-1">
                    ${content.genre} • ${content.releaseDate} • ${content.director}
                </div>
            </div>
        `;
    });

    searchResults.innerHTML = resultHTML;
}

// 로딩 중 출력 메소드
function showLodingSearch(){
    const searchResults = document.getElementById('searchResults');

    searchResults.innerHTML = `
        <div class="loading text-center py-5">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">검색 중...</span>
            </div>
            <p class="text-white mt-3">검색 중입니다...</p>
        </div>
    `;
}

// 입력 값이 없을 경우 출력 메소드
function showEmptySearch(){
     const searchResults = document.getElementById('searchResults');
    searchResults.innerHTML = `
        <div class="empty-state">
            <i class="bi bi-search empty-icon"></i>
            <div class="empty-text">검색어를 입력해주세요</div>
            <div class="empty-subtext">찾고 싶은 콘텐츠의 제목을 검색해보세요</div>
        </div>
    `;
}

// 에러 출력 메소드
function showErrorSearch(message){
    const searchResults = document.getElementById('searchResults');

    searchResults.innerHTML = `
        <div class="empty-state">
            <i class="bi bi-exclamation-triangle empty-icon text-warning"></i>
            <div class="empty-text">${message}</div>
            <div class="empty-subtext">잠시 후 다시 시도해주세요</div>
        </div>
    `;
}

// 검색결과 클릭 시 모달 출력 메소드
function showContentModal(contentId){
    
    if(typeof loadContentDetail === 'function'){
        loadContentDetail(contentId);
    }
        
}


// 콘텐츠 상세 정보 로드 메소드 (모달용)
async function loadContentDetail(contentId) {
    const modal = new bootstrap.Modal(document.getElementById('exampleModal'));
    modal.show();

    const response = await axios.get('/modal.contentDo', {
        params:{ contentId:contentId }
    });
    const content = response.data;
    
    // 모달에 콘텐츠 정보 표시
    updateModal(content);
}

/// 모달 업데이트 메소드
function updateModal(content) {
    const titleElem = document.getElementById('Title');
    const yearElem = document.getElementById('Year');
    const genreElem = document.getElementById('Genre');
    const ratingBadge = document.getElementById('Rating');

    if (titleElem) titleElem.textContent = content.title || '제목 없음';
    if (yearElem) yearElem.textContent = content.releaseDate || '정보 없음';
    if (genreElem) genreElem.textContent = content.genre || '정보 없음';

    // 연령등급 배지 업데이트
    if (ratingBadge) {
        const ageRating = content.ageRating || 'N/A';
        ratingBadge.innerHTML = `<i class="bi bi-star-fill" style="font-size: 1rem;"></i> ${ageRating}`;
        ratingBadge.className = `badge fs-6 ${getAgeRatingBadgeClass(ageRating)}`;
    }

    // 이미지 업데이트
    const topImage = document.getElementById('modalTopImage');
    const posterImage = document.getElementById('modalPosterImage');
    
    if (topImage) {
        topImage.src = `/images/thumbnails/${content.thumbnailFileName}`;
        topImage.alt = content.title || '';
    }
    
    if (posterImage) {
        posterImage.src = `/images/posters/${content.posterFileName}`;
        posterImage.alt = content.title || '';
    }

    // 작품 정보 상세 업데이트 메소드
    const ageRatingText = document.getElementById('ageRatingText');
    const genreText = document.getElementById('genreText');
    const directorText = document.getElementById('directorText');
    const infoText = document.getElementById('infoText');

    if (ageRatingText) {
        const ageRatingDisplay = content.ageRating === 'ALL' ? '전체 관람가' : 
                                content.ageRating === '15' ? '15세 이상 관람가' :
                                content.ageRating === '18' ? '18세 이상 관람가' :
                                content.ageRating === '19' ? '19세 이상 관람가' :
                                '등급 정보 없음';
        ageRatingText.textContent = ageRatingDisplay;
    }
    if (genreText){
        genreText.textContent = content.genre || '정보 없음';
    }
    if (directorText){
        directorText.textContent = content.director || '정보 없음';
    }
    if (infoText){
        infoText.textContent = content.info || '줄거리 정보가 없습니다.';
    }
}

function getAgeRatingBadgeClass(ageRating) {
    switch(ageRating) {
        case 'ALL': return 'bg-success text-white';
        case '12': return 'bg-info text-white';
        case '15': return 'bg-warning text-dark';
        case '18':
        case '19': return 'bg-danger text-white';
        default: return 'bg-secondary text-white';
    }
}