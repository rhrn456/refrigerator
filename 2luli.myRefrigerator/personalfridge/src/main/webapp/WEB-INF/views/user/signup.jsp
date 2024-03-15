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

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(to bottom, #f5ffea, #6fde6f);
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

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image" id="registerImage"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">계정을 만들어보세요!</h1>
                            </div>
                           <form class="user" action="/signup" method="post">
								 	<div class="form-group row">
								        <div class="col-sm-6 mb-3 mb-sm-0">
								            <input type="text" class="form-control form-control-user" id="user_id" name="user_id" placeholder="아이디" required>
								        </div>
								        <div class="col-sm-6">
								            <input type="text" class="form-control form-control-user" id="user_name" name="user_name" placeholder="이름" required>
								        </div>
								    </div>
								    <div class="form-group">
								        <input type="mail" class="form-control form-control-user" id="mail" name="mail" placeholder="이메일" required>
								    </div>
								    <div class="form-group row">
								        <div class="col-sm-6 mb-3 mb-sm-0">
								            <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호" required>
								        </div>
								        <div class="col-sm-6">
								            <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="비밀번호 확인" required>
								        </div>
								    </div>
								    <div class="form-group">
								        <input type="phone" class="form-control form-control-user" id="phone" name="phone" placeholder="번호를 적을땐 - 를빼고 적어주세요" required>
								    </div>
								    <button type="submit" class="btn btn-primary btn-user btn-block">
								        회원 가입 하기
								    </button>
								</form>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
							    <a class="small" href="/findIdPage">아이디를 잊어버리셨나요?</a> /
							    <a class="small" href="/findPassword">비밀번호를 잊어버리셨나요?</a>
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
	</script>
</body>

</html>