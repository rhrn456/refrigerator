<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ include file="header.jsp"%>
<!-- Navbar End -->

<style>
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

	<!-- Hero Start -->
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="container py-5">
			<div class="row g-5 align-items-center">
				<div class="col-md-12 col-lg-7">
					<h4 class="mb-3 text-secondary" style="color: #27417b !important">배달음식
						그만!</h4>
					<h1 class="mb-5 display-3 text-primary">
						직접 요리하는<br>나만의 레시피
					</h1>
					<div class="position-relative mx-auto">
						<form id="searchForm" action="/mainSearch" method="GET">
							<input name="keyword" id="keywordInput"
								class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill"
								type="text" placeholder="원하는 레시피">
							<button type="submit"
								class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100"
								style="top: 0; right: 25%;">바로 검색</button>
						</form>
					</div>
				</div>
				<div class="col-md-12 col-lg-5">
					<div id="carouselId" class="carousel slide position-relative"
						data-bs-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active rounded">
								<img src="img/hero-img-1.png"
									class="img-fluid w-100 h-100 bg-secondary rounded"
									alt="First slide"> <a href="/recipeshop"
									class="btn px-4 py-2 text-white rounded">추천 레시피</a>
							</div>
							<div class="carousel-item rounded">
								<img src="img/hero-img-2.jpg"
									class="img-fluid w-100 h-100 rounded" alt="Second slide">
								<a href="/board?CategoryNo=3"
									class="btn px-4 py-2 text-white rounded">나만의 레시피</a>
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselId" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselId" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Hero End -->

	

	<c:if test="${recipeList.size() > 0}"><!-- 냉장고 레시피 시작 -->
		<div class="container-fluid fruite">
			<div class="container">
				<div class="tab-class text-center">
					<div class="row g-4">		
						<div class="col-lg-8 mx-auto" style="margin-bottom: -50px;">
							<h3 class="mb-0">
								<i class="fa fa-carrot" style="color: #f57316;"></i>냉장고에 남아있는 재료를 사용 해보세요!
							</h3>
							<p class="mb-4" style="font-size: 20px; margin-top:2px;">
							 <i class="fa fa-drumstick-bite" style="color:#b8652a;"></i>
							 맛있는 요리와 함께 행복한 하루!
							 </p>
							<br>
							<br>
						</div>
					</div>
					<div class="tab-content">
						<div id="tab-1" class="tab-pane fade show p-0 active">
							<div class="row g-4 justify-content-center">
								<!-- 수정된 부분 -->
								<div class="col-lg-12">
									<div class="row g-4">
										<c:set var="count" value="0" />
										<c:forEach items="${recipeList}" var="RecipeDTO">
											<div class="col-md-6 col-lg-4 col-xl-3"
												style="display: ${count < 4 ? 'block' : 'none'};">
												<div class="rounded position-relative fruite-item">
													<div class="fruite-img">
														<img src="${RecipeDTO.recipe_img}"
															class="img-fluid w-100 rounded-top" alt="">
													</div>
													<div
													class="position-absolute top-0 start-0 px-3 py-1 rounded"
													style="background-color: 
								                    <c:choose>
								                        <c:when test="${RecipeDTO.recipe_category eq '밥'}">
								                            green
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '국&찌개'}">
								                            orange
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '반찬'}">
								                            #0084d1
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '후식'}">
								                            #bf02bc
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '일품'}">
								                            #fc6d6d
								                        </c:when>
								                        <c:otherwise>
								                            white 
								                        </c:otherwise>
								                    </c:choose>;
								                 font-size:17px;   
								                 color: white;
								                 font-weight: bold;
								               	 top: 10px !important;
								                 left: 10px !important;">
													${RecipeDTO.recipe_category}</div>
													<div
														class="p-4 border border-secondary border-top-0 rounded-bottom">
														<h4 class="recipe-name">${RecipeDTO.recipe_name}</h4>
														<div class="d-flex justify-content-between flex-lg-wrap"
															style="margin-left: 40px;">
															<a href="/recipedetail?recipe_id=${RecipeDTO.recipe_id}"
																class="btn border border-secondary rounded-pill px-3 text-primary gorecipe"
																style="margin-top: 10px;"> <i
																class="fa fa-search me-2 text-primary"></i>레시피 상세 보기
															</a>
														</div>
													</div>
												</div>
											</div>
											<c:set var="count" value="${count + 1}" />
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if><!-- 냉장고 레시피 끝 -->
	
	<c:if test="${dietRecipeList.size() > 0}"> <!-- 다이어튼 레시피 시작 -->
		<div class="container-fluid fruite py-5">
			<div class="container ">
				<div class="tab-class text-center">
					<div class="row g-4">
						<div class="col-lg-8 mx-auto" style="margin-bottom: -50px;">
							<h3 class="mb-0">
								<i class="fa fa-dumbbell" style="color: #949494;"></i>맛있게 먹으면서도 건강하게!
							</h3>
							<p class="mb-4" style="font-size: 20px; margin-top:2px;">
							 <i class="fas fa-thumbs-up" style="color:#80b7ff;"></i>
							 다이어트 성공 기원!
							 </p>
							<br>
							<br>
						</div>
					</div>
					<div class="tab-content">
						<div id="tab-1" class="tab-pane fade show p-0 active">
							<div class="row g-4 justify-content-center">
								<!-- 수정된 부분 -->
								<div class="col-lg-12">
									<div class="row g-4">
										<c:set var="count" value="0" />
										<c:forEach items="${dietRecipeList}" var="Recipediet">
											<div class="col-md-6 col-lg-4 col-xl-3"
												style="display: ${count < 4 ? 'block' : 'none'};">
												<div class="rounded position-relative fruite-item">
													<div class="fruite-img">
														<img src="${Recipediet.recipe_img}"
															class="img-fluid w-100 rounded-top" alt="">
													</div>
												<div
													class="position-absolute top-0 start-0 px-3 py-1 rounded"
													style="background-color: 
								                    <c:choose>
								                        <c:when test="${Recipediet.recipe_category eq '밥'}">
								                            green
								                        </c:when>
								                        <c:when test="${Recipediet.recipe_category eq '국&찌개'}">
								                            orange
								                        </c:when>
								                        <c:when test="${Recipediet.recipe_category eq '반찬'}">
								                            #0084d1
								                        </c:when>
								                        <c:when test="${Recipediet.recipe_category eq '후식'}">
								                            #bf02bc
								                        </c:when>
								                        <c:when test="${Recipediet.recipe_category eq '일품'}">
								                            #fc6d6d
								                        </c:when>
								                        <c:otherwise>
								                            white 
								                        </c:otherwise>
								                    </c:choose>;
								                 font-size:17px;   
								                 color: white;
								                 font-weight: bold;
								               	 top: 10px !important;
								                 left: 10px !important;">
													${Recipediet.recipe_category}</div>
													<div
														class="p-4 border border-secondary border-top-0 rounded-bottom">
														<h4 class="recipe-name" title="${Recipediet.recipe_name}">${Recipediet.recipe_name}</h4>
														<div class="d-flex justify-content-center"
														    style="margin-top: 10px;">
														    <a href="/recipedetail?recipe_id=${Recipediet.recipe_id}"
														        class="btn border border-secondary rounded-pill px-3 text-primary gorecipe">
														        <i class="fa fa-search me-2 text-primary"></i>레시피 상세 보기
														    </a>
														</div>
													</div>
												</div>
											</div>
											<c:set var="count" value="${count + 1}" />
										</c:forEach>					
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if><!-- 다이어트 레시피 끝 -->
	
	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-8 mx-auto" style="margin-bottom: -10px;">
						<h3 class="mb-0">
							<i class="fa fa-bolt" style="color: orange;"></i> 재료까지 한번에 빠른 추천
							레시피
						</h3>
						<p class="mb-4" style="font-size: 20px; margin-top:2px;">
							<i class="fa fa-solid fa-pepper-hot"
								style="color: red; margin-left: 5px;"></i>이번주 제일핫한 음식! 어휴 뜨거!<i
								class="fa fa-fire" style="color: red; margin-left: 5px;"></i>
						</p>
					</div>
				</div>
				<div class="tab-content">
					<div id="tab-1" class="tab-pane fade show p-0 active">
						<div class="row g-4 justify-content-center">
							<!-- 수정된 부분 -->
							<div class="col-lg-12">
								<div class="row g-4">
									<c:set var="count" value="0" />
									<c:forEach items="${recipe}" var="Recipe">
										<div class="col-md-6 col-lg-4 col-xl-3">
											<div class="rounded position-relative fruite-item">
												<div class="fruite-img">
													<img src="${Recipe.recipe_img}"
														class="img-fluid w-100 rounded-top" alt="">
												</div>
												<div
													class="position-absolute top-0 start-0 px-3 py-1 rounded"
													style="background-color: 
								                    <c:choose>
								                        <c:when test="${Recipe.recipe_category eq '밥'}">
								                            green
								                        </c:when>
								                        <c:when test="${Recipe.recipe_category eq '국&찌개'}">
								                            orange
								                        </c:when>
								                        <c:when test="${Recipe.recipe_category eq '반찬'}">
								                            #0084d1
								                        </c:when>
								                        <c:when test="${Recipe.recipe_category eq '후식'}">
								                            #bf02bc
								                        </c:when>
								                        <c:when test="${Recipe.recipe_category eq '일품'}">
								                            #fc6d6d
								                        </c:when>
								                        <c:otherwise>
								                            white <!-- Default background color -->
								                        </c:otherwise>
								                    </c:choose>;
								                 font-size:17px;   
								                 color: white;
								                 font-weight: bold;
								               	 top: 10px !important;
								                 left: 10px !important;">
													${Recipe.recipe_category}</div>
												<div
													class="p-4 border border-secondary border-top-0 rounded-bottom">
													<h4 class="recipe-name" title="${Recipe.recipe_name}">${Recipe.recipe_name}</h4>
													<div class="d-flex justify-content-between flex-lg-wrap"
														style="margin-left: 40px;">
														<a href="/recipedetail?recipe_id=${Recipe.recipe_id}"
															class="btn border border-secondary rounded-pill px-3 text-primary gorecipe"
															style="margin-top: 10px;"> <i
															class="fa fa-search me-2 text-primary"></i>레시피 상세 보기
														</a>
													</div>
												</div>
											</div>
										</div>
										<c:set var="count" value="${count + 1}" />
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Fruits Shop End-->
	
	<!-- Vesitable Shop Start-->
	<div class="container vesitable text-center">
		<div class="row">
			<div class="lap" style="margin-bottom: -60px;">
				<h3 class="mb-0">
					<i class="fa fa-solid fa-wallet" style="color: brown;"></i> 가벼운 지갑을
					지켜줄 알뜰시장!
				</h3>
				<p class="mb-4" style="font-size: 20px; margin-top:2px;">
				<i class="fa fa-dollar-sign" style="color:green;"></i>
				신선도 보장! 최소 10% ~ 최대 30% 할인<i class="fa fa-dollar-sign" style="color:green; margin-left:7px;"></i>
				</p>
					
			</div>
			<div class="owl-carousel vegetable-carousel justify-content-center">
				<c:forEach var="ProductDTO" items="${products}">
					<div class="border rounded position-relative vesitable-item">
						<div class="vesitable-img">
							<img src="${ProductDTO.product_img}"
								class="img-fluid w-100 rounded-top" alt=""
								style="width: 180px; height: 230px;">
						</div>
						<div
							class="text-white bg-primary px-3 py-1 rounded position-absolute"
							style="top: 10px; right: 10px; font-weight: bold; font-size: 17px; background-color: #ffb524 !important;">${ProductDTO.product_category}</div>
						<div
							class="p-4 border border-secondary border-top-0 rounded-bottom">
							<h6
								style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${ProductDTO.product_name}</h6>
							<a>${ProductDTO.product_content}</a><br> <a>유통기한 :
								구매일로부터 ${ProductDTO.limit_date}일</a>
							<div class="d-flex justify-content-between flex-lg-wrap">
								<p class="text-dark fs-5 fw-bold mb-0" style="margin-top: 18px;">
									<span class="product-price">${ProductDTO.product_price}</span>원
								</p>
								<div class="product-id" style="display: none;">
									${ProductDTO.product_id}</div>
								<div class="product-name" style="display: none;">
									${ProductDTO.product_name}</div>
								<a href="#"
									class="btn border border-secondary rounded-pill px-3 text-primary buyproduct"
									style="margin-top: 10px;" data-bs-toggle="modal"
									data-bs-toggle="modal" data-bs-target="#quantityModal"> <i
									class="fa fa-shopping-bag me-2 text-primary"></i>담기
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Vesitable Shop End -->
	<!-- 장바구니 모달 -->
	<div class="modal fade" id="quantityModal" tabindex="-1"
		aria-labelledby="quantityModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="quantityModalLabel">수량 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="row g-3">
						<!-- 제품 ID와 이름을 출력하는 부분 -->
						<div class="col-12 mb-3">
							<input type="hidden" id="productId" name="productId"> <label
								for="productName" class="form-label">제품 이름</label> <input
								type="text" class="form-control" id="productName"
								name="productName" readonly required>
						</div>
						<!-- 수량 입력 필드 -->
						<div class="col-12 mb-3">
							<label for="quantityInput" class="form-label">수량</label> <input
								type="number" class="form-control" id="quantityInput"
								name="quantityInput" placeholder="수량을 입력하세요" min="1" required>
						</div>
						<!-- 추가 버튼 -->
						<div class="col-12">
							<button type="button" class="btn"
								style="border: 1px solid #dc2e5e; float: right; margin-top: -20px; color: #dc2e5e;"
								id="addToCartBtn">
								<i class="fa fa-shopping-bag me-2 text-primary"> </i> 담기
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	


	<!-- footer start -->
	<%@ include file="footer.jsp"%>
	<!-- footer End -->



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
		//제품 가격을 단위 (,) 표현하기
		document.addEventListener('DOMContentLoaded', function() {
			var priceElements = document.querySelectorAll('.product-price');
			priceElements.forEach(function(element) {
				element.textContent = Number(element.textContent)
						.toLocaleString();
			});
		});

		//장바구니 수량 제한
		var confirmedOverLimit = false;
		var quantityInput = document.getElementById('quantityInput');

		quantityInput.addEventListener('input', function(event) {
			var quantity = parseInt(event.target.value);
			if (quantity >= 10 && !confirmedOverLimit) {
				var confirmResult = confirm("선택한 제품 수량이 10개 이상입니다. 계속하시겠습니까?");
				if (!confirmResult) {
					event.target.value = '9';
				} else {
					confirmedOverLimit = true;
				}
			}
		});
		//닫으면 수량 초기화
		var quantityModal = document.getElementById('quantityModal');
		quantityModal.addEventListener('hidden.bs.modal', function() {
			quantityInput.value = '1';
			confirmedOverLimit = false;
		});

		//장바구니 담기 
		var modal = new bootstrap.Modal(document
				.getElementById('quantityModal'));

		$('.buyproduct').click(
				function() {
					var productId = $(this).closest('.vesitable-item').find(
							'.product-id').text().trim();
					var productName = $(this).closest('.vesitable-item').find(
							'.product-name').text().trim();

					// 모달에 선택된 제품의 ID와 이름을 설정하여 모달을 열기
					$('#quantityModal #productId').val(productId);
					$('#quantityModal #productName').val(productName);

					// 모달 열기
					$('#quantityModal').modal('show');
				});

		$(document).on('click', '#addToCartBtn', function() {
			var productId = $('#quantityModal #productId').val(); // 모달 내에서 선택된 제품의 ID 가져오기
			var quantity = $('#quantityInput').val(); // 수량 입력값 가져오기

			$.ajax({
				type : "POST",
				url : "/ItemToCart",
				data : {
					product_id : productId,
					product_quantity : quantity
				},
				success : function(response) {
					modal.hide();
					$('#quantityModal #productId').val('');
					$('#quantityInput').val('');
					alert(response.message);
					$('#cartCountIndicator').text(response.cartCount);
				},
				error : function(xhr, status, error) {
					// 오류 발생 시 수행할 작업
					console.error('장바구니 추가 실패:', error);
				}
			});
		}); // 장바구니 담기 끝
	</script>
</body>
</html>
