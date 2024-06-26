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

    <title>아이디 찾기</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

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
#roginImage {
    cursor: pointer; 
    transition: background-color 0.3s; 
}

#roginImage:hover {
    background-color: rgba(0, 0, 0, 0.1); 
}

#roginImage:active {
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
	                        <div class="col-lg-6 d-none d-lg-block" id="roginImage" style="background-image: url('https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_640.jpg'); background-size: cover; background-position: center;"></div>
	                        <div class="col-lg-6">
	                            <div class="p-5">
	                                <div class="text-center">
	                                <a href="/">
	                                <img src="img/house-AI-BI.png" style="max-width: 70%; max-height: 70%; margin-top:-30px; margin-bottom:20px;">
	                                </a>
	                                    <h1 class="h4 text-gray-900 mb-2">아이디를 잊어버리셨나요?</h1>
	                                    <p class="mb-4">걱정하지 않으셔도 됩니다.<br>아래에 이름과 이메일 주소를 입력해주세요.</p>
	                                </div>
	                                <form class="user" action="/findId" method="post">
	                                    <div class="form-group text-center mb-3">
	                                        <input type="text" class="form-control form-control-user" id="user_name" name="user_name" placeholder="이름" required>
	                                    </div>
	                                    <div class="form-group text-center mb-3">
	                                        <input type="email" class="form-control form-control-user" id="mail" name="mail" placeholder="이메일" required>
	                                    </div>
	                                    <button type="submit" class="btn btn-primary btn-user btn-block">
	                                        아이디 찾기
	                                    </button>
	                                </form>
	                                <hr>
	                                <div class="text-center">
	                                    <a class="small" href="/findPasswordPage">비밀번호를 잊어버리셨나요?</a>
	                                </div>
	                                <div class="text-center">
	                                    <a class="small" href="/loginPage">계정이 이미 있나요? 로그인!</a>
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
	document.getElementById("roginImage").addEventListener("click", function() {
	    window.location.href = "/"; // 클릭 시 "/" 경로로 이동
	});
	
	<% String errorMessage = request.getParameter("errorMessage"); %>
	<% if (errorMessage != null) { %>
	    alert("<%= errorMessage %>");
	<% } %>
	
	document.getElementById("roginImage").addEventListener("click", function() {
	    window.location.href = "/"; // 클릭 시 "/" 경로로 이동
	});
	</script>
</body>

</html>