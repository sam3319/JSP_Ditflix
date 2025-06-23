<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : reviewboardWrite.jsp
 * 작성일 : 2025. 6. 23.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 리뷰게시판 글작성
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>리뷰 작성</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/reviewboardWrite.css">
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
      <div class="h1 mt-5" style="color: white;">리뷰게시판</div>
      <hr class="mt-3" style="border: 0; border-top: 3px solid #9a4eff; width:20%;">
      
      <!-- 에러 메시지 -->
      <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
          ${errorMessage}
        </div>
      </c:if>
      
      <form action="ReviewBoardInsert.ReviewBoardDo" method="post" class="mt-5" enctype="multipart/form-data">
        <div class="row mb-4">
          <div class="col-md-8">
            <input type="text" name="title" class="form-control form-control-lg" placeholder="제목을 입력해주세요." required>
          </div>
          <div class="col-md-4">
            <select name="category" class="form-select form-select-lg" required>
              <option value="" selected disabled>카테고리 선택</option>
              <option value="영화">영화</option>
              <option value="드라마">드라마</option>
              <option value="애니메이션">애니메이션</option>
              <option value="다큐멘터리">다큐멘터리</option>
            </select>
          </div>
        </div>     
        <div class="mb-4">
          <textarea name="content" class="form-control" rows="25" placeholder="내용을 작성해주세요." required></textarea>
        </div>
        
        <div class="mb-4">
          <label class="form-label text-white mb-2">이미지 첨부</label>
          <input type="file" name="images" class="form-control" accept="image/*" id="image-upload" multiple>
          <div class="form-text text-white">최대 5개의 이미지를 업로드할 수 있습니다. (JPG, PNG, GIF)</div>
          
          <div class="image-preview mt-2">
            <span id="preview-placeholder">이미지 미리보기</span>
          </div>
        </div>
        
        <div class="d-flex justify-content-between my-4">
          <button type="button" class="btn btn-outline-light px-3" onclick="location.href='ReviewBoardList.ReviewBoardDo'">취소</button>
          <button type="submit" class="btn custom-btn px-3">등록</button>
        </div>
      </form>
    </div>
		<!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    <!-- 커스텀 JS -->
    <script src="/js/reviewboardWrite.js"></script>
  </body>
</html>
