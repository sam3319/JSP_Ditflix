<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : reviewDetail.jsp
 * 작성일 : 2025. 6. 23.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 리뷰게시판 상세조회
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
    <title>리뷰 상세보기</title>
		<!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/reviewboardPost.css">
  </head>
  <body>
    <!-- 사이드 메뉴 바 -->
    <div class="sidebar">
      <ul class="nav nav-underline mt-5">
        <li class="nav-item ms-4 mt-3">
          <a class="nav-link text-white" href="myPage.do"><i class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-5">
          <a class="nav-link text-white" href="index.do"><i class="bi bi-house" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link text-white" href="search.do"><i class="bi bi-search" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link active" href="reviewBoard.do"><i class="bi bi-image" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link text-white" href="freeBoard.do"><i class="bi bi-chat-square-text-fill" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link text-white" href="memberShip.do"><i class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>      
      </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <div class="h1 mt-5" style="color: white;">리뷰게시판</div>
          <hr class="mt-3" style="border: 0; border-top: 3px solid #9a4eff; width:20%;">
        </div>
        <a href="ReviewBoardList.ReviewBoardDo" class="btn btn-outline-light"><i class="bi bi-arrow-left me-2"></i>목록으로</a>
      </div>
      
      <!-- 게시글 내용 -->
      <div class="review-container mt-4">
        <div class="review-header pb-3">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <h2>${review.title}</h2>
            <div>
              <span class="category-badge category-${review.category} me-2">${review.category}</span>
            </div>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
              <div class="user-profile me-2">${fn:substring(review.nickName, 0, 1)}</div>
              <span class="me-3">${review.nickName}</span>
              <small class="text-white">${fn:substring(review.createdAt, 0, 16)}</small>
            </div>
            <div>
              <div class="d-flex align-items-center">
                <div>
                  <i class="bi bi-eye me-1"></i> ${review.viewCount}
                  <i class="bi bi-chat-dots ms-3 me-1"></i> 0
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="review-content mt-4">
          <p style="white-space: pre-wrap;">${review.content}</p>
          
          <!-- 이미지가 있을 때만 표시 -->
          <c:if test="${not empty review.imageFileNames}">
            <div class="review-images">
              <c:forEach var="imageName" items="${review.imageFileNames}" varStatus="status">
                <img src="/photo/review/${imageName}" class="review-image" 
                     data-bs-toggle="modal" data-bs-target="#imageModal" 
                     data-src="/photo/review/${imageName}" 
                     alt="리뷰 이미지 ${status.index + 1}">
              </c:forEach>
            </div>
          </c:if>
        </div>
        
        <!-- 게시글 액션 버튼 (작성자만 표시) -->
        <c:if test="${sessionScope.loginId == review.loginId}">
          <div class="d-flex justify-content-between mt-4">
            <div>
              <a href="ReviewBoardUpdateForm.ReviewBoardDo?id=${review.reviewBoardId}" class="btn btn-outline-light btn-sm me-2">수정</a>
              <button class="btn btn-outline-danger btn-sm" onclick="deleteReview(${review.reviewBoardId})">삭제</button>
            </div>
          </div>
        </c:if>
        
        <!-- 댓글 섹션 (추후 구현) -->
        <div class="comment-section">
          <h4 class="mb-4">댓글 <span class="text-white">0</span></h4>
          
          <!-- 댓글이 없을 때 -->
          <div class="text-center text-white py-4">
            댓글이 없습니다.
          </div>
          
          <!-- 댓글 작성 폼 -->
          <c:if test="${not empty sessionScope.loginId}">
            <div class="comment-form">
              <textarea class="form-control" rows="3" placeholder="댓글을 작성해주세요."></textarea>
              <div class="d-flex justify-content-end mt-3">
                <button class="btn custom-btn">댓글 작성</button>
              </div>
            </div>
          </c:if>
          
          <!-- 로그인하지 않은 사용자 -->
          <c:if test="${empty sessionScope.loginId}">
            <div class="comment-form">
              <div class="text-center py-4">
                <p class="text-muted mb-3">댓글을 작성하려면 로그인이 필요합니다.</p>
                <a href="loginForm.do" class="btn btn-outline-light">로그인</a>
              </div>
            </div>
          </c:if>
        </div>
  
      </div>
    </div>
    
    <!-- 이미지 모달 -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">이미지 보기</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body text-center">
            <img src="" class="modal-image" id="modalImage">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>

		<!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    <!-- 커스텀 JS -->
   	<script src="/js/reviewboardPost.js"></script>
  </body>
</html>
