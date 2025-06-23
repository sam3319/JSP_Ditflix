<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : index.jsp
 * 작성일 : 2025. 6. 10.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 메인페이지
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DITFLIX</title>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
      crossorigin="anonymous">
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="css/index.css">
  </head>
  <body>
    <!-- 사이드 메뉴 바 -->
    <div class="sidebar">
      <ul class="nav nav-underline mt-5">
        <li class="nav-item ms-4 mt-3">
          <a class="nav-link ft-wt" href="myPage.do"><i
              class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-5">
          <a class="nav-link active" href="index.do"><i class="bi bi-house"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="search.do"><i class="bi bi-search"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="reviewBoard.do"><i class="bi bi-image"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="freeBoard.do"><i
              class="bi bi-chat-square-text-fill"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="membership.do"><i
              class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>
      </ul>
    </div>

    <!-- 메인 배너 캐러셀 -->
    <div id="carouselExampleAutoplaying" class="carousel slide"
      data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="0" class="active" aria-current="true"
          aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators"
          data-bs-slide-to="2" aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <div class="hero-banner bannerImage1">
            <div class="hero-content">
              <h1 class="hero-title">폭싹 속았수다</h1>
              <p class="hero-description">당차고 야무진 소녀와 우직하고 헌신적인 소년. 제주 바닷가 작은
                마을에서 한 뼘씩 자라온 두 사람의 인생은 어디로 향할까. 넘어지고 좌절해도 다시 일어서며, 세월을 뛰어넘어
                피어나는 사랑 이야기.</p>
              <button class="btn-play"><i
                  class="bi bi-play-fill m-1"></i>재생</button>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="hero-banner bannerImage2">
            <div class="hero-content">
              <h1 class="hero-title">나 혼자만 레벨업</h1>
              <p class="hero-description">어느 날, 저랭크 던전에 숨겨진 고랭크 이중 던전을 발견했지만 빈사의
                중상을 입은 성진우의 눈앞에 의문의 퀘스트창이 나타났는데. 죽음의 순간, 퀘스트를 수락하기로 결심한 성진우는 자신만
                '레벨업'할 수 있게 되었는데.</p>
              <button class="btn-play"><i
                  class="bi bi-play-fill m-1"></i>재생</button>
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <div class="hero-banner bannerImage3">
            <div class="hero-content">
              <h1 class="hero-title">썬더볼츠*</h1>
              <p class="hero-description">어벤져스가 사라진 후, 세계 최대의 위협과 마주한 세상을 구하기 위해
                전직 스파이, 암살자, 살인 청부 업자 등 마블의 별난 놈들이 펼치는 예측불허 팀플레이를 담은 액션
                블록버스터</p>
              <button class="btn-play"><i
                  class="bi bi-play-fill m-1"></i>재생</button>
            </div>
          </div>
        </div>
      </div>
      <!-- 캐러셀 버튼 -->
      <button class="carousel-control-prev" type="button"
        data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
        data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

    <!-- 드라마 캐러셀 -->
    <div class="container-fluid p-3">
      <div class="row">
        <h4 class="h4">드라마</h4>
        <div id="dramaCarousel" class="carousel slide" data-bs-interval="false">
          <div class="carousel-inner">
            <!-- 로딩 표시 -->
            <div class="d-flex justify-content-center align-items-center"
              style="height: 200px;">
              <div class="spinner-border text-light" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button"
            data-bs-target="#dramaCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button"
            data-bs-target="#dramaCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>

    <!-- 애니메이션 캐러셀 -->
    <div class="container-fluid p-3">
      <div class="row">
        <h4 class="h4">애니메이션</h4>
        <div id="animationCarousel" class="carousel slide"
          data-bs-interval="false">
          <div class="carousel-inner">
            <!-- 로딩 표시 -->
            <div class="d-flex justify-content-center align-items-center"
              style="height: 200px;">
              <div class="spinner-border text-light" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button"
            data-bs-target="#animationCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button"
            data-bs-target="#animationCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>

    <!-- 액션 캐러셀 -->
    <div class="container-fluid p-3">
      <div class="row">
        <h4 class="h4">액션</h4>
        <div id="actionCarousel" class="carousel slide"
          data-bs-interval="false">
          <div class="carousel-inner">
            <!-- 로딩 표시 -->
            <div class="d-flex justify-content-center align-items-center"
              style="height: 200px;">
              <div class="spinner-border text-light" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button"
            data-bs-target="#actionCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button"
            data-bs-target="#actionCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>

    <!-- 공포 캐러셀 -->
    <div class="container-fluid p-3">
      <div class="row">
        <h4 class="h4">공포</h4>
        <div id="horrorCarousel" class="carousel slide"
          data-bs-interval="false">
          <div class="carousel-inner">
            <!-- 로딩 표시 -->
            <div class="d-flex justify-content-center align-items-center"
              style="height: 200px;">
              <div class="spinner-border text-light" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button"
            data-bs-target="#horrorCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button"
            data-bs-target="#horrorCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>
    </div>

    <!-- 미스터리 캐러셀 -->
    <div class="container-fluid p-3">
      <div class="row">
        <h4 class="h4">미스터리</h4>
        <div id="mysteryCarousel" class="carousel slide"
          data-bs-interval="false">
          <div class="carousel-inner">
            <!-- 로딩 표시 -->
            <div class="d-flex justify-content-center align-items-center"
              style="height: 200px;">
              <div class="spinner-border text-light" role="status">
                <span class="visually-hidden">Loading...</span>
              </div>
            </div>
          </div>

          <button class="carousel-control-prev" type="button"
            data-bs-target="#mysteryCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button"
            data-bs-target="#mysteryCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
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
          <div class="modal-header position-absolute top-0 end-0 z-3 border-0">
            <button type="button" class="btn-close" data-bs-dismiss="modal"
              aria-label="Close"></button>
          </div>
          <div class="modal-body p-0">
            <div class="position-relative h-1">
              <img id="modalTopImage" src="/images/posters/default.webp"
                class="img-fluid gradient" style="object-fit: cover;">
              <div
                class="test position-absolute bottom-0 start-0 p-4 text-white">
                <span id="Rating" class="badge bg-warning text-dark fs-6">
                  <i class="bi bi-star-fill" style="font-size: 1rem;"></i> ALL
                </span>
                <h1 id="Title" class="display-6 fw-bold">콘텐츠 제목</h1>
                <div style="letter-spacing: 5px;">
                  <small id="Year">2025</small>·<small id="Genre">장르</small>
                </div>
                <div style="letter-spacing: 5px;">
                  <i class="bi bi-badge-4k-fill"></i><i
                    class="bi bi-badge-cc-fill"></i>
                </div>
                <button class="btn btn-lg btn-danger px-5 py-3 mt-5 me-2 mb-5">
                  <i class="bi bi-play-fill me-2"></i>재생
                </button>
              </div>
            </div>
            <div class="p-5">
              <div class="row g-4 text-white mb-1">
                <nav id="navbar-example2" class="navbar">
                  <ul class="nav nav-pills">
                    <li class="nav-item">
                      <a class="nav-link text-white modal-menu" href="#info">작품
                        정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-white modal-menu"
                        href="#review">사용자 평</a>
                    </li>
                  </ul>
                </nav>
              </div>
              <div data-bs-spy="scroll" data-bs-target="#navbar-example2"
                data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true"
                class="scrollspy-example p-2 rounded-2" tabindex="0">

                <!-- 작품 정보 섹션 -->
                <div id="info" class="row">
                  <img id="modalPosterImage" src="/images/posters/default.webp"
                    class="col-md-3 img-fluid shadow"
                    style="border-radius: 50px;">
                  <div class="col text-white" id="contentInfo">
                    <h2 class="fw-semibold">등급</h2>
                    <p class="h6" id="ageRatingText">전체 관람가</p>
                    <h2 class="fw-semibold">장르</h2>
                    <p class="h6" id="genreText">애니메이션</p>
                    <h2 class="fw-semibold">감독</h2>
                    <p class="h6" id="directorText">감독명</p>
                    <h2 class="fw-semibold">개요</h2>
                    <p class="h6 lh-base" id="infoText">줄거리</p>
                  </div>
                </div>

                <!-- 리뷰 작성 폼 -->
                <div id="review" class="mt-5">
                  <h2 class="text-white fw-semibold mb-2">사용자 평</h2>
                  <form action method="post" class="mb-3">
                    <fieldset class="rate">
                      <input type="radio" id="rating10" name="rating" value="5"
                        required><label for="rating10" title="5점"></label>
                      <input type="radio" id="rating9" name="rating"
                        value="4.5"><label class="half" for="rating9"
                        title="4.5점"></label>
                      <input type="radio" id="rating8" name="rating"
                        value="4"><label for="rating8" title="4점"></label>
                      <input type="radio" id="rating7" name="rating"
                        value="3.5"><label class="half" for="rating7"
                        title="3.5점"></label>
                      <input type="radio" id="rating6" name="rating"
                        value="3"><label for="rating6" title="3점"></label>
                      <input type="radio" id="rating5" name="rating"
                        value="2.5"><label class="half" for="rating5"
                        title="2.5점"></label>
                      <input type="radio" id="rating4" name="rating"
                        value="2"><label for="rating4" title="2점"></label>
                      <input type="radio" id="rating3" name="rating"
                        value="1.5"><label class="half" for="rating3"
                        title="1.5점"></label>
                      <input type="radio" id="rating2" name="rating"
                        value="1"><label for="rating2" title="1점"></label>
                      <input type="radio" id="rating1" name="rating"
                        value="0.5"><label class="half" for="rating1"
                        title="0.5점"></label>
                    </fieldset>
                    <div class="d-flex gap-3">
                      <textarea
                        class="form-control bg-dark review-fm text-white"
                        id="reviewTextarea" rows="3" maxlength="300"
                        placeholder="이 작품에 대한 내 평가를 300자 이내로 남겨보세요!"
                        style="width: 90%;" required></textarea>
                      <button type="submit" class="btn btn-primary"
                        style="width: 10%;">작성</button>
                    </div>
                  </form>

                  <!-- 리뷰 목록 -->
                  <div class="row text-white mt-5">
                    <h6 class="fs-6 mb-3 pb-3">리뷰 (50)</h6>
                    <div id="review_list" class="mt-5">
                      <div class="row review_content mb-5 p-0">
                        <small class="review_name">닉네임</small>
                        <small
                          class="review_date text-secondary mb-2">2025.05.19</small>
                        <div class="review_text mb-3">리뷰 내용...</div>
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
    <!-- Axios CDN -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 커스텀 JS -->
    <script src="/js/index.js"></script>
  </body>
</html>