document.addEventListener('DOMContentLoaded', function(){
    const loginForm = document.getElementById('loginForm');
    const loginId = document.getElementById('loginId');
    const password = document.getElementById('password');

    loginForm.addEventListener('submit', function(event){
        const loginIdValue = loginId.value.trim();
        const passwordValue = password.value.trim();

        if (!loginIdValue){
            event.preventDefault();
            alert('아이디를 입력하세요.');
            loginId.focus();
            return;
        }
        if(!passwordValue){
            event.preventDefault();
            alert('비밀번호를 입력하세요.');
            password.focus();
            return;
        }
        
        password.addEventListener('keypress', function(event){
            if(event.key === 'Enter'){
                loginForm.submit();
            }
        })
    });
})