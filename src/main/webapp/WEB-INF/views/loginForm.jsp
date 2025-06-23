<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : login.jsp
 * 작성일 : 2025. 6. 6.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 로그인 페이지
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <!-- 부트스트랩 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
        <!-- 커스텀 CSS -->
        <link rel="stylesheet" href="css/loginForm.css">
    </head>
    <body>

        <div
            class="container-fluid d-flex justify-content-center align-items-center"
            style="height: 100vh;">
            <!-- 로그인 폼 -->
            <form action="login.UserDo" method="post" id="loginForm" class="border border-dark">
                <div class="row">
                    <div class="col mb-5">
                        <a class="h1 home" href="index.do">DITFlix</a>
                    </div>
                </div>
                <div class="row">
                    <h1 class="col h2 mb-4 fw-semibold">로그인</h1>
                </div>
                
                <!-- 회원가입 완료 시 메시지 출력 -->
                <c:if test="${not empty joinSuccess }">
               		<div class="alert alert-success" role="alert">
               			${joinSuccess }
               		</div>
               	</c:if>
               
                <!-- 로그인 실패 시 오류 메시지 출력 -->
               	<c:if test="${not empty errorMessage }">
               		<div class="alert alert-danger" role="alert">
               			${errorMessage }
               		</div>
               	</c:if>
                
                <!-- 아이디 입력 -->
                <div class="form-floating mb-3">
                    <input type="text"
                            class="form-control"
                            id="loginId"
                            name="loginId"
                            maxlength="12"
                            placeholder="아이디"
                            required>
                    <label for="loginId">아이디</label>
                </div>
                <!-- 비밀번호 입력 -->
                <div class="form-floating">
                    <input type="password"
                            class="form-control mb-3"
                            id="password"
                            name="password"
                            maxlength="20"
                            placeholder="비밀번호"
                            required>
                    <label for="password">비밀번호</label>
                </div>
                <!-- 로그인 정보 저장 -->
                <div class="mb-3 form-check">
                    <input type="checkbox"
                            class="form-check-input"
                            id="rememberLogin">
                    <label class="form-check-label fw-semib" for="rememberLogin">로그인 정보 저장</label>
                </div>
                <!-- 로그인 버튼 -->
                <button type="submit"
                    class="btn btn-primary bg mb-3 fw-semibold" id="submit">로그인</button>
                <hr class="mb-4">
                <!-- 회원가입 버튼 -->
                <span>회원이 아닌가요? <a href="joinForm.do">지금 가입하세요.</a></span>
            </form>
        </div>

        <!-- 부트스트랩 JS -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
        <!-- 커스텀 JS -->
        <script src="login.js"></script>
    </body>
</html>