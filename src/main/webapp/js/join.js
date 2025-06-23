document.addEventListener('DOMContentLoaded', function () {
    console.log("페이지 로드 완료");

    // HTML 요소 가져오기
    const joinForm = document.getElementById('joinForm');
    const loginIdInput = document.getElementById('loginId');
    const passwordInput = document.getElementById('password');
    const nickNameInput = document.getElementById('nickName');
    // const emailInput = document.getElementById('email');
    // const genderSelect = document.getElementById('gender');
    // const phoneInput = document.getElementById('phone');
    // const agreeTermsCheckbox = document.getElementById('agreeTerms');
    // const submitBtn = document.getElementById('submitBtn');

    let isIdChecked = false; // 아이디 중복 검사 여부
    let isIdAvailable = false; // 아이디 사용 여부

    // 폼 제출 이벤트 처리
    joinForm.addEventListener('submit', function (event) {
				alert("회원가입이 완료 되었습니다.");
        if (!isIdChecked || !isIdAvailable) {
						event.preventDefault();
            alert("아이디 중복 검사를 완료해주세요.");
            return;
        }
    });

    // 아이디 중복 검사 메소드
    async function checkIdDuplicate(loginId) {
        try {
            const response = await axios.get(`/checkId.UserDo?loginId=${loginId}`);

            console.log("서버 응답 받음", response.data);

            const data = response.data;
            const feedbackDiv = document.getElementById('loginIdFeedback');

            if (data.isDuplicate) {
                // 아이디가 중복일 경우
                feedbackDiv.textContent = data.message || "이미 사용 중인 아이디입니다.";
                feedbackDiv.className = "feedback error";
                feedbackDiv.style.color = "red";
                feedbackDiv.style.fontSize = "10pt";

                isIdChecked = true;
                isIdAvailable = false;
            } else {
                // 사용 가능한 아이디일 경우
                feedbackDiv.textContent = data.message || "사용 가능한 아이디입니다.";
                feedbackDiv.className = "feedback success";
                feedbackDiv.style.color = "green";
                feedbackDiv.style.fontSize = "10pt";

                isIdChecked = true;
                isIdAvailable = true;
            }
        } catch (error) {
            console.error("Axios 중복 검사 오류", error);

            const feedbackDiv = document.getElementById('loginIdFeedback');

            feedbackDiv.textContent = "중복 검사 중 오류가 발생했습니다.";
            feedbackDiv.className = "feedback error";
            feedbackDiv.style.color = "orange";
            feedbackDiv.style.fontSize = "10pt";

            isIdChecked = false;
            isIdAvailable = false;
        }
    }

    // 아이디 유효성 검사 메소드
    function vailDateLoginId(loginId) {
        if (loginId.trim() === "") {
            return "아이디를 입력하세요.";
        }
        if (loginId.length < 4 || loginId.length > 12) {
            return "4~12자 이내로 입력하세요.";
        }

        const pattern = /^[a-zA-Z0-9]+$/;

        if (!pattern.test(loginId)) {
            return "영문자와 숫자만 사용할 수 있습니다.";
        }

        return "";
    }

    // 비밀번호 유효성 검사 메소드
    function valiDatePassword(password) {
        if (password.trim() === "") {
            return "비밀번호를 입력하세요.";
        } else if (password.length < 6 || password.length > 20) {
            return "6~20자 이내로 입력하세요";
        } else if (password.includes(' ')) {
            return "공백은 입력 할 수 없습니다.";
        }

        return "";
    }

    // 닉네임 유효성 검사 메소드
    function vailDateNickName(nickName) {
        if (nickName.trim() === "") {
            return "닉네임을 입력하세요.";
        } else if (nickName.length < 2 || nickName.length > 10) {
            return "2~10자 이내로 입력하세요.";
        }

        return "";
    }

    // 아이디 유효성 검사 이벤트 메소드
    loginIdInput.addEventListener('input', function () {
        const loginId = this.value;

        // 아이디 변경 시 중복 검사 상태 초기화
        isIdChecked = false;
        isIdAvailable = false;

        // 유효성 검사 실행
        const errorMessage = vailDateLoginId(loginId);

        // 피드백 표시
        const feedbackDiv = document.getElementById('loginIdFeedback');

        if (errorMessage) {
            // 에러가 있을 경우
            feedbackDiv.textContent = errorMessage;
            feedbackDiv.className = "feedback error";
            feedbackDiv.style.color = "red";
            feedbackDiv.style.fontSize = "10pt";
        } else if (loginId.length > 0) {
            // 기본 검사 통과한 경우
            feedbackDiv.textContent = "중복 검사 중...";
            feedbackDiv.className = "feedback info";
            feedbackDiv.style.color = "blue";
            feedbackDiv.style.fontSize = "10pt";

            // 중복 검사 실행
            checkIdDuplicate(loginId);
        } else {
            // 비어있을 경우
            feedbackDiv.textContent = "";
        }
    });

    // 비밀번호 유효성 검사 이벤트 메소드
    passwordInput.addEventListener('input', function () {
        const password = this.value;

        // 유효성 검사 실행
        const errorMessage = valiDatePassword(password);

        // 피드백 표시
        const feedbackDiv = document.getElementById('passwordFeedback');

        if (errorMessage) {
            // 에러가 있을 경우
            feedbackDiv.textContent = errorMessage;
            feedbackDiv.className = "feedback error";
            feedbackDiv.style.color = "red";
            feedbackDiv.style.fontSize = "10pt";
        } else if (password.length > 0) {
            // 통과한 경우
            feedbackDiv.textContent = "사용 가능한 비밀번호입니다.";
            feedbackDiv.className = "feedback success";
            feedbackDiv.style.color = "green";
            feedbackDiv.style.fontSize = "10pt";
        } else {
            // 비어있을 경우
            feedbackDiv.textContent = "";
        }
    });

    // 닉네임 유효성 검사 이벤트 메소드
    nickNameInput.addEventListener('input', function () {
        const nickName = this.value;

        // 유효성 검사 실행
        const errorMessage = vailDateNickName(nickName);

        // 피드백 표시
        const feedbackDiv = document.getElementById('nickNameFeedback');

        if (errorMessage) {
            feedbackDiv.textContent = errorMessage;
            feedbackDiv.className = "feedback error";
            feedbackDiv.style.color = "red";
            feedbackDiv.style.fontSize = "10pt";
        } else if (nickName.length > 0) {
            // 통과한 경우
            feedbackDiv.textContent = "사용 가능한 닉네임입니다.";
            feedbackDiv.className = "feedback success";
            feedbackDiv.style.color = "green";
            feedbackDiv.style.fontSize = "10pt";
        } else {
            // 비어있을 경우
            feedbackDiv.textContent = "";
        }
    });

});
