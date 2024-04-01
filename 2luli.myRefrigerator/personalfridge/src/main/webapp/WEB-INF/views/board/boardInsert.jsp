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
					<div class="row g-4 justify-content-center">
						<div class="col-lg-9">
							<div class="row justify-content-center">
							    <div class="col-xl-8 col-lg-7" style="width: 80%">
							        <div class="card shadow mb-4">
							            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							                <h6 class="m-0 font-weight-bold text-primary">게시글 등록</h6>
							            </div>
							            <!-- Card Body -->
							            <form action="/insertBoard" method="POST" id="locationForm">
								            <div class="card-body">								                
								                <c:if test="${empty refrigeratorProdcut}">
								                	<style>
														#map {
															display: none;
														}
													</style>
								                	<input type="text" id="title" name="title" placeholder="제목" class="form-control mb-3" required>
								             		<textarea id="content" name="content" placeholder="내용" class="form-control mb-3" rows="8" required></textarea>
							                		<div class="dropdown">
									                    <select id="board_category" name="CategoryNo" class="form-control mb-3"">
									                        <option value="" selected disabled hidden>게시판 분류</option>
									                        <c:if test="${sessionScope.userAdmin == 2}">
									                        	<option value="1">공지사항</option>
									                        </c:if>
									                        <option value="3">나만의 레시피</option>
									                    </select>
									                </div>
								                </c:if>								                	
								                <c:if test="${not empty refrigeratorProdcut}">
								                	<input type="text" id="title" name="title" placeholder="제목" class="form-control mb-3" value="${refrigeratorProdcut.product_name} 공유하고 싶어요!" required readonly="readonly">
								                	<textarea id="content" name="content" placeholder="내용" class="form-control mb-3" rows="8" required>개수 : ${refrigeratorProdcut.product_quantity}, 소비기한 : ${refrigeratorProdcut.limit_date}</textarea>
									                <div class="dropdown">
									                    <select id="board_category" name="CategoryNo" class="form-control mb-3" >
									                        <option value="2">공유 게시판</option>
									                    </select>
									                </div>
									                    <script>
													        window.onload = function() {
													            requestLocationAndInitMap();
													        };
													    </script>
								                </c:if>
								                
								                <div id="map" style="width:100%;height:400px;"></div>
								                <p id="result"></p>
								                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70cfc06e9436eefff5f27287fb6bfd38"></script>
							                	<script>							                		
							                    var map; // 전역 변수로 선언하여 지도 객체를 저장

							                    // 사용자의 위치 또는 기본 위치로 지도를 초기화하는 함수
							                    function requestLocationAndInitMap() {
							                        navigator.geolocation.getCurrentPosition((position) => {
							                            // 사용자가 위치 공유를 허용했을 때의 처리
							                            initMap(position.coords.latitude, position.coords.longitude);
							                            document.getElementById('latitude').value = position.coords.latitude;
							                            document.getElementById('longitude').value = position.coords.longitude;

							                        }, (error) => {
							                            // 에러 발생 시 (위치 공유를 거부한 경우 포함) 기본 위치 사용
							                            console.error(error);
							                            // 서울 시청의 위도와 경도로 기본값 설정
							                            var defaultLat = 37.566535;
							                            var defaultLng = 126.9779692;
							                            initMap(defaultLat, defaultLng);
							                            document.getElementById('latitude').value = defaultLat;
							                            document.getElementById('longitude').value = defaultLng;

							                        });
							                    }

							                    // 지도와 마커를 초기화하는 함수
							                    function initMap(lat, lng) {
							                        var container = document.getElementById('map');
							                        var options = {
							                            center: new kakao.maps.LatLng(lat, lng),
							                            level: 3
							                        };

							                        map = new kakao.maps.Map(container, options); // 지도 생성
	
							                        kakao.maps.event.addListener(map, 'center_changed', function() {

							                            // 지도의  레벨을 얻어옵니다
							                            var level = map.getLevel();

							                            // 지도의 중심좌표를 얻어옵니다 
							                            var latlng = map.getCenter(); 

							                            var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
							                            message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
							                            
								                        document.getElementById('latitude').value = latlng.getLat();  // 위도를 폼 필드에 설정
								                        document.getElementById('longitude').value = latlng.getLng();  // 경도를 폼 필드에 설정

							                            var resultDiv = document.getElementById('result');
							                            resultDiv.innerHTML = message;

							                        });	
							                        
							                        var marker = new kakao.maps.Marker();

								                     // 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
								                     kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);
	
								                     function displayMarker() {
								                         
								                         // 마커의 위치를 지도중심으로 설정합니다 
								                         marker.setPosition(map.getCenter()); 
								                         marker.setMap(map); 	
								                         // 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
								                         // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
								                         // kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
								                     }
							                    }

							                    document.getElementById('board_category').addEventListener('change', function() {
							                        var selectedCategory = this.value;
							                        // 공유 게시판을 선택했을 경우에만 지도를 표시
							                        if(selectedCategory == '2') {
							                            document.getElementById('map').style.display = 'block';
							                            // map 변수가 정의되지 않았거나 null이라면 사용자 위치 또는 기본 위치로 지도 초기화
							                            if (!map) {
							                                requestLocationAndInitMap();
							                            }
							                        } else {
							                            document.getElementById('map').style.display = 'none';
							                        }
							                    });
							                    
												</script>
											    <input type="hidden" id="latitude" name="latitude">
												<input type="hidden" id="longitude" name="longitude">
								                
												<br>
								                <!-- 확인 버튼 -->
								                <button type="submit" id="confirmButton" class="btn btn-primary" style="float:right; margin-bottom: 1rem">등록</button>
								            </div>
							            </form>
							        </div>
							    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->
	
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
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	
	<script>
	
	function selectCategory(CategoryNo) {
		document.getElementById("board_category").value = CategoryNo;
		toggleDropdown();
	}
	
	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		for (var i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
	
	document.getElementById('confirmButton').addEventListener('click', function() {
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		var board_category = document.getElementById('board_category').value;
		
		if (title.trim() === '' || content.trim() === '') {
			alert('빈칸을 입력해주세요');
			return;
		} else if(board_category.trim() === '') {
			alert('게시판을 선택해주세요')
			return;
		}
	});
	
	</script>
	
</body>
</html>
