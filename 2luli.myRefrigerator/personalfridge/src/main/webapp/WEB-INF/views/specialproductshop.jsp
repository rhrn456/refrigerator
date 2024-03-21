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
            <h1 class="text-center text-white display-6">알뜰 쇼핑</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/productshop">냉장고 식량 창고</a></li>
                <li class="breadcrumb-item active text-white">알뜰 쇼핑</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">알뜰 쇼핑</h1>
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
							<div class="col-lg-9">
							    <div class="row g-4 justify-content-center">
							        <!-- 상품 목록을 페이지에 맞게 자르기 -->
							        <c:forEach var="product" items="${products}">		            
							                <div class="col-md-6 col-lg-6 col-xl-4">
							                    <div class="rounded position-relative fruite-item">
							                        <div class="fruite-img">
							                            <img src="${product.product_img}" class="img-fluid w-100 rounded-top" alt="" style="width: 180px; height: 230px;">
							                        </div>
							                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${product.product_category}</div>
							                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
							                            <h6 style=" white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;">${product.product_name}</h6>
							                            <a>${product.product_content}</a><br>
							                            <a>유통기한 : 구매일로부터 ${product.limit_date}일</a>
							                            <div class="d-flex justify-content-between flex-lg-wrap">
							                                <a class="text-dark fs-5 fw-bold mb-0" style="margin-top:18px;">${product.product_price}원</a>
							                                  <div class="product-id" style="display: none;"> ${product.product_id}</div>
							                                  <div class="product-name" style="display: none;"> ${product.product_name}</div>
							                               <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary" style="margin-top:10px;" data-bs-toggle="modal"  data-bs-target="#quantityModal">
															    <i class="fa fa-shopping-bag me-2 text-primary"></i>장바구니 담기
															</a>
							                            </div>
							                        </div>
							                    </div>
							                </div>
							        </c:forEach>
							    </div>
									<div class="col-12">
						                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer" >
							                 <!-- 총 페이지 수 계산 -->
						                    <c:set var="totalPages" value="${pageInfo.pageAmount}" />
											<div class="col-auto">
											    <nav class="page navigation">
											        <ul class="pagination">
											            <!-- Prev 버튼 -->
											            <c:if test="${pageInfo.prev}">
											                <li class="page-item">
											                    <a class="page-link rounded ${pageInfo.startPage - 1 == pageInfo.currentPage ? 'active' : ''}"
											                       href="#" data-value="${pageInfo.startPage - 1}" aria-label="Previous">Prev</a>
											                </li>
											            </c:if>
											            
											            <!-- 페이지 버튼 -->
											            <c:forEach var="pageNumber" begin="1" end="${totalPages}">
											                <li class="page-item">
											                    <a href="#" class="page-link rounded ${pageNumber == pageInfo.currentPage ? 'active' : ''}" data-value="${pageNumber}">
											                        ${pageNumber}
											                    </a>
											                </li>
											            </c:forEach>
											            
											            <!-- Next 버튼 -->
											            <c:if test="${pageInfo.next}">
											                <li class="page-item next">
											                    <a class="page-link rounded ${pageInfo.endPage + 1 == pageInfo.currentPage ? 'active' : ''}"
											                       href="#" data-value="${pageInfo.endPage + 1}" aria-label="next">Next</a>
											                </li>
											            </c:if>
											        </ul>
											    </nav>
						                      </div>
						                </div>
						           </div> <!-- col-12 끝 -->
							    </div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->

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
		            <input type="number" oninput='handleOnInput(this, 1)' class="form-control" id="quantityInput" name="quantityInput" placeholder="수량을 입력하세요(10 미만 적어주세요.)" min="1" required>
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
		//장바구니 수량 제한
		function handleOnInput(el, maxlength) {
			  if(el.value.length > maxlength)  {
			    el.value 
			      = el.value.substr(0, maxlength);
			  }
			}
		//장바구니 모달
		var modal = new bootstrap.Modal(document.getElementById('quantityModal'));
		
		$(document).on('click', '.btn.border.border-secondary.rounded-pill.px-3.text-primary', function() {
		    var productId = $(this).closest('.fruite-item').find('.product-id').text().trim();
		    var productName = $(this).closest('.fruite-item').find('.product-name').text().trim();
		    
		    
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
		   
		});
		
		
		$(document).ready(function() {
			var category ="";
		    var keyword = "";
		    var page = 1;
		    
		    // 카테고리 링크 클릭 시
		    $('.product-category a').click(function(e) {
		        e.preventDefault(); // 기본 동작 방지
		        category = $(this).text().trim(); // 선택된 카테고리 텍스트 가져오기
		        selectedCategory = category;
		        $('#paginationContainer').empty(); // 페이지 버튼 컨테이너 비우기
		
		        // AJAX 요청 보내기
		        getSpecialProductsByCategory(category, 1); // 페이지 번호 1로 초기화
		        
		    });
		
		 // 페이지 버튼 클릭 이벤트 핸들러 등록
		    $('#paginationContainer').on('click', 'a', function(e) {
		        e.preventDefault();
		        keyword = $('.form-control').val();
		        page = $(this).data('value'); // 클릭된 링크의 data-value 속성 값을 가져오기
		        if (page === 'Prev' || page === 'Next') {
	 		        // Prev 또는 Next 링크를 클릭한 경우
	 		        page = $(this).attr('value');
	 		    } 
		        if(category === "" && keyword === ""){
		            getProductsBySpecialAll(page);
		        } else if(keyword !== ""){
		        	getSpecialProductsByKeyword(category, keyword, page);
		        } else {
		            getSpecialProductsByCategory(category, page);
		        }
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
			    keyword = $('#searchInput1').val().trim();
				getSpecialProductsByKeyword(category, keyword, 1);
			  
			}

			function getSpecialProductsByKeyword(category, keyword, page) {
			    var pageSize = 9;
			    // AJAX 요청 보내기
			    $.ajax({
			        type: "GET",
			        url: "/searchSpecialProduct",
			        data: {
			        	category : category,
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
	                '<img src="' + product.product_img + '" class="img-fluid w-100 rounded-top" alt="" style="width: 180px; height: 230px;">' +
	                '</div>' +
	                '<div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">' + product.product_category + '</div>' +
	                '<div class="p-4 border border-secondary border-top-0 rounded-bottom">' +
	                '<h6 style=" white-space: nowrap;  overflow: hidden; text-overflow: ellipsis;">' + product.product_name + '</h6>' +
	                '<a>' + product.product_content + '</a>' + '<br>' +
	                '<a>' + "유통기한 : 구매일로부터 " + product.limit_date + "일" + '</a>' +
	                '<div class="d-flex justify-content-between flex-lg-wrap">' +
	                '<a class="text-dark fs-5 fw-bold mb-0" style="margin-top:18px;">' + product.product_price + "원" + '</a>' +
	                '<div class="product-id" style="display: none;">' + product.product_id + '</div>'+
                    '<div class="product-name" style="display: none;">' + product.product_name + '</div>' +
                    '<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"  style="margin-top:10px;" data-bs-toggle="modal"  data-bs-target="#quantityModal">' +
                    '<i class="fa fa-shopping-bag me-2 text-primary"></i>장바구니 담기</a>'+
	                '</div>' +
	                '</div>' +
	                '</div>' +
	                '</div>';
	                productsContainer.append(productHTML); // 새로운 상품을 기존의 상품 목록에 추가
	            });

	            $('#paginationContainer').empty();
	            // 페이징 버튼 업데이트
	            createPaginationButtons(response.pageInfo);
	        }
			
			
	        function createPaginationButtons(pageInfo) {
	            var paginationContainer = $('#paginationContainer');
	            var paginationHTML =
	                '<div class="col-auto">' +
	                '<nav class="page navigation">' +
	                '<ul class="pagination">';

	            if (pageInfo.prev) {
	                paginationHTML += '<li class="page-item">' +
	                    '<a class="page-link rounded ' + (pageInfo.startPage - 1 === pageInfo.currentPage ? 'active' : '') + '" aria-label="Previous" data-value="' + (pageInfo.startPage - 1) + '" href="#">Prev</a>' +
	                    '</li>';
	            }

	            for (var num = pageInfo.startPage; num <= pageInfo.endPage; num++) {
	                paginationHTML += '<li class="page-item ' + (pageInfo.currentPage == num ? "active" : "") + '">' +
	                    '<a class="page-link rounded ' + (num == pageInfo.currentPage ? 'active' : '') + '" href="#" data-value="' + num + '">' + num + '</a>' +
	                    '</li>';
	            }

	            if (pageInfo.next) {
	                paginationHTML += '<li class="page-item next">' +
	                    '<a class="page-link rounded" aria-label="next" data-value="' + (pageInfo.endPage + 1) + '" href="#">Next</a>' +
	                    '</li>';
	            }

	            paginationHTML += '</ul>' +
	                '</nav>' + // 수정된 부분: nav 태그 닫기
	                '</div>';
	            paginationContainer.append(paginationHTML);
	        }
	        
			
			});
		</script>
    </body>
</html>