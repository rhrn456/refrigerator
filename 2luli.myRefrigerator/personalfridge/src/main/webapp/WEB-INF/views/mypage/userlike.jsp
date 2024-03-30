<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>찜한 레시피</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<!-- Navbar start -->
<%@ include file="../header.jsp"%>
<!-- Navbar End -->

<style>
thead th {
	color: #DD3161;
}

tbody a {
	color: #45595B;
	font-size: 30px;
}

.mypagemenu {
	border: 3px solid #ccc;
	border-radius: 10px;
	font-size: 20px;
	text-align: center;
	height: 320px;
	width: 200px;
}

.product-category {
	margin-top: 11px;
	display: block;
	padding: 10px;
}

.product-category:hover {
	background-color: #f0f0f0;
}

.product-category:active {
	background-color: #ccc;
}

.product-category a {
	color: #666666;
}

.modal-container {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(255, 255, 255, 1);
	padding: 20px;
	border: 2px solid black;
	border-radius: 5px;
	z-index: 9999;
	color: black;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

.modal-content {
	text-align: center;
}

/* 모든 버튼과 인풋 필드의 너비를 modal-content에 맞춤 */
.modal-content>* {
	width: 100%; /* 모달 컨텐츠의 너비를 기준으로 함 */
	box-sizing: border-box; /* 패딩과 테두리가 너비에 포함되도록 함 */
}

.form-comtrol {
	padding: 10px;
	margin-top: 20px; /* 상단 여백 추가 */
	margin-bottom: 20px; /* 하단 여백 추가 */
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

.modal-button {
	margin-top: 0; /* 상단 마진을 제거하여 인풋 필드와 동일선상에 위치하도록 함 */
	padding: 5px 20px;
	border: none;
	border-radius: 4px;
	background-color: #6c757d;
	color: white;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 10px; /* 하단 마진 추가 */
	transition: background-color 0.2s;
}

/* 호버 효과 */
.modal-button:hover {
	background-color: #5a6268;
}
</style>
</head>
<body>

	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">내가 찜한 레시피</h1>
	</div>
	<!-- Single Page Header End -->

	<!-- user like start -->
	<div class="container d-flex py-4 px-5">
		<!-- mypage menu start -->
		<div class="mypagemenu mx-3">
			<h3 style="margin-top: 20px;">마이 페이지</h3>
			<hr>
			<div class="product-category" id=editButton>
				<a href="#">회원정보 수정</a>
			</div>
			<div class="product-category" id=userlikebutton>
				<a href="#">찜한 레시피</a>
			</div>
			<div class="product-category">
				<a href="/mypage/buyproductcheck">구매내역</a>
			</div>
			<div class="product-category" id="deleteButton">
				<a href="#">회원탈퇴</a>
			</div>
		</div>
		<!-- mypage menu End -->

		<!-- user like menu start -->
		<div class="table-responsive flex-fill px-3 mx-auto" id=userlikerecipe>
			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">레시피 이름</th>
					</tr>
				</thead>
				<!-- 반복 시작 -->
				<tbody>
					<c:if test="${0 != likeList.size()}">
						<c:forEach var="RecipeDTO" items="${likeList}">
							<tr>
								<td style="width: 100px"><img src="${RecipeDTO.recipe_img}"
									style="width: auto; height: auto; max-width: 90px; max-height: 90px;">
								</td>
								<td class="align-middle"><a href="#" id=userlikerecipe
									data-value="${RecipeDTO.recipe_id}">${RecipeDTO.recipe_name}</a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<!-- 반복 끝 -->
			</table>
		</div>
		<!-- user like menu End -->
	</div>
	<!-- user like End -->

	<!-- 회원탈퇴 모달창 -->
	<div id="modalContainer" class="modal-container">
		<div class="modal-content">
			<br>
			<p>회원 탈퇴를 진행하시겠습니까?</p>
			<input type="password" class="form-comtrol form-control-user"
				id="passwordInput" name="password" placeholder="비밀번호 확인">
			<button id="confirmDeleteButton" class="modal-button">회원 탈퇴</button>
			<button id="cancelDeleteButton" class="modal-button">취소</button>
		</div>
	</div>

	<!-- 회원수정 모달창 -->
	<div id="modalupdateContainer" class="modal-container">
		<div class="modal-content">
			<br>
			<p>정보수정을 진행하시겠습니까?</p>
			<input type="password" class="form-comtrol form-control-user"
				id="editpasswordInput" name="password" placeholder="비밀번호 확인">
			<button id="confirmupdateButton" class="modal-button">확인</button>
			<button id="cancelupdateButton" class="modal-button">취소</button>
		</div>
	</div>

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

	<script>
	
	//recipeContent
    $('#recipeContent').on('click', 'a', function(e) {
   	 let recipeId = $(this).data('value');
   	 location.href = "/recipedetail?recipe_id=" + recipeId;
   	
    });
	
	</script>

	<script>
	
	//정보수정창 작동하는 함수
		var editButton = document.getElementById("editButton");
    var modalupdateContainer = document.getElementById("modalupdateContainer");
    var confirmupdateButton = document.getElementById("confirmupdateButton");
    var cancelupdateButton = document.getElementById("cancelupdateButton");
    
    
    
    editButton.onclick = function() {
    	modalupdateContainer.style.display = "block";
    }

    cancelupdateButton.onclick = function() {
    	modalupdateContainer.style.display = "none";
	}
    
    confirmupdateButton.onclick = function() {
    	var password = $("#editpasswordInput").val(); // 입력 필드에서 비밀번호 값 추출
    	var userId = "${sessionScope.userId}"
    	console.log(password);
    	console.log(userId);

        // 서버에 비밀번호 확인 요청
        $.ajax({
            type: 'post',
            url: "/selectPassword", // 요청을 처리할 서버의 URL
            data: {
                user_id: userId, // 세션에서 사용자 ID 가져오기
                password: password
            },
            success: function(response) {
            	//alert(response); 값호출
                // 서버 응답 처리
                
                if (response == 1) {
                	alert("비밀번호 확인 성공.");
                	
                	window.location.href = "/userEdit";
                	// 회원 탈퇴 로직을 여기에 추가
           		} else {
                	alert("비밀번호가 일치하지 않습니다.");
                	window.location.href = "/mypage/info?user_id=" + userId;
            	}
                //-> controller selectPassword reutrn  
					// $('#message').html(data);  현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다.             
            },
            error: function(xhr, status, error) {
                // AJAX 요청 실패 시 처리
                console.error("AJAX 요청 실패:", status, error); // AJAX 요청 실패 시 에러 로그
                alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
            }
        }); 
    	
    	//window.location.href = '/mypage?user_id=' + "${sessionScope.userId}";
    }
    
		var deleteButton = document.getElementById("deleteButton");
    var modalContainer = document.getElementById("modalContainer");
    var confirmButton = document.getElementById("confirmDeleteButton");
    var cancelButton = document.getElementById("cancelDeleteButton");
    
    deleteButton.onclick = function() {
        modalContainer.style.display = "block";
    }

    cancelButton.onclick = function() {
        modalContainer.style.display = "none";
	}
    
    confirmButton.onclick = function() {
    	//1. inputbox password value 
		//2. jsp session 값  sessionScope
		// ${sessionScope.userid} = 
	//1,2 
    	var password = $("#passwordInput").val(); // 입력 필드에서 비밀번호 값 추출
    	var userId = "${sessionScope.userId}"
    	console.log(password);
    	console.log(userId);

        // 서버에 비밀번호 확인 요청
        $.ajax({
            type: 'post',
            url: "/deleteUser", // 요청을 처리할 서버의 URL
            data: {
                user_id: userId, // 세션에서 사용자 ID 가져오기
                password: password
            },
            success: function(response) {
            	//alert(response); 값호출
                // 서버 응답 처리
                
                if (response == 1) {
                	alert("비밀번호 확인 성공. 회원 탈퇴를 진행합니다.");
                	
                	window.location.href = "/logout";
                	// 회원 탈퇴 로직을 여기에 추가
           		} else {
                	alert("비밀번호가 일치하지 않습니다.");
                	window.location.href = "/mypage/info?user_id=" + userId;
            	}
                //-> controller selectPassword reutrn  
					// $('#message').html(data);  현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다.             
            },
            error: function(xhr, status, error) {
                // AJAX 요청 실패 시 처리
                console.error("AJAX 요청 실패:", status, error); // AJAX 요청 실패 시 에러 로그
                alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
            }
        }); 
    	
    	//window.location.href = '/mypage?user_id=' + "${sessionScope.userId}";
    }
	
    
  	// userlikerecipe 클릭시
    $('#userlikerecipe').on('click', 'a', function(e) {
   	 let recipeId = $(this).data('value');
   	 location.href = "/recipedetail?recipe_id=" + recipeId;
   	
    });
	</script>

</body>
<!-- footer start -->
<%@ include file="../footer.jsp"%>
<!-- footer End -->

</html>