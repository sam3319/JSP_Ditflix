<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : freeboard.jsp
 * 작성일 : 2025. 6. 23.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 자유게시판
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자유게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/freeboard.css">
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
          <a class="nav-link ft-wt" href="memberShip.do"><i class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>
      </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <div class="h1 mt-5" style="color: white;">자유게시판</div>
      <hr class="mt-3" style="border: 0; border-top: 3px solid #9a4eff; width:20%;">

      <div class="d-flex mb-4">
        <!-- 게시글 검색 폼 -->
        <form action="FreeBoardList.FreeBoardDo" method="get" class="d-flex me-2 flex-grow-1" id="PostSearch">
          <div class="input-group">
            <select class="form-select bg-dark text-white border-dark" id="searchType" name="searchType" style="max-width: 120px;">
              <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
              <option value="content" ${searchType == 'content' ? 'selected' : ''}>내용</option>
              <option value="writer" ${searchType == 'writer' ? 'selected' : ''}>작성자</option>
            </select>
            <input type="text" id="searchKeyword" name="searchKeyword" value="${searchKeyword}" class="form-control bg-dark text-white border-dark" placeholder="검색어를 입력하세요">
            <button type="submit" class="btn custom-btn">
              <i class="bi bi-search me-1"></i>검색
            </button>
          </div>
        </form>
        <button type="button" class="btn custom-btn" onclick="location.href='FreeBoardWrite.FreeBoardDo'">
          <i class="bi bi-pencil-square me-1"></i>글쓰기
        </button>
      </div>

      <!-- 게시판 목록 테이블 -->
      <div class="table-responsive">
        <table class="table table-dark table-hover">
          <thead>
            <tr class="text-center">
              <th width="10%">번호</th>
              <th width="55%">제목</th>
              <th width="10%">작성자</th>
              <th width="10%">작성일</th>
              <th width="10%">조회수</th>
            </tr>
          </thead>
          <tbody>
            <!-- 게시판에 게시글이 존재할 경우 -->
            <c:forEach var="board" items="${boardList}" varStatus="status">
              <tr>
                <td class="text-center">${board.freeBoardId}</td>
                <td>
                  <span class="category-badge 
                      <c:choose>
                          <c:when test='${board.category == "일반"}'>category-general</c:when>
                          <c:when test='${board.category == "질문"}'>category-question</c:when>
                          <c:when test='${board.category == "토론"}'>category-discussion</c:when>
                          <c:when test='${board.category == "정보"}'>category-info</c:when>
                          <c:otherwise>category-general</c:otherwise>
                      </c:choose>">${board.category}</span>
                  <a href="FreeBoardPost.FreeBoardDo?id=${board.freeBoardId}" class="text-decoration-none text-white post-title">
                    ${board.title}
                  </a>
                  <span class="comment-count">[${board.commentCount != null ? board.commentCount : 0}]</span>
                </td>
                <td class="text-center">${board.nickName}</td>
                <td class="text-center">${board.createdAt.toLocalDate()}</td>
                <td class="text-center">${board.viewCount}</td>
              </tr>
            </c:forEach>
            
            <!-- 게시판에 게시글이 없을 경우 -->
            <c:if test="${empty boardList}">
              <tr>
                <td colspan="5" class="text-center text-white">게시글이 없습니다.</td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </div>

      <!-- 페이징 네비게이션 -->
      <nav aria-label="Page navigation" class="mt-5">
        <ul class="pagination justify-content-center">
          <!-- 이전 페이지가 있을 경우 이전버튼을 활성화 -->
          <c:if test="${pageInfo.hasPrevious}">
            <li class="page-item">
              <a class="page-link" href="FreeBoardList.FreeBoardDo?page=${pageInfo.currentPage-1}&searchKeyword=${searchKeyword}&searchType=${searchType}">
                <i class="bi bi-chevron-left"></i>
              </a>
            </li>
          </c:if>
          
          <!-- 페이지 번호 -->
          <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
            <li class="page-item ${i == pageInfo.currentPage ? 'active' : ''}">
              <a class="page-link" href="FreeBoardList.FreeBoardDo?page=${i}&searchKeyword=${searchKeyword}&searchType=${searchType}">${i}</a>
            </li>
          </c:forEach>
          
          <!-- 다음 페이지가 있을 경우 다음버튼을 활성화 -->
          <c:if test="${pageInfo.hasNext}">
            <li class="page-item">
              <a class="page-link" href="FreeBoardList.FreeBoardDo?page=${pageInfo.currentPage+1}&searchKeyword=${searchKeyword}&searchType=${searchType}">
                <i class="bi bi-chevron-right"></i>
              </a>
            </li>
          </c:if>
        </ul>
      </nav>
    </div>

    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
  </body>
</html>
