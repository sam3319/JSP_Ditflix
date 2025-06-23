<%
/**==================================================
 * 프로그램명 : ott
 * 파일명 : freeboardEdit
 * 작성일 : 2025. 6. 23.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 자유게시판 수정 페이지
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
    <title>자유게시판 글수정</title>
    <!-- 부스스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/freeboardEdit.css">
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
          <a class="nav-link active" href="freeBoardDo"><i class="bi bi-chat-square-text-fill" style="font-size: 1.5rem;"></i></a>
        </li>
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="memberShip.do"><i class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>      
      </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <div class="h1 mt-5" style="color: white;">자유게시판</div>
      <hr class="mt-3" style="border: 0; border-top: 3px solid #9a4eff; width:20%;">
      
      <div class="mt-4 mb-3 d-flex justify-content-between align-items-center">
        <h4 class="text-white">글 수정하기</h4>
        <a href="FreeBoardPost.FreeBoardDo?id=${board.freeBoardId}" class="btn btn-outline-light"><i class="bi bi-arrow-left me-2"></i>돌아가기</a>
      </div>
      
      <!-- 에러 메시지 -->
      <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
          ${errorMessage}
        </div>
      </c:if>
      
      <form action="FreeBoardUpdate.FreeBoardDo" method="post">
        <!-- 게시글 ID 숨김-->
        <input type="hidden" name="id" value="${board.freeBoardId}">
        
        <div class="mb-3">
          <input type="text" class="form-control form-control-lg" name="title" value="${board.title}" placeholder="제목을 입력해주세요" required>
        </div>
        
        <div class="mb-3">
          <select class="form-select" name="category" required>
            <option value="" disabled>카테고리 선택</option>
            <option value="일반" ${board.category == '일반' ? 'selected' : ''}>일반</option>
            <option value="질문" ${board.category == '질문' ? 'selected' : ''}>질문</option>
            <option value="토론" ${board.category == '토론' ? 'selected' : ''}>토론</option>
            <option value="정보" ${board.category == '정보' ? 'selected' : ''}>정보</option>
          </select>
        </div>
        
        <div>
          <textarea class="form-control" name="content" rows="25" placeholder="내용을 입력해주세요" required>${board.content}</textarea>
        </div>
        
        <div class="d-flex justify-content-between my-4">
          <button type="button" class="btn btn-outline-light" onclick="location.href='FreeBoardPost.FreeBoardDo?id=${board.freeBoardId}'">취소</button>
          <div>
            <button type="submit" class="btn custom-btn px-4">수정하기</button>
          </div>
        </div>
      </form>
    </div>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
  </body>
</html>
