// HTML 문서가 완전히 로드 되었을 때 실행
document.addEventListener('DOMContentLoaded', function () {

    const nickNameInput = document.getElementById('nickName');
    const passwordInput = document.getElementById('password');

    // 멤버쉽 변경 처리
    const basicButton = document.getElementById('basic');
    const standardButton = document.getElementById('standard');
    const premiumButton = document.getElementById('premium');
    const cancelButton = document.getElementById('cancel');

    // 회원탈퇴 폼
    const deleteForm = document.getElementById('deleteForm');
    
    // 미구현 처리
    const notImpl = document.querySelectorAll(".notImpl");

    // 멤버 쉽 변경 메소드
    function changeMemberShip(type) {
        document.getElementById('membership').value = type;
        document.getElementById('membershipForm').submit();
    }

    basicButton.addEventListener('click', function () {
        if (confirm('"베이직"  멤버십으로 변경하시겠습니까?')) {
            changeMemberShip('basic');
        } else { return; }
    });

    standardButton.addEventListener('click', function () {
        if (confirm('"스탠다드" 멤버십으로 변경하시겠습니까?')) {
            changeMemberShip('standard');
        } else { return; }
    });

    premiumButton.addEventListener('click', function () {
        if (confirm('"프리미엄" 멤버십으로 변경하시겠습니까?')) {
            changeMemberShip('premium');
        } else { return; }
    });

    cancelButton.addEventListener('click', function () {
        if (confirm('정말로 해지하시겠습니까?')) {
            changeMemberShip('cancel');
        } else { return; }
    });

    // 미구현 처리 메소드
    notImpl.forEach(function (element) {
        element.addEventListener('click', function (event) {
            event.preventDefault();

            alert("미구현 상태입니다.");
        });
    })


    // 닉네임 유효성 검사 메소드
    function vailDateNickName(nickName) {
        if (nickName.trim() === "") {
            return "닉네임을 입력하세요.";
        } else if (nickName.length < 2 || nickName.length > 10) {
            return "2~10자 이내로 입력하세요.";
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
    
    // 회원탈퇴 폼 메소드
    deleteForm.addEventListener('submit', function(event){
        if(!confirm("정말로 회원탈퇴를 하시겠습니까?")){
            event.preventDefault();
        }else{
            return;
        }
    });
})




// 로그아웃 처리 메소드
function logout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        location.href = "logout.UserDo";
    }
}