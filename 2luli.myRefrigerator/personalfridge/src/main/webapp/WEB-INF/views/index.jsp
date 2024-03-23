<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
		
        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
		
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
		
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <!-- Navbar start -->
       <%@ include file="header.jsp" %>
        <!-- Navbar End -->

    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->
		

		
        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
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
                        <h4 class="mb-3 text-secondary">배달음식 그만!</h4>
                        <h1 class="mb-5 display-3 text-primary">직접 요리하는<br>나만의 레시피</h1>
                        <div class="position-relative mx-auto">
                            <form id="searchForm" action="/mainSearch" method="GET">
							    <input name="keyword" id="keywordInput" class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="text" placeholder="원하는 레시피">
							    <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">바로 검색</button>
							</form>
							</div>
						 </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="/recipeshop" class="btn px-4 py-2 text-white rounded">추천 레시피</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="/board?CategoryNo=3" class="btn px-4 py-2 text-white rounded">나만의 레시피</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->

	        <!-- Fruits Shop Start-->
	       <div class="container-fluid fruite py-5">
	    <div class="container py-5">
	        <div class="tab-class text-center">
	            <div class="row g-4">
	                <div class="col-lg-8 mx-auto" style="margin-bottom:-10px;">
	                <h3 class="mb-0">
	                <i class="fa fa-bolt" style="color: orange;"></i>
	                    재료까지 한번에 빠른 추천 레시피</h3>
	                     <p class="mb-4" style="font-size:15px;"><i class="fa fa-solid fa-pepper-hot" style="color:red; margin-left:5px;"></i>이번주 제일핫한 음식! 어휴 뜨거!<i class="fa fa-fire" style="color:red; margin-left:5px;"></i></p>
	                </div>
	            </div>
	            <div class="tab-content">
	                <div id="tab-1" class="tab-pane fade show p-0 active">
	                    <div class="row g-4 justify-content-center"> <!-- 수정된 부분 -->
	                        <div class="col-lg-12">
	                            <div class="row g-4">
	                                <c:set var="count" value="0" />
	                                <c:forEach items="${recipe}" var="RecipeDTO">
	                                    <div class="col-md-6 col-lg-4 col-xl-3" style="display: ${count < 4 ? 'block' : 'none'};">
	                                        <div class="rounded position-relative fruite-item">
	                                            <div class="fruite-img">
	                                                <img src="${RecipeDTO.recipe_img}" class="img-fluid w-100 rounded-top" alt="">
	                                            </div>
	                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${RecipeDTO.recipe_category}</div>
	                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
	                                                <h4>${RecipeDTO.recipe_name}</h4>
	                                                <p style="height:20px;">${RecipeDTO.recipe_content}</p>
	                                                <div class="d-flex justify-content-between flex-lg-wrap" style="margin-left:40px;">
	                                                     <a href="/recipedetail?recipe_id=${RecipeDTO.recipe_id}"
									                       class="btn border border-secondary rounded-pill px-3 text-primary gorecipe" style="margin-top:10px;">
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

        <!-- Fruits Shop End-->

        <!-- Vesitable Shop Start-->
        <div class="container vesitable py-5 text-center">
            <div class="row">
                <div class="lap" style="margin-bottom:-60px;" >
				            <h3 class="mb-0">
				            <i class="fa fa-solid fa-wallet" style="color: brown;"></i>
				            가벼운 지갑을 지켜줄 알뜰시장!</h3>
				            <p class="mb-4" style="font-size:15px;">신선도 보장! 최소 10% ~ 최대 30% 할인</p>
				        </div>
                <div class="owl-carousel vegetable-carousel justify-content-center">
            <c:forEach var="ProductDTO" items="${products}">
                <div class="border rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="${ProductDTO.product_img}"  class="img-fluid w-100 rounded-top" alt="" style="width: 180px; height: 230px;">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px; background-color:#ffb524 !important;">${ProductDTO.product_category}</div>
                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                         <h6 style=" white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;">${ProductDTO.product_name}</h6>
                        <a>${ProductDTO.product_content}</a><br>
                         <a>유통기한 : 구매일로부터 ${ProductDTO.limit_date}일</a>
                         <div class="d-flex justify-content-between flex-lg-wrap">
                             <p class="text-dark fs-5 fw-bold mb-0" style="margin-top:18px;">${ProductDTO.product_price}원</p>
                             <div class="product-id" style="display: none;"> ${ProductDTO.product_id}</div>
                               <div class="product-name" style="display: none;"> ${ProductDTO.product_name}</div>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary buyproduct" style="margin-top:10px;" data-bs-toggle="modal" data-bs-toggle="modal"  data-bs-target="#quantityModal">
							<i class="fa fa-shopping-bag me-2 text-primary"></i>담기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->
		<!-- 장바구니 모달 -->
		<div class="modal fade" id="quantityModal" tabindex="-1" aria-labelledby="quantityModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="quantityModalLabel">수량 선택</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form class="row g-3">
		          <!-- 제품 ID와 이름을 출력하는 부분 -->
		          <div class="col-12 mb-3">
		            <input type="hidden" id="productId" name="productId">
		            <label for="productName" class="form-label">제품 이름</label>
		            <input type="text" class="form-control" id="productName" name="productName" readonly required>
		          </div>
		          <!-- 수량 입력 필드 -->
		          <div class="col-12 mb-3">
		            <label for="quantityInput" class="form-label">수량</label>
		            <input type="number" class="form-control" id="quantityInput" name="quantityInput" placeholder="수량을 입력하세요" min="1" required>
		          </div>
		          <!-- 추가 버튼 -->
		          <div class="col-12">
		            <button type="button" class="btn btn-primary" style="float:right; margin-top:-20px;" id="addToCartBtn">장바구니에 추가</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>


		<!-- footer start -->
		<%@ include file="footer.jsp" %>
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

    
    //장바구니 담기 
	var modal = new bootstrap.Modal(document.getElementById('quantityModal'));
	
	$('.buyproduct').click(function() {
	    var productId = $(this).closest('.vesitable-item').find('.product-id').text().trim();
	    var productName = $(this).closest('.vesitable-item').find('.product-name').text().trim();
	    
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
	        type: "POST",
	        url: "/ItemToCart",
	        data: {
	        	product_id: productId,
	        	product_quantity: quantity
	        },
	        success: function(response) {
	        	 modal.hide();
	        	 $('#quantityModal #productId').val(''); 
	             $('#quantityInput').val('');
	             alert(response.message);
	             $('#cartCountIndicator').text(response.cartCount);
	        },
	        error: function(xhr, status, error) {
	            // 오류 발생 시 수행할 작업
	            console.error('장바구니 추가 실패:', error);
	        }
	    }); 
	}); // 장바구니 담기 끝
   

    </script>
    </body>
</html>
