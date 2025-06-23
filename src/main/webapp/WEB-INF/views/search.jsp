<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : search.jsp
 * 작성일 : 2025. 6. 21.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 검색 페이지
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Main</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
            crossorigin="anonymous">
        <!-- 부트스트랩 CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
            crossorigin="anonymous">
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- 커스텀 CSS -->
        <link rel="stylesheet" href="css/search.css">
    </head>
    <body>
        <!-- 사이드 메뉴 바 -->
        <div class="d-flex flex-column col-auto sidebar">
            <ul class="nav nav-underline mt-5">
                <!-- 개인정보 페이지 이동 -->
                <li class="nav-item ms-4 mt-3">
                    <a class="nav-link ft-wt" href="myPage.do"><i
                            class="bi bi-person-circle"
                            style="font-size: 1.5rem;"></i></a>
                </li>
                <!-- 메인페이지 이동 -->
                <li class="nav-item ms-4 mt-5">
                    <a class="nav-link ft-wt" href="index.do"><i
                            class="bi bi-house"
                            style="font-size: 1.5rem;"></i></a>
                </li>
                <!-- 검색페이지 이동 -->
                <li class="nav-item ms-4 mt-4">
                    <a class="nav-link active" href="search.do"><i class="bi bi-search"
                            style="font-size: 1.5rem;"></i></a>
                </li>
                <!-- 리뷰게시판 이동 -->
                <li class="nav-item ms-4 mt-4">
                    <a class="nav-link ft-wt" href="reviewBoard.do"><i
                            class="bi bi-image"
                            style="font-size: 1.5rem;"></i></a>
                </li>
                <!-- 자유게시판 이동 -->
                <li class="nav-item ms-4 mt-4">
                    <a class="nav-link ft-wt" href="freeBoard.do"><i
                            class="bi bi-chat-square-text-fill"
                            style="font-size: 1.5rem;"></i></a>
                </li>
                <!-- Q/A게시판 이동 -->
                <li class="nav-item ms-4 mt-4">
                    <a class="nav-link ft-wt" href="membership.do"><i
                            class="bi bi-question-square"
                            style="font-size: 1.5rem;"></i></a>
                </li>
            </ul>
        </div>
        <!-- 검색 컨테이너 -->
        <div class="search-container">
            <!-- 검색 헤더 -->
            <div class="search-header">
                <h1 class="search-title">콘텐츠 검색</h1>
                <p class="search-subtitle">원하는 콘텐츠를 찾아보세요</p>
            </div>

            <!-- 검색박스 -->
            <div class="search-box d-flex align-items-center">
                <i class="bi bi-search search-icon me-3"></i>
                <input class="search-input" type="text"
                    placeholder="영화, 드라마 제목을 입력하세요." id="searchInput">
            </div>

            <!-- 검색 결과 영역 -->
            <div class="search-results" id="searchResults">
                <!-- 기본 빈 상태 -->
                <div class="empty-state" id="emptyState">
                    <i class="bi bi-search empty-icon"></i>
                    <div class="empty-text">검색어를 입력해주세요</div>
                    <div class="empty-subtext">찾고 싶은 콘텐츠의 제목을 검색해보세요</div>
                </div>
            </div>
        </div>

        <!-- 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div
                class="modal-dialog modal-dialog-centered modal-fullscreen-lg-down modal-xl"
                style="border-radius: 5px;">
                <div class="modal-content bg-dark">
                    <div
                        class="modal-header position-absolute top-0 end-0 z-3 border-0">
                        <button type="button" class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-0">
                        <div class="position-relative h-1">
                            <img id="modalTopImage"
                                src="/images/posters/default.webp"
                                class="img-fluid gradient"
                                style="object-fit: cover;">
                            <div
                                class="test position-absolute bottom-0 start-0 p-4 text-white">
                                <span id="Rating"
                                    class="badge bg-warning text-dark fs-6">
                                    <i class="bi bi-star-fill"
                                        style="font-size: 1rem;"></i> ALL
                                </span>
                                <h1 id="Title" class="display-6 fw-bold">콘텐츠
                                    제목</h1>
                                <div style="letter-spacing: 5px;">
                                    <small id="Year">2025</small>·<small
                                        id="Genre">장르</small>
                                </div>
                                <div style="letter-spacing: 5px;">
                                    <i class="bi bi-badge-4k-fill"></i><i
                                        class="bi bi-badge-cc-fill"></i>
                                </div>
                                <button
                                    class="btn btn-lg btn-danger px-5 py-3 mt-5 me-2 mb-5">
                                    <i class="bi bi-play-fill me-2"></i>재생
                                </button>
                            </div>
                        </div>
                        <div class="p-5">
                            <div class="row g-4 text-white mb-1">
                                <nav id="navbar-example2" class="navbar">
                                    <ul class="nav nav-pills">
                                        <li class="nav-item">
                                            <a
                                                class="nav-link text-white modal-menu"
                                                href="#info">작품
                                                정보</a>
                                        </li>
                                        <li class="nav-item">
                                            <a
                                                class="nav-link text-white modal-menu"
                                                href="#review">사용자 평</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <div data-bs-spy="scroll"
                                data-bs-target="#navbar-example2"
                                data-bs-root-margin="0px 0px -40%"
                                data-bs-smooth-scroll="true"
                                class="scrollspy-example p-2 rounded-2"
                                tabindex="0">

                                <!-- 작품 정보 섹션 -->
                                <div id="info" class="row">
                                    <img id="modalPosterImage"
                                        src="/images/posters/default.webp"
                                        class="col-md-3 img-fluid shadow"
                                        style="border-radius: 50px;">
                                    <div class="col text-white"
                                        id="contentInfo">
                                        <h2 class="fw-semibold">등급</h2>
                                        <p class="h6" id="ageRatingText">전체
                                            관람가</p>
                                        <h2 class="fw-semibold">장르</h2>
                                        <p class="h6" id="genreText">애니메이션</p>
                                        <h2 class="fw-semibold">감독</h2>
                                        <p class="h6" id="directorText">감독명</p>
                                        <h2 class="fw-semibold">개요</h2>
                                        <p class="h6 lh-base"
                                            id="infoText">줄거리</p>
                                    </div>
                                </div>

                                <!-- 리뷰 작성 폼 -->
                                <div id="review" class="mt-5">
                                    <h2 class="text-white fw-semibold mb-2">사용자
                                        평</h2>
                                    <form action method="post" class="mb-3">
                                        <fieldset class="rate">
                                            <input type="radio" id="rating10"
                                                name="rating" value="5"
                                                required><label for="rating10"
                                                title="5점"></label>
                                            <input type="radio" id="rating9"
                                                name="rating"
                                                value="4.5"><label class="half"
                                                for="rating9"
                                                title="4.5점"></label>
                                            <input type="radio" id="rating8"
                                                name="rating"
                                                value="4"><label for="rating8"
                                                title="4점"></label>
                                            <input type="radio" id="rating7"
                                                name="rating"
                                                value="3.5"><label class="half"
                                                for="rating7"
                                                title="3.5점"></label>
                                            <input type="radio" id="rating6"
                                                name="rating"
                                                value="3"><label for="rating6"
                                                title="3점"></label>
                                            <input type="radio" id="rating5"
                                                name="rating"
                                                value="2.5"><label class="half"
                                                for="rating5"
                                                title="2.5점"></label>
                                            <input type="radio" id="rating4"
                                                name="rating"
                                                value="2"><label for="rating4"
                                                title="2점"></label>
                                            <input type="radio" id="rating3"
                                                name="rating"
                                                value="1.5"><label class="half"
                                                for="rating3"
                                                title="1.5점"></label>
                                            <input type="radio" id="rating2"
                                                name="rating"
                                                value="1"><label for="rating2"
                                                title="1점"></label>
                                            <input type="radio" id="rating1"
                                                name="rating"
                                                value="0.5"><label class="half"
                                                for="rating1"
                                                title="0.5점"></label>
                                        </fieldset>
                                        <div class="d-flex gap-3">
                                            <textarea
                                                class="form-control bg-dark review-fm text-white"
                                                id="reviewTextarea" rows="3"
                                                maxlength="300"
                                                placeholder="이 작품에 대한 내 평가를 300자 이내로 남겨보세요!"
                                                style="width: 90%;"
                                                required></textarea>
                                            <button type="submit"
                                                class="btn btn-primary"
                                                style="width: 10%;">작성</button>
                                        </div>
                                    </form>

                                    <!-- 리뷰 목록 -->
                                    <div class="row text-white mt-5">
                                        <h6 class="fs-6 mb-3 pb-3">리뷰 (50)</h6>
                                        <div id="review_list" class="mt-5">
                                            <div
                                                class="row review_content mb-5 p-0">
                                                <small
                                                    class="review_name">닉네임</small>
                                                <small
                                                    class="review_date text-secondary mb-2">2025.05.19</small>
                                                <div class="review_text mb-3">리뷰
                                                    내용...</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 부트스트랩 JS -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
        <!-- 커스텀 JS -->
        <script src="js/search.js"></script>
        <!-- Axios CDN -->
        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    </body>
</html>

