<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : myPage.jsp
 * 작성일 : 2025. 6. 8.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 마이 페이지
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
    <title>마이페이지</title>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
      crossorigin="anonymous">
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/myPage.css">
  </head>
  <body>
  
  <!-- 검색 결과에서 확인된 메시지 표시 방법 -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                ${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i>
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>
  
    <!-- 사이드 메뉴 바 -->
    <div class="sidebar">
      <ul class="nav nav-underline mt-5">
        <!-- 개인정보 페이지 이동 -->
        <li class="nav-item ms-4 mt-3">
          <a class="nav-link active" href="myPage.do"><i
              class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a>
        </li>
        <!-- 메인페이지 이동 -->
        <li class="nav-item ms-4 mt-5">
          <a class="nav-link ft-wt" href="index.do"><i class="bi bi-house"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <!-- 검색페이지 이동 -->
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="search.do"><i class="bi bi-search"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <!-- 리뷰게시판 이동 -->
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="reviewBoard.do"><i class="bi bi-image"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <!-- 자유게시판 이동 -->
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="freeBoard.do"><i
              class="bi bi-chat-square-text-fill"
              style="font-size: 1.5rem;"></i></a>
        </li>
        <!-- 멤버십 페이지 이동 -->
        <li class="nav-item ms-4 mt-4">
          <a class="nav-link ft-wt" href="membership.do"><i
              class="bi bi-question-square" style="font-size: 1.5rem;"></i></a>
        </li>
      </ul>
    </div>

    <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <div class="h1 mt-5 fw-semibold" style="color: white;">마이페이지</div>
      <hr class="mt-3"
        style="border: 0; border-top: 3px solid #9a4eff; width:20%;">

      <!-- 프로필 섹션 -->
      <div class="profile-section d-flex align-items-center">
        <img src="/image/profile1.png" alt="User" class="profile-avatar">
        <label for="ProfileFileName">
          <input type="file" id="ProfileFileName"
            name="ProfileFileName"
            accept="image/*"
            style="display: none;">
            <i class="bi bi-pencil profile-update"></i>
          </label>
        <div class="profile-info">
          <h2 class="fw-semibold">${sessionScope.nickName	 }</h2>
          <p>${sessionScope.loginUser.email }</p>
          <p>멤버쉽 등급 출력하기</p>
          <!-- 로그아웃 버튼 -->
          <div class="profile-actions">
            <button class="btn btn-outline-danger" onclick="logout()">
              <i class="bi bi-box-arrow-right me-2"></i>로그아웃
            </button>
          </div>
        </div>

      </div>

      <!-- 탭 메뉴 -->
      <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
          <button class="nav-link active" id="profile-tab" data-bs-toggle="tab"
            data-bs-target="#profile-tab-pane" type="button" role="tab"
            aria-controls="profile-tab-pane" aria-selected="true">개인정보
            변경</button>
        </li>
        <li class="nav-item" role="presentation">
          <button class="nav-link" id="membership-tab" data-bs-toggle="tab"
            data-bs-target="#membership-tab-pane" type="button" role="tab"
            aria-controls="membership-tab-pane" aria-selected="false">멤버십
            관리</button>
        </li>
       	<li class="nav-item" role="presentation">
          <button class="nav-link" id="userdelete-tab" data-bs-toggle="tab"
            data-bs-target="#userdelete-tab-pane" type="button" role="tab"
            aria-controls="userdelete-tab-pane" aria-selected="false">회원
            탈퇴</button>
        </li>
      </ul>

      <!-- 탭 내용 -->
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="profile-tab-pane"
        role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
        <div class="content-card">
          <h3 class="mb-4 fw-semibold">개인정보 변경</h3>
          
          <!-- 개인정보 변경 폼 -->
            <form id="userUpdate" action="update.UserDo" method="post">
              <div class="row mb-3">
                <div class="col-md-6">
                  <label for="id"
                    class="form-label text-white fw-semibold">아이디</label>
                  <input type="text" class="form-control" id="loginId" name="loginId" readonly
                    value="${sessionScope.loginId }" required>
                    <small class="text-white">아이디는 변경할 수 없습니다.</small>
                </div>
                <div class="col-md-6">
                  <label for="name"
                    class="form-label text-white fw-semibold">닉네임</label>
                  <input type="text" class="form-control" id="nickName"
                    name="nickName" value="${sessionScope.nickName }" maxlength="10" required>
                    <small id="nickNameFeedback"></small>
                </div>
              </div>

              <div class="row mb-3">
                <div class="col-md-6">
                  <label for="email"
                    class="form-label text-white fw-semibold">이메일</label>
                  <input type="email" class="form-control" id="email"
                    name="email" value="${sessionScope.loginUser.email }" required>
                </div>
                <div class="col-md-6">
                  <label for="phone"
                    class="form-label text-white fw-semibold">전화번호</label>
                  <input type="tel" class="form-control" id="phone"
                    name="phone" maxlength="13" value="${sessionScope.loginUser.phone }" required>
                </div>
              </div>
              <!-- 비밀번호 변경 탭 -->
              <h4 class="mt-4 mb-3 fw-semibold">비밀번호 변경</h4>
              <div class="row mb-3">
                <div class="col-md-6">
                  <label for="pwd" class="form-label text-white fw-semibold">새
                    비밀번호</label>
                  <input type="password" class="form-control" id="password"
                    name="password" maxlength="20" placeholder="변경할 비밀번호를 입력해주세요." required>
                    <small class="text-white" id="passwordFeedback">비밀번호 (6자-12자, 영문+숫자)</small>
                </div>
              </div>
              <!-- 마케팅 정보 수신 동의 탭 -->
              <h4 class="mt-4 mb-3 fw-semibold">마케팅 정보 수신 동의</h4>
              <div class="mb-3">
                <div class="form-check">
                  <label class="form-check-label text-white">
                    <input class="form-check-input" type="checkbox" checked>
                    이메일 수신 동의
                  </label>
                </div>
                <div class="form-check">
                  <label class="form-check-label text-white">
                    <input class="form-check-input" type="checkbox" checked>
                    SMS 수신 동의
                  </label>
                </div>
              </div>

              <div class="d-flex justify-content-end mt-4">
                <button type="button"
                  class="btn btn-outline-light me-2">취소</button>
                <button type="submit" class="btn custom-btn">저장하기</button>
              </div>
            </form>
          </div>
        </div>

        <!-- 멤버십 관리 탭 -->
        <div class="tab-pane fade" id="membership-tab-pane" role="tabpanel"
          aria-labelledby="membership-tab" tabindex="0">
          <div class="content-card">
            <h3 class="mb-4 fw-semibold">멤버십 관리</h3>

            <!-- 현재 멤버십 정보 -->
            <div class="billing-info mb-4">
              <h5 class="text-white">현재 멤버십 정보</h5>
              <p class="text-white"><strong>스탠다드 멤버십</strong></p>
              <p class="text-white">다음 결제일: 2025년 6월 15일</p>
              <p class="text-white">월 구독료: ₩13,500</p>

              <div class="payment-method">
                <i class="bi bi-credit-card"></i>
                <div class="payment-info">
                  <p class="mb-0 text-white"><strong>신용카드</strong></p>
                  <p class="mb-0 text-white">KB국민카드 (1234-****-****-5678)</p>
                </div>
              </div>
            </div>

            <h5 class="mb-3 fw-semibold">멤버십 변경</h5>
            <p class="text-white mb-4">언제든지 멤버십을 변경할 수 있으며, 변경 사항은 다음 결제일부터
              적용됩니다.</p>

            <!-- 멤버십 변경 폼 -->
            <form method="post" id="membershipForm">
              <div class="row row-cols-1 row-cols-md-3 g-4 mb-4 ">
                <input type="hidden" id="membership" name="membership" value>
                <!-- 베이직 멤버십 -->
                <div class="col">
                  <div class="membership-card">
                    <h4 class="text-white">베이직</h4>
                    <div class="price-container mt-3 mb-3">
                      <span class="price">₩9,500</span>
                      <span class="period">/월</span>
                    </div>
                    <ul class="feature-list">
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> HD 화질 (720p)</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 1개 디바이스 동시
                        시청</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 무제한 영화 및 TV
                        프로그램</li>
                      <li class="disabled"><i class="bi bi-x-circle-fill"></i>
                        광고 없는 시청</li>
                      <li class="disabled"><i class="bi bi-x-circle-fill"></i>
                        다운로드 기능</li>
                    </ul>
                    <button class="btn btn-outline-light w-100"
                      id="basic">변경하기</button>
                  </div>
                </div>

                <!-- 스탠다드 멤버십 -->
                <div class="col">
                  <div class="membership-card active">
                    <span class="active-badge">현재 이용중</span>
                    <h4 class="text-white">스탠다드</h4>
                    <div class="price-container mt-3 mb-3">
                      <span class="price">₩13,500</span>
                      <span class="period">/월</span>
                    </div>
                    <ul class="feature-list">
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> Full HD 화질
                        (1080p)</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 2개 디바이스 동시
                        시청</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 무제한 영화 및 TV
                        프로그램</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 광고 없는 시청</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 다운로드 기능</li>
                    </ul>
                    <button class="btn custom-btn w-100" id="standard"
                      disabled>현재 이용중</button>
                  </div>
                </div>

                <!-- 프리미엄 멤버십 -->
                <div class="col">
                  <div class="membership-card">
                    <h4 class="text-white">프리미엄</h4>
                    <div class="price-container mt-3 mb-3">
                      <span class="price">₩17,000</span>
                      <span class="period">/월</span>
                    </div>
                    <ul class="feature-list">
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 4K UHD + HDR
                        화질</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 4개 디바이스 동시
                        시청</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 무제한 영화 및 TV
                        프로그램</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 광고 없는 시청</li>
                      <li class="text-white"><i
                          class="bi bi-check-circle-fill"></i> 다운로드 기능</li>
                    </ul>
                    <button class="btn btn-outline-light w-100"
                      id="premium">변경하기</button>
                  </div>
                </div>
              </div>

              <!-- 결제 수단 관리 -->
              <h5 class="mt-5 mb-3 fw-semibold">결제 수단 관리</h5>
              <div class="row mb-4">
                <div class="col-md-6">
                  <div class="billing-info">
                    <div
                      class="d-flex justify-content-between align-items-center mb-2">
                      <div class="payment-method">
                        <i class="bi bi-credit-card"></i>
                        <div class="payment-info">
                          <p class="mb-0 text-white"><strong>KB국민카드</strong></p>
                          <p class="mb-0 text-white">1234-****-****-5678</p>
                        </div>
                      </div>
                      <span class="badge bg-success">기본 결제수단</span>
                    </div>
                    <div class="d-flex justify-content-end mt-2">
                      <button
                        class="btn btn-sm btn-outline-light notImpl">수정</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <button class="btn btn-outline-light w-100 h-100 notImpl">
                    <i class="bi bi-plus-lg me-2"></i>새 결제 수단 추가
                  </button>
                </div>
              </div>

              <!-- 구독 해지 버튼 -->
              <div class="mt-5 pt-3 border-top border-secondary">
                <h5 class="text-danger mb-3 fw-semibold">멤버십 해지</h5>
                <p class="text-white">멤버십을 해지하면 다음 결제일까지 서비스를 이용할 수 있으며, 이후에는 모든
                  콘텐츠 접근이 제한됩니다.</p>
                <button class="btn btn-outline-danger" id="cancel">멤버십
                  해지하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      
      <!-- 회원탈퇴 탭 -->
      <div class="tab-pane fade" id="userdelete-tab-pane" role="tabpanel"
        aria-labelledby="userdelete-tab" tabindex="0">
        <div class="content-card">
          <h3 class="mb-4 fw-semibold">회원탈퇴</h3>
          <div class="billing-info">
            <form action="delete.do" method="post" id="deleteForm">
              <input type="hidden" value="${sessionScope.loginId}" name="loginId" id="loginId">
              <p class="text-danger mb-3"><strong>
                <i class="bi bi-exclamation-triangle-fill me-2"></i>주의 :
                </strong>회원탈퇴 시 모든 데이터가
                삭제되며 복구할 수 없습니다.</p>
              <input type="submit" class="btn btn-danger"
                value="회원탈퇴">
            </form>
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
    <script src="js/myPage.js"></script>
  </body>
</html>
