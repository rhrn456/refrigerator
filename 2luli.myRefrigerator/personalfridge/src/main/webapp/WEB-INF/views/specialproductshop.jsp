<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8">
        <title>나의 작은 냉장고</title>
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


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Special Product Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/recipeshop">Recipe Shop</a></li>
                <li class="breadcrumb-item"><a href="/productshop">Product</a></li>
                <li class="breadcrumb-item active text-white">Special Product Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Special Product Shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
								<div class="col-xl-3">
								    <div class="input-group w-100 mx-auto d-flex">
								    	<!-- <input id="searchInput1" type="text"> -->
								       <input id=searchInput1 type="text" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1" style="margin-bottom: 20px;"> 
								        <button id="searchButton" class="btn btn-primary p-3" style="margin-bottom: 20px;"><i class="fa fa-search"></i></button>
								    </div>
								</div>
                            <div class="col-6"></div>
       
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>카테고리</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
									                <div class="d-flex justify-content-between allproduct">
									                    <a href="/specialproductshop"><i class="fas fa-apple-alt me-2"></i>모든 재료</a>
									                </div>
									            </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>가공 식품</a>
                                                        
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>야채</a>
                                                     
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>과일</a>
                                                      
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>육류/생선</a>
                                                       
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>향신료</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">Special <br> Products <br> Banner</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
														<!-- 페이지당 아이템 수와 현재 페이지 설정 -->
							<c:set var="pageSize" value="9" />
							<c:set var="currentPage" value="${not empty param.page ? param.page : 1}" />
							
							<div class="col-lg-9">
							    <div class="row g-4 justify-content-center">
							        <!-- 상품 목록을 페이지에 맞게 자르기 -->
							        <c:forEach var="product" items="${products}" begin="${(currentPage - 1) * pageSize}" varStatus="loop">
							            <c:if test="${loop.index < currentPage * pageSize && loop.index >= (currentPage - 1) * pageSize}">
							                <div class="col-md-6 col-lg-6 col-xl-4">
							                    <div class="rounded position-relative fruite-item">
							                        <div class="fruite-img">
							                            <img src="${product.product_img}" class="img-fluid w-100 rounded-top" alt="" style="max-width: 300px; max-height: 150px;">
							                        </div>
							                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.product_category}</div>
							                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
							                            <h4>${product.product_name}</h4>
							                            <p>${product.product_content}</p>
							                            <p>유통기한 : 구매일로부터 ${product.limit_date}일</p>
							                            <div class="d-flex justify-content-between flex-lg-wrap">
							                                <p class="text-dark fs-5 fw-bold mb-0">${product.product_price}</p>
							                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
							                            </div>
							                        </div>
							                    </div>
							                </div>
							            </c:if>
							        </c:forEach>
							    </div>
								<div class="col-12">
								     <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer">
    									  <!-- 총 페이지 수 계산 -->
								        <c:set var="totalPages" value="${pageRequestDTO.totalPages}" />
								        <!-- 페이지 링크 생성 -->
										<c:forEach var="pageNumber" begin="1" end="${totalPages}">
										    <a href="#"  class="rounded ${pageNumber == currentPage ? 'active' : ''}">${pageNumber}</a>
										</c:forEach>
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
		$(document).ready(function() {
		    var selectedCategory = "";
		    var totalPage = ${pageRequestDTO.totalPages};
		    // 카테고리 링크 클릭 시
		    $('.product-category a').click(function(e) {
		        e.preventDefault(); // 기본 동작 방지
		
		        var category = $(this).text().trim(); // 선택된 카테고리 텍스트 가져오기
		        selectedCategory = category;
		        $('#paginationContainer').empty(); // 페이지 버튼 컨테이너 비우기
		
		        // AJAX 요청 보내기
		        getSpecialProductsByCategory(category, 1); // 페이지 번호 1로 초기화
		        
		    });
		
		 // 페이지 버튼 클릭 이벤트 핸들러 등록
		    $('#paginationContainer').on('click', 'a', function(e) {
		        e.preventDefault();
		        var keyword = $('.form-control').val();
		        var page = $(this).text().trim(); // 클릭된 페이지 번호 가져오기
		        var totalPage = ${pageRequestDTO.totalPages}; // totalPage 변수 정의 및 초기화
		        if(selectedCategory == ""){
		            getProductsBySpecialAll(page);
		        } else if(keyword !== ""){
		        	getSpecialProductsByKeyword(keyword, page);
		        } else {
		            getSpecialProductsByCategory(selectedCategory, page);
		        }
		    });
		});
		
		
		//모든 재료 페이지 번호를 받아 상품 목록을 가져오는 함수
		function getProductsBySpecialAll(page) {
		    var pageSize = 9; // 페이지당 아이템 수
		    $.ajax({
		        type: "GET",
		        url: "/getSpecialProductsByCategory",
		        data: {
		            category: '',
		            page: page,
		            pageSize: pageSize 
		        },
		        success: function(response) {
		        	 updateProducts(response);
                },
		        error: function(xhr, status, error) {
		            // 에러 처리 로직
		            console.error(error);
		        }
		    });
		}
				
		
		// 카테고리와 페이지 번호를 받아 상품 목록을 가져오는 함수
		function getSpecialProductsByCategory(category, page) {
		    var pageSize = 9; // 페이지당 아이템 수
		    
		    $.ajax({
		        type: "GET",
		        url: "/getSpecialProductsByCategory",
		        data: {
		            category: category,
		            page: page,
		            pageSize: pageSize // 페이지 크기도 함께 전송
		        },
		        success: function(response) {
		        	 updateProducts(response);
                },
		        error: function(xhr, status, error) {
		            // 에러 처리 로직
		            console.error(error);
		        }
		    });
		}
		
		
		//검색 페이지 
		// 검색 버튼 클릭 시 검색 실행
			$('#searchButton').on('click', function() {
			    executeSearch();
			});
			
			// Enter 키를 누를 때 검색 실행
			$('#searchInput1').on('keypress', function(e) {
			    if (e.which === 13) { // Enter 키를 누르면
			        executeSearch();
			    }
			});
			
			// 검색 실행 함수
			function executeSearch() {
			    var keyword = $('#searchInput1').val().trim();
			    	//document.getElementById("searchInput1").value;
			    //$('#searchInput').val().trim(); 
				getSpecialProductsByKeyword(keyword, 1);
			  
			}

			function getSpecialProductsByKeyword(keyword, page) {
				
			    var pageSize = 9;
			    // AJAX 요청 보내기
			    $.ajax({
			        type: "GET",
			        url: "/searchSpecialProduct",
			        data: {
			            keyword: keyword,
			            page: page,
			            pageSize: pageSize
			        },
			        success: function(response) {
			        	 updateProducts(response);
	                },
			        error: function(xhr, status, error) {
			            // 에러 처리 로직
			            console.error(error);
			        }
			    });
			}
		
			// 받아온 상품 정보를 업데이트하는 함수
	        function updateProducts(response) {
	        	// 성공적으로 데이터를 받았을 때 처리하는 로직
	            var productsContainer = $('.col-lg-9 .row'); // 상품 목록 컨테이너 선택
	            productsContainer.empty(); // 기존 상품 목록 비우기
	            // 받아온 데이터를 페이지에 맞게 출력
	            $.each(response.products, function(index, product) {
	                // 상품 정보를 HTML로 생성하는 코드
	                var productHTML = '<div class="col-md-6 col-lg-6 col-xl-4">' +
	                '<div class="rounded position-relative fruite-item">' +
	                '<div class="fruite-img">' +
	                '<img src="' + product.product_img + '" class="img-fluid w-100 rounded-top" alt="" style="max-width: 300px; max-height: 150px;">' +
	                '</div>' +
	                '<div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">' + product.product_category + '</div>' +
	                '<div class="p-4 border border-secondary border-top-0 rounded-bottom">' +
	                '<h4>' + product.product_name + '</h4>' +
	                '<p>' + product.product_content + '</p>' +
	                '<p>' + "유통기한 : 구매일로부터 " + product.limit_date + "일" + '</p>' +
	                '<div class="d-flex justify-content-between flex-lg-wrap">' +
	                '<p class="text-dark fs-5 fw-bold mb-0">' + product.product_price + '</p>' +
	                '<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>' +
	                '</div>' +
	                '</div>' +
	                '</div>' +
	                '</div>';
	                productsContainer.append(productHTML); // 새로운 상품을 기존의 상품 목록에 추가
	            });

	            createPaginationButtons(response.pageRequestDTO.totalPages, response.pageRequestDTO.currentPage);
	        }
			
			
		//페이지 버튼 생성 함수
		function createPaginationButtons(totalPages, currentPage) {
		    var paginationContainer = $('#paginationContainer');
		    paginationContainer.empty(); // 기존 페이지 버튼 제거
		    // 페이지 수만큼 버튼 생성
		    for (var i = 1; i <= totalPages; i++) {
		        var button = $('<a href="#" class="rounded ' + (i == currentPage ? 'active' : '') + '">' + i + '</a>');
		        paginationContainer.append(button);
		    }
		
		}
		</script>
    </body>
</html>