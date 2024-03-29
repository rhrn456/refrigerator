<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>우리집 AI 냉장고</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">
	
	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">
	
	<!-- Icon Font Stylesheet -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	<!-- Libraries Stylesheet -->
	<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
	<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	
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
		
		#board-modify-btn {
			background-color: #CFCFCF;
			border-color: #CFCFCF;
		}
		
	</style>
</head>


<body>
	<!-- Spinner Start -->
	<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->
	
	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5" style="margin-top: 180px;">
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>카테고리</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=1"><i class="fas fa-apple-alt me-2"></i>공지사항</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=2"><i class="fas fa-apple-alt me-2"></i>공유 게시판</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=3"><i class="fas fa-apple-alt me-2"></i>나만의 레시피</a>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
						    	<table>
									<tbody>
										<tr>
											<th>작성자</th>
											<td>${board.user_id}</td>
											<th>작성날짜</th>
											<td><fmt:formatDate value="${board.board_create_date}" pattern="yyyy-MM-dd" /></td>
											<th>조회수</th>
											<td>${board.hit}</td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="6">${board.title}</td>
										</tr>
										<tr>
											<td colspan="6" class="view_text">${board.content}</td>
										</tr>
									</tbody>									
								</table>
								<c:if test="${not empty board.latitude}">
								<div id="map" style="width: 100%; height: 400px;"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70cfc06e9436eefff5f27287fb6bfd38"></script>
								<script>
								  // 페이지에서 제공하는 좌표값으로 변수를 설정
								  var latitude = ${board.latitude};
								  var longitude = ${board.longitude};
								
								  // 지도를 생성할 때 필요한 기본 옵션
								  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
								      mapOption = {
								          center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표를 서버로부터 받아온 값으로 설정
								          level: 3 // 지도의 확대 레벨
								      };  
								
								  // 지도를 생성합니다    
								  var map = new kakao.maps.Map(mapContainer, mapOption); 
								
								  // 마커가 표시될 위치입니다 
								  var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
								
								  // 마커를 생성합니다
								  var marker = new kakao.maps.Marker({
								      position: markerPosition
								  });
								
								  // 마커가 지도 위에 표시되도록 설정합니다
								  marker.setMap(map);
								</script>
								</c:if>
								<c:if test="${sessionScope.userId eq board.user_id}">
									<button id="board-modify-btn" class="btn btn-primary" onclick="location.href='/mypage/updateBoard?boardNo=${board.board_no}'">수정</button>
									<button id="board-delete-btn" class="btn btn-primary" data-value="${board}">삭제</button>
								</c:if>
								<c:if test="${not empty board.latitude}">
									<button id="board-modify-btn" class="btn btn-primary" onclick="requestShare()">공유 요청</button>
								</c:if>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->
	
	<div id="modalContainer" class="modal-container">
		<div class="modal-content">
			<p>게시글을 삭제하시겠습니까?</p>
			<button id="confirmDeleteButton" class="modal-button">확인</button>
			<button id="cancelDeleteButton" class="modal-button">취소</button>
		</div>
	</div>
	
	<!-- footer start -->
	<%@ include file="../footer.jsp"%>
	<!-- footer End -->
	
	<!-- Back to Top -->
	<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>
	
	<!-- JavaScript Libraries -->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	
	<script>
	var boardNo;
	var deleteButton = document.getElementById("board-delete-btn");
    var modalContainer = document.getElementById("modalContainer");
    var confirmButton = document.getElementById("confirmDeleteButton");
    var cancelButton = document.getElementById("cancelDeleteButton");

    deleteButton.onclick = function() {
    	boardNo = $(this).data('value');
        modalContainer.style.display = "block";
    }
	
    cancelButton.onclick = function() {
        modalContainer.style.display = "none";
    }
	
	confirmButton.onclick = function() {
		location.href = '/deleteBoard?boardNo=' + boardNo;
    } 	
	
	function requestShare() {
		if(confirm("작성자에게 공유 요청 메일을 보내시겠습니까?")){
			$.ajax({
				type: "POST",
				url: "/mypage/requestShare",
	            data: { board_no: ${board.board_no} },
				success: function(response){
					alert("성공적으로 메일이 전송되었습니다")
				},
		        error: function(xhr, status, error){
		            console.error(xhr.responseText);
		        } 
			})
		}
	}
	</script>
	
</body>
</html>
