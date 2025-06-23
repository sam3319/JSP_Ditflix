<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : reviewboard.jsp
 * 작성일 : 2025. 6. 23.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 리뷰게시판 목록
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>리뷰게시판</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/reviewboard.css">
  </head>
  <body>
    <!-- 사이드 메뉴 바 -->
    <div class="sidebar">
      <ul class="nav nav-underline mt-5">
        <li class="nav-item ms-4 mt-3">
          <a class="nav-link ft-wt" href="myPage.do"><i class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-5">
          <a class="nav-link ft-wt" href="index.do"><i class="bi bi-house" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="search.do"><i class="bi bi-search" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link active" href="ReviewBoardList.ReviewBoardDo"><i class="bi bi-image" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="FreeBoardList.FreeBoardDo"><i class="bi bi-chat-square-text-fill" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="membership.do"><i class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>      
      </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <div class="h1 mt-5" style="color: white;">리뷰게시판</div>
      <hr class="mt-3" style="border: 0; border-top: 3px solid #9a4eff; width:20%;">
      
      <div class="d-flex mb-4">
        <!-- 게시글 검색 폼 -->
        <form action="ReviewBoardList.ReviewBoardDo" method="get" class="d-flex me-2 flex-grow-1">
          <div class="input-group">
            <select class="form-select bg-dark text-white border-dark" name="searchType" style="max-width: 120px;">
              <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
              <option value="content" ${searchType == 'content' ? 'selected' : ''}>내용</option>
              <option value="writer" ${searchType == 'writer' ? 'selected' : ''}>작성자</option>
            </select>
            <input type="text" name="searchKeyword" value="${searchKeyword}" class="form-control bg-dark text-white border-dark" placeholder="검색어를 입력하세요">
            <button type="submit" class="btn custom-btn">
              <i class="bi bi-search me-1"></i>검색
            </button>
          </div>
        </form>
        <button type="button" class="btn custom-btn" onclick="location.href='ReviewBoardWrite.ReviewBoardDo'">
          <i class="bi bi-pencil-square me-1"></i>글쓰기
        </button>
      </div>
      
      <!-- 리뷰 카드 목록 -->
      <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- 리뷰가 있을 때 -->
        <c:if test="${not empty reviewList}">
          <c:forEach var="review" items="${reviewList}" varStatus="status">
            <div class="col">
              <a href="ReviewBoardPost.ReviewBoardDo?id=${review.reviewBoardId}" class="text-decoration-none">
                <div class="card text-white">
                  <div class="card-img-container">
                    <!-- 이미지가 있을 때 -->
                    <c:if test="${not empty review.mainImageFileName}">
                      <img src="/photo/review/${review.mainImageFileName}" class="card-img-top" alt="리뷰 이미지">
                    </c:if>
                    <!-- 이미지가 없을 때 --> 
                    <c:if test="${empty review.mainImageFileName}">
                      <div class="card-img-top no-image">
                        <i class="bi bi-image"></i>
                      </div>
                    </c:if>
                    <span class="category-badge category-${review.category}">${review.category}</span>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title">${review.title}</h5>
                    <p class="card-text">${review.nickName}</p>
                    <div class="d-flex justify-content-between">
                      <small class="text-white">${fn:substring(review.createdAt, 0, 10)}</small>
                      <div>
                        <i class="bi bi-eye me-1"></i><small class="text-white">${review.viewCount}</small>
                        <i class="bi bi-chat-dots ms-2 me-1"></i><small class="comment-count">0</small>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </c:forEach>
        </c:if>
        
        <!-- 리뷰가 없을 때 -->
        <c:if test="${empty reviewList}">
          <div class="col-12">
            <div class="d-flex justify-content-center align-items-center" style="min-height: 400px;">
              <div class="text-center text-white">
                <i class="bi bi-image" style="font-size: 5rem; color: #666;"></i>
                <h3 class="mt-4 mb-3">등록된 리뷰가 없습니다.</h3>
                <p class="text-white mb-4">첫 번째 리뷰를 작성해보세요!</p>
                <button type="button" class="btn custom-btn" onclick="location.href='ReviewBoardWrite.ReviewBoardDo'">
                  <i class="bi bi-pencil-square me-2"></i>리뷰 작성하기
                </button>
              </div>
            </div>
          </div>
        </c:if>
      </div>

      <!-- 페이징 네비게이션 -->
      <c:if test="${not empty reviewList}">
        <nav aria-label="Page navigation" class="mt-5">
          <ul class="pagination justify-content-center">
            <!-- 이전 페이지 -->
            <c:if test="${pageInfo.hasPrevious}">
              <li class="page-item">
                <a class="page-link" href="ReviewBoardList.ReviewBoardDo?page=${pageInfo.currentPage-1}&searchKeyword=${searchKeyword}&searchType=${searchType}">
                  <i class="bi bi-chevron-left"></i>
                </a>
              </li>
            </c:if>
            
            <!-- 페이지 번호 -->
            <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
              <li class="page-item ${i == pageInfo.currentPage ? 'active' : ''}">
                <a class="page-link" href="ReviewBoardList.ReviewBoardDo?page=${i}&searchKeyword=${searchKeyword}&searchType=${searchType}">${i}</a>
              </li>
            </c:forEach>
            
            <!-- 다음 페이지 -->
            <c:if test="${pageInfo.hasNext}">
              <li class="page-item">
                <a class="page-link" href="ReviewBoardList.ReviewBoardDo?page=${pageInfo.currentPage+1}&searchKeyword=${searchKeyword}&searchType=${searchType}">
                  <i class="bi bi-chevron-right"></i>
                </a>
              </li>
            </c:if>
          </ul>
        </nav>
      </c:if>
    </div>

    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    
  </body>
</html>
