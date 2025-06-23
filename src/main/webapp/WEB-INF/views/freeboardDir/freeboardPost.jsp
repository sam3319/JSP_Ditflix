<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : freeboardPost
 * 작성일 : 2025. 6. 22.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 자유게시판 게시글 조회 페이지
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자유게시판 - 게시글 조회</title>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
      crossorigin="anonymous">
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
     <link rel="stylesheet" href="/css/freeboardPost.css">
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
          <a class="nav-link ft-wt" href="reviewBoard.do"><i class="bi bi-image" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link active" href="freeBoard.do"><i class="bi bi-chat-square-text-fill" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="membership.do"><i class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>      
      </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <div class="h1 mt-5" style="color: white;">자유게시판</div>
          <hr class="mt-3" style="border: 0; border-top: 3px solid #9a4eff; width:20%;">
        </div>
        <a href="FreeBoardList.FreeBoardDo" class="btn btn-outline-light"><i class="bi bi-arrow-left me-2"></i>목록으로</a>
      </div>
      
      <!-- 게시글 내용 -->
      <div class="post-container mt-4">
        <div class="post-header pb-3">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <div class="d-flex align-items-center">
              <h2 class="me-3">${board.title}</h2>
              <span class="category-badge 
                  <c:choose>
                      <c:when test='${board.category == "일반"}'>category-general</c:when>
                      <c:when test='${board.category == "질문"}'>category-question</c:when>
                      <c:when test='${board.category == "토론"}'>category-discussion</c:when>
                      <c:when test='${board.category == "정보"}'>category-info</c:when>
                      <c:otherwise>category-general</c:otherwise>
                  </c:choose> me-2">${board.category}</span>
            </div>
          </div>
          <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
              <div class="user-profile me-2">${fn:substring(board.nickName, 0, 1)}</div>
              <span class="me-3">${board.nickName}</span>
              <small class="text-white">${fn:substring(board.createdAt, 0, 16)}</small>
            </div>
            <div>
              <i class="bi bi-eye me-1"></i> ${board.viewCount}
              <i class="bi bi-chat-dots ms-3 me-1"></i> ${commentCount != null ? commentCount : 0}
            </div>
          </div>
        </div>
        
        <div class="post-content mt-4">
          <p style="white-space: pre-wrap;">${board.content}</p>
        </div>
        
        <!-- 게시글 액션 버튼 -->
        <c:if test="${sessionScope.loginId == board.loginId}">
          <div class="d-flex justify-content-between mt-4">
            <div>
              <a href="FreeBoardUpdateForm.FreeBoardDo?id=${board.freeBoardId}" class="btn btn-outline-light btn-sm me-2">수정</a>
              <button class="btn btn-outline-danger btn-sm" onclick="deletePost(${board.freeBoardId})">삭제</button>
            </div>
          </div>
        </c:if>
        
        <!-- 댓글 섹션 -->
        <div class="comment-section">
          <h4 class="mb-4">댓글 <span class="text-white">${commentCount != null ? commentCount : 0}</span></h4>
          
          <!-- 댓글이 있을 때 -->
          <c:if test="${not empty comments}">
            <c:forEach var="comment" items="${comments}" varStatus="status">
              <div class="comment" data-comment-id="${comment.commentId}">
                <div class="d-flex justify-content-between align-items-start">
                  <div class="d-flex align-items-start">
                    <div class="user-profile me-2">${fn:substring(comment.nickName, 0, 1)}</div>
                    <div>
                      <div class="d-flex align-items-center mb-1">
                        <span class="comment-author me-2">${comment.nickName}</span>
                        <small class="text-white">${fn:substring(comment.createdAt, 0, 16)}</small>
                      </div>
                      <p class="comment-content mb-2" style="white-space: pre-wrap;">${comment.content}</p>
                      <c:if test="${sessionScope.loginId == comment.loginId}">
                        <div class="comment-actions">
                          <button class="btn btn-sm btn-link text-danger p-0" onclick="deleteComment(${comment.commentId}, ${board.freeBoardId})">
                            <i class="bi bi-trash"></i> 삭제
                          </button>
                        </div>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:if>

          <!-- 댓글이 없을 때 -->
          <c:if test="${empty comments}">
            <div class="text-center text-white py-4">
              댓글이 없습니다.
            </div>
          </c:if>
          
          <!-- 댓글 작성 폼 -->
          <c:if test="${not empty sessionScope.loginId}">
            <div class="comment-form">
              <form action="FreeBoardCommentInsert.FreeBoardDo" method="post">
                <input type="hidden" name="freeBoardId" value="${board.freeBoardId}">
                <textarea name="content" class="form-control" rows="3" placeholder="댓글을 작성해주세요." required></textarea>
                <div class="d-flex justify-content-end mt-3">
                  <button type="submit" class="btn custom-btn">댓글 작성</button>
                </div>
              </form>
            </div>
          </c:if>
          
          <!-- 로그인하지 않은 사용자일 때 -->
          <c:if test="${empty sessionScope.loginId}">
            <div class="comment-form">
              <div class="text-center py-4">
                <p class="text-white mb-3">댓글을 작성하려면 로그인이 필요합니다.</p>
                <a href="loginForm.do" class="btn btn-outline-light">로그인</a>
              </div>
            </div>
          </c:if>
        </div>
      </div>
    </div>

    <!-- 부트스트랩 JS -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
      crossorigin="anonymous"></script>
    <!-- 커스텀 JS -->
    <script src="/js/freeboardPost.js"></script>
  </body>
</html>
