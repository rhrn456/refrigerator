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

    <title>아이디를 찾았습니다!</title>

    <!-- Custom fonts for this template-->
     <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(to bottom, #f5ffea, #6fde6f);
}
.container{
margin-top:230px;

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
	                        <div class="col-lg-6 d-none d-lg-block bg-password-image" id="roginImage"></div>
	                        <div class="col-lg-6">
	                            <div class="p-5">
	                                <div class="text-center">
	                                        <h1 class="h4 text-gray-900 mb-2">아이디를 찾았습니다.</h1>
	                                         <p class="mb-4" style="font-size:30px; font-weight: bold;">아이디: ${userId}</p>
	                                        <div class="text-center">
	                                        <a class="small" href="/findPasswordPage">비밀번호를 잊어버리셨나요?</a>
	                                    </div>
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
	</script>
    
</body>

</html>