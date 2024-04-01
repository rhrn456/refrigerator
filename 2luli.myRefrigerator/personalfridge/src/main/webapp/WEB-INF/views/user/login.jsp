<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">   
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
      <link rel="icon" type="image/x-icon" href="img/house-AI-Logo.png" />
</head>
<style>
body {
    background: linear-gradient(to bottom, #f5ffea, #6fde6f);
}
.container{
margin-top:170px;

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
<body>

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block" id="roginImage" style="background-image: url('https://cdn.pixabay.com/photo/2019/04/02/04/32/masala-4096891_640.jpg'); background-size: cover; background-position: center;"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                    <a href="/">
                                         <img src="img/house-AI-BI.png" href="getMainRecipe" style="max-width: 70%; max-height: 70%; margin-top:-30px; margin-bottom:20px;">
                                         </a>
                                    </div>
									<form class="user" method="POST" action="/Login">
									    <div class="form-group">
									        <input type="text" maxlength= "10" class="form-control form-control-user"
									            id="user_id" name="user_id" aria-describedby="emailHelp"
									            placeholder="Enter Account" required>
									    </div>
									    <div class="form-group">
									        <input type="password" class="form-control form-control-user"
									            id="password" name="password" placeholder="Password" required>
									    </div>
									    <button type="submit" class="btn btn-primary btn-user btn-block">
									        로그인
									    </button>
									    <hr>
									   <a href="socalLogin" class="btn btn-google btn-user btn-block">
									        <i class="fab fa-google fa-fw"></i> Login with Google
									    </a>
									    <a href="#" class="btn btn-facebook btn-user btn-block">
		                                    <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
		                                </a>
									    <a href="#" class="btn btn-facebook btn-user btn-block" style="background-color:#4aa8d8;">
		                                    <i class="fab fa-twitter fa-fw"></i> Login with Twitter
		                                </a>
									   <a href="#" class="btn btn-user btn-block" style="background-color:#fee500;">
										    <i class="fa fa-comment fa-fw"></i> Login with Kakao
										</a>
									</form>
                                    <hr>
                                    <div class="text-center">
                                    	<a class="small" href="/findIdPage" style="margin-right:5px;">아이디를 잊어버리셨나요?</a>/
                                        <a class="small" href="/findPasswordPage">비밀번호를 잊어버리셨나요?</a>
                                    </div>
                                    <div class="text-center">
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
	document.getElementById("roginImage").addEventListener("click", function() {
	    window.location.href = "/"; // 클릭 시 "/" 경로로 이동
	});
	//에러메세지가 있다면 알럿트로 넘어온 에러메세지 뛰어주기
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