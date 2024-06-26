<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지</title>
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

.modal-button {
	margin-top: 20px;
}
.edit-form-container form {
    display: flex;
    flex-direction: column;
    align-items: center; /* 폼 내의 요소들을 중앙 정렬합니다. */
}

.form-group {
    width: 100%; /* 폼 그룹의 너비를 부모 요소에 맞춥니다. */
    max-width: 200px; /* 최대 너비 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
    margin-bottom: 20px; /* 하단 여백 추가 */
}

.edit-form-container select,
.edit-form-container button {
    width: 100%; /* select 및 button 요소 폭을 부모 요소에 맞춥니다. */
    max-width: 200px; /* 최대 너비 설정 */
}
.recipe-name {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 100%; /* 또는 다른 고정값 */
	display: block; /* 필요에 따라 */
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





	<!-- Modal Search Start -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Search by
						keyword</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex align-items-center">
					<div class="input-group w-75 mx-auto d-flex">
						<input type="search" class="form-control p-3"
							placeholder="keywords" aria-describedby="search-icon-1">
						<span id="search-icon-1" class="input-group-text p-3"><i
							class="fa fa-search"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Search End -->


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">DIET</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>마이 페이지</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between allproduct">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>회원정보
														수정</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>찜한 레시피</a>

												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>다이어트</a>

												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>배송조회</a>

												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>구매내역</a>

												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>주문취소</a>

												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>환불/교환
														문의</a>

												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between product-category"
													id="deleteButton">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>회원탈퇴</a>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-9">
								<h2 style="text-align: center">나의 다이어트 목표</h2>
							
								<div id="dietForm" class="mt-5">
								    <div class="edit-form-container">
								        <form action="/mypage/diet">				
								            <div class="form-group">
								                <label for="dietOption" class="mb-2"><strong>DIET</strong></label>
								                <!-- 드롭다운 메뉴 추가 -->
												<select id="dietOption" name="dietOption" class="form-control mb-3">
												    <option value="select">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다이어트 정도</option>
												    <option value="verySlim" ${dietObject == 'verySlim' ? 'selected' : ''}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매우 날씬하게</option>
												    <option value="slim" ${dietObject == 'slim' ? 'selected' : ''}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날씬하게</option>
												    <option value="maintain" ${dietObject == 'maintain' ? 'selected' : ''}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재상태 유지</option>
												    <option value="gain" ${dietObject == 'gain' ? 'selected' : ''}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;증량</option>
												    <option value="veryGain" ${dietObject == 'veryGain' ? 'selected' : ''}>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매우 증량</option>
												</select>
								            </div>
								
								            <div class="form-group">
								                <button type="submit" id="submitForm" class="btn btn-md bg-light border">목표 설정</button>
								            </div>
								        </form>
								    </div>
								</div>							
							<c:if test="true">
								<div class="container-fluid fruite py-5">
									<div class="container py-5">
										<div class="tab-class text-center">
											<div class="tab-content">
												<div id="tab-1" class="tab-pane fade show p-0 active">
													<div class="row g-4 justify-content-center">
														<!-- 수정된 부분 -->
														<div class="col-lg-12">
															<div class="row g-4">
																<c:if test="${empty dietObject}">
																	<br>
																	<br>
																	<h2 style="text-align: center; color: #dc2e5e;">현재 다이어트 목표가 설정되어있지 않습니다.<br><br>다이어트 목표를 설정해 보세요!</h2>
																</c:if>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 삭제창 작동 -->
	<div id="modalContainer" class="modal-container">
		<div class="modal-content">
			<p>
				회원 탈퇴를 진행하시겠습니까?<br>비밀번호를 적어주세요
			</p>
			<input type="password" class="form-comtrol form-control-user"
				id="passwordInput" name="password" placeholder="비밀번호">
			<button id="confirmDeleteButton" class="modal-button">회원 탈퇴</button>
			<button id="cancelDeleteButton" class="modal-button">취소</button>
		</div>


	</div>
	<!-- Fruits Shop End-->

	<script type="text/javascript">
		//삭제창이 작동하는 함수
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
				type : 'post',
				url : "/mypage/selectPassword", // 요청을 처리할 서버의 URL
				data : {
					user_id : userId, // 세션에서 사용자 ID 가져오기
					password : password
				},
				success : function(response) {
					//alert(response); 값호출
					// 서버 응답 처리

					if (response == 1) {
						alert("비밀번호 확인 성공. 회원 탈퇴를 진행합니다.");

						window.location.href = "/logout";
						// 회원 탈퇴 로직을 여기에 추가
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						window.location.href = "/mypage?user_id=" + userId;
					}
					//-> controller selectPassword reutrn  
					// $('#message').html(data);  현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다.             
				},
				error : function(xhr, status, error) {
					// AJAX 요청 실패 시 처리
					console.error("AJAX 요청 실패:", status, error); // AJAX 요청 실패 시 에러 로그
					alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
				}
			});

			//window.location.href = '/mypage?user_id=' + "${sessionScope.userId}";
		}
	</script>

	<!--비밀번호 변경전 확인 수정창-->
	<div id="modalcheckpwContainer" class="modal-container">
		<div class="modal-content">
			<p>
				정보수정을 진행하시겠습니까?<br>비밀번호를 적어주세요
			</p>
			<input type="password" class="form-comtrol form-control-user"
				id="checkpwpasswordInput" name="password" placeholder="비밀번호">
			<button id="confirmcheckpwButton" class="modal-button">확인</button>
			<button id="cancelcheckpwButton" class="modal-button">취소</button>
		</div>


	</div>

	<script type="text/javascript">
		//정보수정 함수
		var newPasswordButton = document.getElementById("newPasswordButton");
		var modalcheckpwContainer = document
				.getElementById("modalcheckpwContainer");
		var confirmcheckpwButton = document
				.getElementById("confirmcheckpwButton");
		var cancelcheckpwButton = document
				.getElementById("cancelcheckpwButton");

		newPasswordButton.onclick = function() {
			modalcheckpwContainer.style.display = "block";
		}

		cancelcheckpwButton.onclick = function() {
			modalcheckpwContainer.style.display = "none";
		}

		confirmcheckpwButton.onclick = function() {
			//1. inputbox password value 
			//2. jsp session 값  sessionScope
			// ${sessionScope.userid} = 
			//1,2 
			var password = $("#checkpwpasswordInput").val(); // 입력 필드에서 비밀번호 값 추출
			var userId = "${sessionScope.userId}"
			console.log(password);
			console.log(userId);

			// 서버에 비밀번호 확인 요청
			$.ajax({
				type : 'post',
				url : "/selectPassword", // 요청을 처리할 서버의 URL
				data : {
					user_id : userId, // 세션에서 사용자 ID 가져오기
					password : password
				},
				success : function(response) {
					//alert(response); 값호출
					// 서버 응답 처리

					if (response == 1) {
						alert("비밀번호 확인 성공.");

						modalupdatepwContainer.style.display = "block";
					} else {
						alert("비밀번호가 일치하지 않습니다.");
						window.location.href = "/mypage?user_id=" + userId;
					}
					//-> controller selectPassword reutrn  
					// $('#message').html(data);  현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다.             
				},
				error : function(xhr, status, error) {
					// AJAX 요청 실패 시 처리
					console.error("AJAX 요청 실패:", status, error); // AJAX 요청 실패 시 에러 로그
					alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
				}
			});

			//window.location.href = '/mypage?user_id=' + "${sessionScope.userId}";
		}
	</script>

	<!--비밀번호 수정창-->
	<div id="modalupdatepwContainer" class="modal-container">
		<div class="modal-content">
			<p>
				정보수정을 진행하시겠습니까?<br>비밀번호를 적어주세요
			</p>
			<input type="password" class="form-comtrol form-control-user"
				id="newpassword" name="newpassword" placeholder="새로운 비밀번호">
			<input type="password" class="form-comtrol form-control-user"
				id="confirmNewPassword" name="confirmNewPassword"
				placeholder="비밀번호 확인">
			<button id="confirmupdatepwButton" class="modal-button">확인</button>
			<button id="cancelupdatepwButton" class="modal-button">취소</button>
		</div>
	</div>

	<script type="text/javascript">
		//비밀번호 변경 작동하는 함수
		var modalupdatepwContainer = document
				.getElementById("modalupdatepwContainer");
		var confirmupdatepwButton = document
				.getElementById("confirmupdatepwButton");
		var cancelupdatepwButton = document
				.getElementById("cancelupdatepwButton");

		cancelupdatepwButton.onclick = function() {
			modalupdatepwContainer.style.display = "none";
		}

		confirmupdatepwButton.onclick = function() {

			var userId = "${sessionScope.userId}"
			var newPassword = $("#newpassword").val();
			var confirmNewPassword = $("#confirmNewPassword").val();
			console.log(newpassword);
			console.log(userId);

			if (newPassword !== confirmNewPassword) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			}
			// 비밀번호 변경함수
			$.ajax({
				type : 'post',
				url : "/updatePassword", // 요청을 처리할 서버의 URL
				data : {
					user_id : userId, // 세션에서 사용자 ID 가져오기
					newPassword : newPassword
				},
				success : function() {

					alert("비밀번호 변경 완료");
					window.location.href = "/mypage/info?user_id=" + userId;

				},
				error : function(request, status, error) {
					// AJAX 요청 실패 시 처리
					console.error("AJAX 요청 실패:", status, error); // AJAX 요청 실패 시 에러 로그
					alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
				}
			});

			//window.location.href = '/mypage?user_id=' + "${sessionScope.userId}";
		}
	</script>



	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


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

</body>
<!-- footer start -->
<%@ include file="../footer.jsp"%>
<!-- footer End -->
</html>