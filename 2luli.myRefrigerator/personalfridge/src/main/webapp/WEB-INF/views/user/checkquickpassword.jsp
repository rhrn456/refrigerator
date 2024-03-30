<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>비밀번호 변경</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
      <link rel="icon" type="image/x-icon" href="img/house-AI-Logo.png" />
<style>
body {
    background: linear-gradient(to bottom, #f5ffea, #6fde6f);
}
.container{
	margin-top:180px;	

}
.bg-register-image {
    cursor: pointer; 
    transition: background-color 0.3s; 
}

.bg-register-image:hover {
    background-color: rgba(0, 0, 0, 0.1); 
}

.bg-register-image:active {
    background-color: rgba(0, 0, 0, 0.2); 
}
</style>
</head>

<body>

   <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                             <div class="col-lg-5 d-none d-lg-block" id="registerImage" style="background-image: url('https://cdn.pixabay.com/photo/2022/05/22/13/36/raspberries-7213407_640.jpg'); background-size: cover; background-position: center;"></div>
			                    <div class="col-lg-7">
			                        <div class="p-5">
			                            <div class="text-center">
			                             <img src="img/house-AI-BI.png" style="max-width: 50%; max-height: 50%; margin-top:-30px; margin-bottom:20px;">
                                        <h1 class="h4 text-gray-900 mb-4">임시 비밀번호를 입력해주세요</h1>
                                    </div>
									   <form class="user" action="/loseUserChangePassword" method="POST">
									    <div class="form-group">
									       <input type="text" class="form-control form-control-user" id="accesnum" name="accesnum" placeholder="임시 비밀번호 입력창" required>
									    </div>
									    <input type="hidden" id="str" name="str" value="${str}">
							    		 <input type="hidden" id="user_name" name="user_name" value="${user_name}">
   										 <input type="hidden" id="mail" name="mail" value="${mail}">
									    <button type="submit" class="btn btn-primary btn-user btn-block">
									          임시 비밀번호 확인 하기
									    </button>
									    <hr>
									</form>
                                    <hr>
                                    <div class="text-center" style="margin-bottom:-30px;">
                                    	<a class="small" href="/findIdPage" style="margin-right:5px;">아이디를 잊어버리셨나요?</a>/
                                    	 <a class="small" href="/signupPage">계정을 만드세요!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>


	<script>
	document.getElementById("registerImage").addEventListener("click", function() {
	    window.location.href = "/"; // 클릭 시 "/" 경로로 이동
	});
	document.addEventListener("DOMContentLoaded", function() {
	    document.querySelector(".user").addEventListener("submit", function(event) {
	        event.preventDefault(); // 기본 submit 동작 방지

	        var userInput = document.getElementById("accesnum").value; // 사용자가 입력한 임시 비밀번호
	        var str = document.getElementById("str").value; // 서버에서 전달된 임시 비밀번호

	        if (userInput === str) {
	            // 임시 비밀번호가 일치하면 form을 submit
	            this.submit();
	        } else {
	            // 임시 비밀번호가 일치하지 않으면 알림 메시지 출력
	            alert("입력한 암호가 올바르지 않습니다.");
	        }
	    });
	});
	</script>
</body>

</html>