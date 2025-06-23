document.addEventListener('DOMContentLoaded', function() {
    loadContentsByGenre('드라마', 'dramaCarousel');
    loadContentsByGenre('애니메이션', 'animationCarousel');
    loadContentsByGenre('액션', 'actionCarousel');
    loadContentsByGenre('공포', 'horrorCarousel');
    loadContentsByGenre('미스터리', 'mysteryCarousel');
});

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

// 슬라이드 생성 메소드
function createSlide(contents, isActive) {
    const activeClass = isActive ? 'active' : '';
    let itemsHtml = '';
    
    contents.forEach(content => {
        itemsHtml += `
            <li class="col-2" data-bs-toggle="modal" data-bs-target="#exampleModal" 
                onclick="loadContentDetail(${content.contentId})">
                <div class="content-card">
                    <div class="card-img" style="background-image: url('images/thumbnails/${content.thumbnailFileName}')"></div>
                    <p class="mt-2 text-white">${content.title}</p>
                </div>
            </li>
        `;
    });
    
    return `
        <div class="carousel-item ${activeClass}">
            <ul class="row gx-2 flex-nowrap" style="list-style: none;">
                ${itemsHtml}
            </ul>
        </div>
    `;
}

// 장르 별 콘텐츠 불러오기
async function loadContentsByGenre(genre, carouselId){
        const response = await axios.get('/genre.contentDo',{
        params: {
            genre: genre,
            limit: 12
        }
    });
    const data = response.data;
    const carousel = document.querySelector(`#${carouselId} .carousel-inner`);
    carousel.innerHTML = '';

    // 슬라이드를 6개 씩 나누어서 생성한다.
    for (let i = 0; i < data.length; i += 6){
        const slideData = data.slice(i, i+6);
        const isFirst = i === 0;
        const slideHtml = createSlide(slideData, isFirst);
        carousel.insertAdjacentHTML('beforeend', slideHtml);
    }

    // 버튼 표시/숨김
    toggleGenreCarouselButtons(carouselId, data.length > 6);
}

// 장르별 캐러셀 버튼 토글
function toggleGenreCarouselButtons(carouselId, show) {
    const prevButton = document.querySelector(`#${carouselId} .carousel-control-prev`);
    const nextButton = document.querySelector(`#${carouselId} .carousel-control-next`);
    
    if (prevButton && nextButton) {
        if (show) {
            prevButton.style.display = 'flex';
            nextButton.style.display = 'flex';
        } else {
            prevButton.style.display = 'none';
            nextButton.style.display = 'none';
        }
    }
}