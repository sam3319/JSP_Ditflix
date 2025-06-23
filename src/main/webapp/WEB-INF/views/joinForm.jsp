<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : join.jsp
 * 작성일 : 2025. 6. 6.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 회원가입 페이지
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <!-- 부트스트랩 CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
            crossorigin="anonymous">
        <!-- 커스텀 CSS -->
        <link rel="stylesheet" href="css/joinForm.css">
        <!-- Axios CDN -->
        <script src="https://unpkg.com/axios@0.26.0/dist/axios.min.js"></script>
    </head>
    <body>
        <div
            class="container-fluid d-flex justify-content-center align-items-center"
            style="height: 100vh;">
            <!-- 회원가입 폼 -->
            <form id="joinForm" action="insert.UserDo" method="post" class="border border-dark">
                <div class="row">
                    <h1 class="col h1 mb-5 fw-bold">Join</h1>
                </div>
                <div class="row">
                    <!-- 아이디 입력 -->
                    <div class="col-md-6 mb-4">
                        <p>아이디</p>
                        <div class="form-floating">
                            <input type="text"
                                id="loginId"
                                name="loginId"
                                class="id"
                                maxlength="12"
                                placeholder="아이디 (4-12자, 영문+숫자)"
                                required>
                        </div>
                        <div id="loginIdFeedback" class="feedback"></div>
                    </div>
                    <!-- 비밀번호 입력 -->
                    <div class="col-md-6">
                        <p>비밀번호</p>
                        <div class="form-floating">
                            <input type="password"
                                id="password"
                                name="password"
                                maxlength="20"
                                placeholder="비밀번호 (6자-20자, 영문+숫자)"
                                required>
                        </div>
                        <div id="passwordFeedback" class="feedback"></div>
                    </div>
                </div>
                <!-- 닉네임 입력 -->
                <p>닉네임</p>
                <div class="form-floating mb-4">
                     <input type="text" 
                           id="nickName" 
                           name="nickName" 
                           placeholder="닉네임 (2-10자)" 
                           maxlength="10" 
                           required>
                </div>
                <div id="nickNameFeedback" class="feedback"></div>
                <!-- 이메일 입력 -->
                <p>이메일</p>
                <div class="form-floating mb-4">
                    <input type="email" 
                           id="email" 
                           name="email" 
                           placeholder="donghyun@example.com" 
                           required>
                </div>
                <div id="emailFeedback" class="feedback"></div>
                <!-- 성별 입력 -->
                <div class="row mb-4">
                    <div class="col-md-6">
                        <p>성별</p>
                        <select class="form-select"
                            aria-label="Default select example"
                            id="gender"
                            name="gender"
                            required>
                            <option value="">성별 선택</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                        <div id="genderFeedback" class="feedback"></div>
                    </div>
                    <!-- 전화번호 입력 -->
                    <div class="col-md-6">
                        <p>전화번호</p>
                        <input type="tel" 
                           id="phone" 
                           name="phone" 
                           placeholder="010-0000-0000" 
                           maxlength="13" 
                           required>
                    <div id="phoneFeedback" class="feedback"></div>
                    </div>
                </div>
                <!-- 개인정보 수집 동의 -->
                <div class="mb-3 form-check">
                    <input type="checkbox" 
                       id="agreeTerms" 
                       name="agreeTerms" 
                       class="form-check-input" 
                       required>
                    <label class="form-check-label" for="agreeTerms">개인정보 수집동의</label>
                </div>
                <hr class="mb-4">
                <!-- 회원가입 버튼 -->
                <button type="submit" id="submitBtn" class="bg fw-semibold">회원가입</button>
                <div class="mt-3 text-center">
                <span>이미 계정이 있으신가요? <a href="login.do">로그인하기</a></span>
            </div>
            </form>
        </div>
        <!-- 부트스트랩 JS -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
        <!-- 커스텀 JS -->
        <script src="js/join.js"></script>
    </body>
</html>