<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>레시피 상세 페이지</title>
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
<link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../css/style.css" rel="stylesheet">
<!-- Navbar start -->
<%@ include file="../header.jsp"%>
<!-- Navbar End -->

<style>

		.card{
   	   	margin-left:150px;
   	   	margin-top:10px;
   	   	width:700px;
   	   	}
	    .card-info {
	        font-size: 20px;
	        display: flex;
	        justify-content: space-between; 
	        color:black;
	        
	    }
		.modal {
		  display: none; /* 모달 숨김 */
		  position: fixed;
		  z-index: 1;
		  left: 50%;
		  top: 50%;
		  transform: translate(-50%, -50%);
		  width: 100%;
		  height: 100%;
		  overflow: hidden;
		  background-color: rgba(0, 0, 0, 0.4);
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: 8% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 550px;
		  height:730px;
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
		
		
		.close {
		    color: #aaaaaa;
		    position: absolute;
		    top: 5px;
		    right: 15px;
		    max-width: 30px;
		    font-size: 28px;
		    font-weight: bold;

		}
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		.product-topcategory a {
		    cursor: pointer; 
		}
	    .product-topcategory a:hover {
	        color: red; 
	    }
	    .scroll-follow {
		    position: fixed;
		    top: 50px; /* 원하는 위치로 조정 */
		    right: 50px; /* 원하는 위치로 조정 */
		    max-height: calc(100vh - 100px); /* 화면 높이에서 위아래 여백 제외 */
		    overflow-y: auto; /* 세로 스크롤이 필요한 경우 자동 스크롤 표시 */
		    border: 1px solid #ccc;
		    padding: 10px;
		    height:500px;
		    margin-top:280px;
		    background-color: #fff;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		  }
		
		  /* 스크롤바 스타일을 추가할 수 있습니다. */
		  /* 예: */
		  .scroll-follow::-webkit-scrollbar {
		    width: 8px;
		  }
		
		  .scroll-follow::-webkit-scrollbar-thumb {
		    background-color: #888;
		    border-radius: 4px;
		  }
		  #toggleReceiptButton {
	        position: fixed;
	       /*  top: 340px; // 최고의 위치
	        right: 50px; */
	        bottom:10px;
	        right:10px;
	        z-index: 9999; /* 다른 요소 위에 표시 */
	        background-color: #007bff;
	        color: #fff;
	        border: none;
	        border-radius: 5px;
	        padding: 15px 30px;
	        cursor: pointer;
	    }
	    .review-section {
			width:600px;
			}
	     
	    .review {
	    	width:600px;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            text-align: left;
        }

        .review p {
            margin: 0;
        }

        .review small {
            color: #666;
        }

        .modal-dialog {
            width:300px;
            height:300px;
            margin: 0 auto;
            text-align: center;
        }

        .review-section h2 {
            margin-top: 0;
            margin-bottom: 10px;
            color: #333;
            border-top: 2px solid #ccc;
            padding-top: 10px;
        }

		.modal-contentupdate{
			width:500px;
			height:200px;
		}
        #RecipeCommentForm textarea {
            width: 400px;
        }

        .review-controls {
            display: flex;
            text-align: right;
        }

        .review-controls button {
            margin-top: 5px;
            margin-right: 10px;
        }

		
		/* 모달 닫기 버튼 스타일 */
		.close {
		  color: #aaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
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
		
		.modal-button {
		          margin-top: 20px;
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
		<h1 class="text-center text-white display-6">${recipe.recipe_name} 상세 페이지</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Single Product Start -->
	<div class="container-fluid py-5 mt-5">
		<div class="container py-5">
			<div class="row g-4 mb-5">
				<div class="col-lg-8 col-xl-9">
					<div class="row g-4">
						<div class="col-lg-6">
							<!-- 수정 -->
							<h4 class="fw-bold mb-3">${recipe.recipe_name}</h4>
							<div class="border rounded" style="height:300px;">
								<a href="#"> <img src="${recipe.recipe_img}" style="width:100%; height:100%;"
									class="img-fluid rounded" alt="Image">
								</a>
							</div>
						</div>
						<div class="col-lg-6">
						<h4 class="fw-bold mb-3">요리 방법</h4>
							<p class="mb-4">${recipe.recipe_content}</p>
							<p class="mb-4"><a style="font-weight: bold;">요리 재료 :</a> ${recipe.ingredient}</p>
						</div>
							<ul id="productList" class="row mt-3" style="margin-right:2px;"></ul>
						</div>
					</div>
				</div>
				
				
				    <!-- 댓글 섹션 -->
			        <h2>레시피의 평가를 남겨주세요!</h2>
			        <hr style="width:600px; border-top: 2px solid black;">
			    <div class="review-section">
			        <c:forEach items="${reviewList}" var="review">
			            <div class="review">
			                <p>${review.review_content}</p>
			                <small>작성자: ${review.user_id}, 작성일: <fmt:formatDate value="${review.create_review_date}" pattern="yyyy-MM-dd | HH:mm"/></small>
			               <c:if test="${review.user_id eq sessionScope.userId or sessionScope.userAdmin eq 2}">
			                    <!-- 댓글 수정 및 삭제 버튼 -->
			                    <div class="review-controls">
			                       <button id="updateButton" class="btn btn-primary btn-sm" data-review-id="${review.review_id}" data-review-content="${review.review_content}" data-recipe-id="${recipe.recipe_id}" data-user-id="${review.user_id}">수정</button>
			                       <button onclick="location.href='${pageContext.request.contextPath}/delete/${review.review_id}?recipe_id=${recipe.recipe_id}'" class="btn btn-danger btn-sm">삭제</button>
			                    </div>
			                </c:if>
			            </div>
			        </c:forEach>
			
			        <!-- 댓글 작성 폼 -->
			        <form action="${pageContext.request.contextPath}/review/add" method="post" class="mt-3 mb-3" id="RecipeCommentForm"  style="display: flex; justify-content: center; align-items: center;">
			            <input name="review_content" class="form-control" style="height: 50px; margin-right: 10px;" placeholder="댓글을 입력하세요" required>
			            <input type="hidden" name="recipe_id" value="${recipe.recipe_id}">
			            <button type="submit" class="btn btn-primary" style="width:170px; height:48px;">댓글 작성</button>
			        </form>
			        
			        <!-- 댓글 수정 모달 -->
			         <div id="modalContainer" class="modal-container">
					    <div class="modal-contentupdate">
					        <h4>리뷰 수정</h4>
					        <textarea id="updatereview" class="form-control" style="height: 100px;" placeholder="수정할 댓글을 입력하세요" required></textarea>
					        <button id="confirmUpdateButton" class="modal-button">확인</button>
					        <button id="cancelUpdateButton" class="modal-button">취소</button>
					    </div>
					</div>

				
				
				<!-- 영수증 -->
				     <div class="col-lg-4 col-xl-3 receipt-container" id="receiptContainer" style="display: none;">
						    <div class="scroll-container" style="overflow-y: auto; max-height: 600px;">
						        <div class="row g-4 fruite scroll-follow" id="scrollContainer" style="width:500px;">
						            <div class="col-lg-12" style="margin-top:5px">
						                <div class="mb-4">
						                    <h4>제품 목록</h4>
						                    <ul id="recipeItemsList" class="list-unstyled fruite-categorie"></ul>
						                <div class="text-end"> <!-- text-end 클래스 추가 -->
                        <a href="#" id="sendtoCart" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" style="margin-bottom:-30px !important; margin-top:-10px;"><i class="fa fa-shopping-bag me-2 text-primary"></i> 장바구니 담기</a>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
                   </div>
                </div>
                            
			</div>
					 <button id="toggleReceiptButton">구매하러 가기</button>
			<!-- Single Product End -->


		    <!-- 레시피 재료 검색창 -->
				<div id="myModal" class="modal" id="receiptContainer">
				  <div class="modal-content"style="position: relative;">
				    <span class="close">&times;</span>
				    	<!-- 페이지당 아이템 수와 현재 페이지 설정 -->
						<c:set var="pageSize" value="12" />
						<c:set var="currentPage" value="${not empty param.page ? param.page : 1}" />
				    <div class="col-lg-11" style="margin-left:20px;">
				       <div class="row justify-content-center">
				 		 <c:forEach var="product" items="${productlist}">
				 		<div class="card">
				 		 <div class="card-info">
				                   
				                    </div>
				                </div>
				 		 </c:forEach>
				          </div>
				          <div class="col-12">
				                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer">
				
				                </div>
				            </div>
				        </div>
				  </div>
				</div>




	

			<!-- JavaScript Libraries -->
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
			<script src="../lib/easing/easing.min.js"></script>
			<script src="../lib/waypoints/waypoints.min.js"></script>
			<script src="../lib/lightbox/js/lightbox.min.js"></script>
			<script src="../lib/owlcarousel/owl.carousel.min.js"></script>

			<!-- Template Javascript -->
			<script src="../js/main.js"></script>
			
			<script>
			var category = "";
			var keyword = "";
			var page = 1;
			var type = 0;
            drawCategories();
			initializeSearchField();
			bindSearchEvents();
            
			//리뷰 시간 출력
			function formatDate(dateString) {
			    var date = new Date(dateString);
			    var year = date.getFullYear();
			    var month = (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1);
			    var day = (date.getDate() < 10 ? '0' : '') + date.getDate();
			    var hours = (date.getHours() < 10 ? '0' : '') + date.getHours();
			    var minutes = (date.getMinutes() < 10 ? '0' : '') + date.getMinutes();

			    return year + '-' + month + '-' + day + ' ' + hours + '시' + minutes + '분';
			}

			//리뷰 수정
			var updateButtons = document.querySelectorAll("#updateButton");
			var cancelButton = document.getElementById("cancelUpdateButton");
			var confirmButton = document.getElementById("confirmUpdateButton");
			var modalContainer = document.querySelector("#modalContainer");
			
			updateButtons.forEach(function(button) {
			    button.onclick = function() {
			        // 모달 창 열기
			        modalContainer.style.display = "block";
			
			        // 해당 버튼에 연결된 데이터 가져오기
			        var reviewId = button.getAttribute('data-review-id');
			        var userId = button.getAttribute('data-user-id');
			        var recipeId = button.getAttribute('data-recipe-id');
			        var reviewContent = button.getAttribute('data-review-content'); // 리뷰 내용 가져오기
				
			        // 리뷰 수정 폼에 데이터 설정
			        modalContainer.setAttribute('data-review-id', reviewId);
			        modalContainer.setAttribute('data-user-id', userId);
			        modalContainer.setAttribute('data-recipe-id', recipeId);
			
			        // 리뷰 내용을 수정 모달의 텍스트 영역에 설정
			        var updateReviewTextArea = modalContainer.querySelector('#updatereview');
			        updateReviewTextArea.value = reviewContent;
			        console.log(modalContainer);
			    }
			});
			
			cancelButton.onclick = function() {
			    // 모달 창 닫기
			    modalContainer.style.display = "none";
			};
			
			confirmButton.onclick = function() {
				console.log("클릭");
				var reviewId = modalContainer.getAttribute('data-review-id');
				var content = modalContainer.querySelector('#updatereview').value.trim(); 
				var userId = modalContainer.getAttribute('data-user-id');
				var recipeId = modalContainer.getAttribute('data-recipe-id');
				
			    var review = {
			        review_id: reviewId,
			        review_content: content,
			        user_id: userId,
			        recipe_id: recipeId
			    };
			console.log(review);
			    var xhr = new XMLHttpRequest();
			    xhr.open('POST', '/update', true);
			    xhr.setRequestHeader('Content-Type', 'application/json');
			    xhr.onreadystatechange = function() {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                console.log('리뷰 업데이트 성공');                
			                modalContainer.style.display = "none";
			                window.location.reload();
			                // 여기에 필요한 처리 추가
			            } else {
			                console.error('리뷰 업데이트 실패');
			                // 여기에 필요한 처리 추가
			            }
			        }
			    };
			    xhr.send(JSON.stringify(review));
			};
			
            
			// 영수증 관련 함수
            // 왼쪽 아래 버튼 요소를 가져옴
            const toggleReceiptButton = document.getElementById('toggleReceiptButton');
            // 영수증 컨테이너 요소를 가져옴
            const receiptContainer = document.getElementById('receiptContainer');

            // 버튼 클릭 시 이벤트 처리
            toggleReceiptButton.addEventListener('click', function() {
                // 영수증 컨테이너 요소의 display 속성을 토글하여 표시/숨김 상태 변경
                if (receiptContainer.style.display === 'none') {
                    receiptContainer.style.display = 'block'; // 표시
                    renderRecipeItems();
                } else {
                    receiptContainer.style.display = 'none'; // 숨김
                    clearRecipeItemsList();
                }
            });
         
         function clearRecipeItemsList() {
        	    var recipeItemsList = document.getElementById('recipeItemsList');
        	    recipeItemsList.innerHTML = ''; // 영수증 목록 비우기
        	}
   
         
			// 모달 닫기 버튼에 클릭 이벤트 연결
			document.getElementsByClassName('close')[0].onclick = closeModal;

			// 모달 열기 함수
			function openModal() {
			    document.getElementById('myModal').style.display = 'block';
			    executeSearch();
			}

			// 모달 닫기 함수
			function closeModal() {
			    document.getElementById('myModal').style.display = 'none';
			    $('#searchInput1').val(''); // 검색어 비우기
			    category = ""; // 카테고리 초기화
			    keyword = ""; // 키워드 초기화
			    page = 1; // 페이지 번호 초기화
			    getProductsByKeyword(category, keyword, page); // 초기화된 상태로 상품 불러오기
			}

			// 중복 방지
			function bindSearchEvents() {
			    $('#searchButton').off().on('click', function() {
			        executeSearch();
			    });

			    $('#searchInput1').off().on('keypress', function(e) {
			        if (e.which === 13) { // Enter 키를 누르면
			            executeSearch();
			        }
			    });
			}

			
			// 카테고리 링크 클릭 시
	         $('.col-lg-11').on('click', '.allproduct-categorie a', function(e) {
		        e.preventDefault();
		        console.log("실행");
		        category = $(this).data('value');
		        keyword = "";
		        // AJAX 요청 보내기
		       if (type === "0") {
			        getProductsByCategory(category, page); // 일반 상품 가져오는 함수 호출
			    } else {
			        getSpecialProductsByCategory(category, page); // 특가 상품 가져오는 함수 호출
			    }
	   		 });
			
			
	      // 페이지 버튼 클릭 이벤트 핸들러 등록
	         $('#paginationContainer').on('click', 'a', function(e) {
	             e.preventDefault();
	             var page = $(this).data('value'); // 클릭된 페이지의 값을 가져옴
	             if (page === 'Prev' || page === 'Next') {
	                 // Prev 또는 Next 링크를 클릭한 경우
	                 page = $(this).attr('value');
	             }
	             if (type === "0" && keyword === "") {
	                 getProductsByCategory(category, page);
	             } else if (type === "0" && keyword !== "") {
	                 getProductsByKeyword(category, keyword, page); // 일반 상품 가져오는 함수 호출
	             } else if (type === "1" && keyword === "") {
	                 getSpecialProductsByCategory(category, page);
	             } else if (type === "1" && keyword !== "") {
	                 getSpecialProductsByKeyword(category, keyword, page); // 특가 상품 가져오는 함수 호출
	             }
	         });

			// 검색 실행 함수
			function executeSearch() {
				type = $('#searchType').val();
			    keyword = $('#searchInput1').val().trim();
				if(type === "0"){
			    getProductsByKeyword(category, keyword, 1);
				}else{
				getSpecialProductsByKeyword(category, keyword, 1);
				}
			
			}

			//일반상품 카테고리
			 function getProductsByCategory(category, page) {
		            var pageSize = 6; // 페이지당 아이템 수
		            $.ajax({
		                type: "GET",
		                url: "/getProductsByCategory",
		                data: {
		                    category: category,
		                    page: page,
		                    pageSize: pageSize
		                },
		                success: function(response) {
		                    updateProducts(response);
		                
		                },
		                
		                error: function(xhr, status, error) {
		                    console.error(error);
		                }
		            });
		        }
			// 검색한 단어로 일반상품 불러오기
			function getProductsByKeyword(category, keyword, page) {
			    var pageSize = 6;
			    
			    // AJAX 요청 보내기
			    $.ajax({
			        type: "GET",
			        url: "/searchProduct",
			        data: {
			            category: category,
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

			
			// 카테고리별 특가상품 불러오기
	        function getSpecialProductsByCategory(category, page) {
	            var pageSize = 6; // 페이지당 아이템 수
	            $.ajax({
	                type: "GET",
	                url: "/getSpecialProductsByCategory",
	                data: {
	                    category: category,
	                    page: page,
	                    pageSize: pageSize
	                },
	                success: function(response) {
	                    updateProducts(response);
	                },
	                error: function(xhr, status, error) {
	                    console.error(error);
	                }
	            });
	        }
			 //특가 상품
			function getSpecialProductsByKeyword(category, keyword, page) {
			    var pageSize = 6;
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
			    var productsContainer = $('.col-lg-11 .row');
			    productsContainer.empty(); // 기존 상품 목록 비우기
			    // 받아온 데이터를 페이지에 맞게 출력
			    $.each(response.products, function(index, product) {
			        // 상품 정보를 HTML로 생성하는 코드
			        var productHTML = '<div class="card" style="margin-left:1px; padding:0;">' +
			        '<div class="card-info">' +
			            '<div class="product-id" style="display: none;">' + product.product_id + '</div>' +
			            '<div class="product-name" style="display: none;">' + product.product_name + '</div>' +
			            '<div class="product-img" style="display: none;">' + product.product_img + '</div>' +
			            '<div class="product-price" style="display: none;">' + product.product_price + '</div>' +
			            '<div class="main-top" style="margin-left:10px;">' +
			            '<a style="display: block; margin-top:7px; color:#4d4c4c; font-weight:bold;">' + product.product_name + '</a>' + 
                        '<a style="display: block; font-size:15px;">' + product.product_price + '원' + '</a>' + 
			            '</div>' +
			            '<div class="main-top">' +
			            '<div class="special_product" style="font-size:13px; color:white; background-color: ' + (product.special_product ? 'orange' : 'green') + '; text-align: center;">' + (product.special_product ? '특가' : '일반') + '</div>' +
			            '<button id="confirmButton3" class="btn plus-btn" style="font-size:15px;">추가</button>' + // 추가 버튼 추가
			            '</div>' +
			            '</div>' +
			            '</div>';
			        productsContainer.append(productHTML); // 새로운 상품을 기존의 상품 목록에 추가
			    });
			    // 페이징 버튼 업데이트
			    createPaginationButtons(response.pageInfo);
	            drawCategories();
			    bindSearchEvents();
			}

			// 페이지 버튼 생성 함수
			function createPaginationButtons(pageInfo) {
			    var paginationContainer = $('#paginationContainer');
			    paginationContainer.empty(); // 기존 페이지 버튼 제거
			    var paginationHTML = '<div class="col-auto" style="margin-top:-30px; margin-left:-25px">' +
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
			        '</nav>' +
			        '</div>';

			    paginationContainer.append(paginationHTML);

			}

			// 검생창 생성 함수
			function initializeSearchField() {
				 $('.col-lg-11 .input-group').remove();
				 var inputGroupHTML = `
				        <div class="input-group mb-3 search-field" style="margin-left:-3px;">
				            <select class="custom-select" id="searchType">
				                <option value=0>일반</option>
				                <option value=1>특가</option>
				            </select>
				            <input type="text" class="form-control"  placeholder="상품 검색" id="searchInput1">
				            <div class="input-group-append">
				                <button class="btn btn-outline-secondary" type="button" id="searchButton">검색</button>
				            </div>
				        </div>`;
				    // 새로운 입력 필드 추가
				    $('.col-lg-11').prepend(inputGroupHTML);

			}
			
			$('#all').on('click', function(e) {
			    e.preventDefault();
			    category = ""; // 전체를 선택하면 category를 빈 문자열로 설정
			    getProductsByCategory(category, page); // getProductsByCategory 함수 호출
			});
			 
			 // 카테고리를 그리는 함수
	        function drawCategories() {
	            $('.allproduct-categorie').remove();

	            var categoryHTML = `
	                <div style="text-align: center; margin-top:5px; margin-bottom:10px;" class="allproduct-categorie">     
	                    <div class="list-unstyled">
	                        <div class="d-flex justify-content-center product-topcategory" style="margin: 0 -15px;">
	                            <div class="row">
	                                <div class="col-sm-12">
	                                    <a href="#" data-value=""><i class="fas fa-apple-alt me-2"></i>전체</a>
	                                    <span>|</span>
	                                    <a href="#" data-value="가공 식품"><i class="fas fa-apple-alt me-2"></i>가공 식품</a>
	                                    <span>|</span>
	                                    <a href="#" data-value="야채"><i class="fas fa-apple-alt me-2"></i>야채</a>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="d-flex justify-content-center product-topcategory" style="margin: 0 -15px;">
	                            <div class="row">
	                                <div class="col-sm-12">
	                                    <a href="#" data-value="과일"><i class="fas fa-apple-alt me-2"></i>과일</a>
	                                    <span>|</span>
	                                    <a href="#" data-value="육류/생선"><i class="fas fa-apple-alt me-2"></i>육류/생선</a>
	                                    <span>|</span>
	                                    <a href="#" data-value="향신료"><i class="fas fa-apple-alt me-2"></i>향신료</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>`;
	            $('.col-lg-11').prepend(categoryHTML);  // 카테고리를 컨테이너에 추가
	        }
			 
			// 저장된 레시피 제품들의 배열
			  	var recipeProducts = [];
			    var recipeItems = [];
			    var recipeproducAlltList = ${recipeproductListJson}; // JSON 형식의 문자열로 전달된 recipeproductList
			    if (recipeproducAlltList && recipeproducAlltList.length > 0) {
			        // recipeproductList의 각 요소를 순회하면서 recipeProducts 배열에 저장
			        recipeproducAlltList.forEach(function(RecipeAndProductDTO) {
			            // recipeProduct를 JavaScript 객체로 변환하여 recipeProducts 배열에 추가
			            var recipeProduct = {
			                product_id: RecipeAndProductDTO.product_id,
			                product_quantity: RecipeAndProductDTO.product_quantity
			            };
			            recipeProducts.push(recipeProduct);
			           
			            // recipeItem을 생성하여 recipeItems 배열에 추가
			            var recipeItem = {
			                product_name: RecipeAndProductDTO.product_name,
			                product_quantity: RecipeAndProductDTO.product_quantity,
			                product_img: RecipeAndProductDTO.product_img,
			                product_price : RecipeAndProductDTO.product_price,
			                special_product : RecipeAndProductDTO.special_product
			            };
			            
			            
			            recipeItems.push(recipeItem);
			            renderProductList();
			            
			        });
			    }

			    //debugger;
			     // 데이터 변수에 저장
			   function addProduct(selectedProductName, selectedProductId, selectedProductImg, selectedProductPrice, selectedProductSpecial) {	    	
				    var product_id = selectedProductId;
				    var product_name = selectedProductName;
				    var product_quantity = 1;
				    var product_img = selectedProductImg;
				    var product_price = selectedProductPrice;
				    var special_product = selectedProductSpecial;
	
				
				    // 전송할 데이터
				    var recipeProduct = {
				        product_id: product_id,
				        product_quantity: product_quantity
				    };
				
				   
				
				    // 출력용
				    var recipeItem = {
				        product_name: product_name,
				        product_quantity: product_quantity,
				        product_img: product_img,
				        product_price: product_price,
				        special_product : special_product
				    };

				    recipeItems.push(recipeItem);
				    recipeProducts.push(recipeProduct);
				    renderProductList();
				}

			    // 레시피 재료 삭제
			    function removeProduct(index) {
			        recipeProducts.splice(index, 1); // 전송할 데이터 삭제
			        recipeItems.splice(index, 1); // 출력용 재료 삭제
			        renderProductList();
			    }

			    function sendProducts() {
			        if (recipeProducts.length === 0) {
			            alert('빈칸에 입력해주세요');
			            return;
			        }

			        var isEmpty = false;
			        recipeProducts.forEach(function(product) {
			            if (!product.product_quantity || !product.product_id || !product.product_quantity) {
			                // 빈 값이 하나라도 있으면 isEmpty를 true로 설정
			                isEmpty = true;
			                return; // 반복문 종료
			            }
			        });

			        if (isEmpty) {
			            alert('빈칸에 입력해주세요');
			            return;
			        }

			        var productListString = JSON.stringify(recipeProducts); 
			        window.location.href = '/insertCart?cartProducts=' + encodeURIComponent(productListString);

			    }

			 // 제품 목록을 출력하는 함수
			    function renderRecipeItems() {
			        var recipeItemsList = document.getElementById('recipeItemsList');
			        recipeItemsList.innerHTML = ''; // 기존 목록 초기화

			        // recipeItems 배열을 순회하면서 각 제품의 정보를 출력
			        recipeItems.forEach(function(item) {
			            // 각 제품을 나타내는 요소 생성
			            var listItem = document.createElement('li');
			            listItem.style.marginBottom = '4px';
			            listItem.style.fontSize = '20px';

			            // 제품 이름 출력
			            var nameElement = document.createElement('span');
			            nameElement.textContent = item.product_name;
			            listItem.appendChild(nameElement);

			            // 제품 수량 출력
			            var quantityElement = document.createElement('span');
			            quantityElement.textContent = ' ' + 'X' + ' ' + item.product_quantity  + '개';
			            listItem.appendChild(quantityElement);

			            // 제품 가격 출력
			            var priceElement = document.createElement('span');
			            priceElement.textContent = (item.product_price * item.product_quantity) + '원';
			            priceElement.style.float = 'right'; // 오른쪽으로 부유(floating)
			            listItem.appendChild(priceElement);

			            // 리스트에 각 제품 요소 추가
			            recipeItemsList.appendChild(listItem);
			        });
			        // 총 가격 출력
			        var totalPriceElement = document.createElement('hr');
			        totalPriceElement.style.marginTop = '130px'; // 위쪽 여백 추가
			        recipeItemsList.appendChild(totalPriceElement);

			        var totalTextElement = document.createElement('span');
			        totalTextElement.textContent = '전체 금액: ';

			        var totalPriceValueElement = document.createElement('span');
			        var totalPrice = calculateTotalPrice(); // 총 가격 계산 함수 호출
			        totalPriceValueElement.textContent = totalPrice + '원';
			        totalPriceValueElement.style.float = 'right'; // 오른쪽으로 부유(floating)
					
			        totalTextElement.style.fontSize = '20px'; // 폰트 크기 설정
			        totalPriceValueElement.style.fontSize = '20px'; // 폰트 크기 설정
			        recipeItemsList.appendChild(totalTextElement);
			        recipeItemsList.appendChild(totalPriceValueElement);
			    }

			    // 총 가격 계산 함수
			    function calculateTotalPrice() {
			        var totalPrice = 0;
			        recipeItems.forEach(function(item) {
			            totalPrice += item.product_price * item.product_quantity;
			        });
			        return totalPrice;
			    }
			    

			    // renderRecipeItems 함수 호출하여 제품 목록 출력
			    renderRecipeItems();
			    
			    
			    function renderProductList() {
			    
			        var productList = document.getElementById('productList');
			        productList.innerHTML = '';
			        
			        recipeItems.forEach((product, index) => {
			            var productListItem = document.createElement('div');
			            productListItem.style.width = '200px'; // 너비 설정
			            productListItem.style.height = '300px'; // 너비 설정
			            productListItem.style.textAlign = 'left'; // 텍스트 가운데 정렬
			            productListItem.style.margin = '15px';
			            productListItem.style.position = 'relative';

			        
			            var product_name = product.product_name; // 상품 이름
			            var product_quantity = product.product_quantity; // 상품 수량
			            var product_img = product.product_img; // 상품 이미지
			        
			            // 이미지 요소 생성 및 설정 (맨 위에 위치)
			            
			            var removeButton = document.createElement('div');
			            removeButton.style.position = 'absolute'; // 절대 위치 설정
			            removeButton.style.top = '1px'; // 위쪽 여백 설정
			            removeButton.style.right = '1px'; // 오른쪽 여백을 부모 요소의 오른쪽 끝에 위치하도록 설정
			            removeButton.style.marginRight = '-12px'; // 오른쪽 여백을 부모 요소의 오른쪽 끝에 위치하도록 설정
			            removeButton.style.color = 'white'; // 글자색 설정
			            removeButton.style.cursor = 'pointer'; // 커서 모양 변경
			            removeButton.textContent = 'X'; // 텍스트 설정
			            removeButton.style.padding = '3px'; // 패딩 설정
			            removeButton.style.backgroundColor = 'black'; // 패딩 설정


			            removeButton.onclick = function() {
			                removeProduct(index);
			            };
			            productListItem.insertBefore(removeButton, productListItem.firstChild);
			            
			            var imgElement = document.createElement('img');
			            imgElement.setAttribute('src', product_img); // 이미지 URL 설정
			            imgElement.setAttribute('alt', product_name); // 대체 텍스트 설정
			            imgElement.setAttribute('width', '200px'); // 이미지 너비 설정
			            imgElement.setAttribute('height', '200px'); // 이미지 높이 설정
			            productListItem.appendChild(imgElement);
			        
			            var productType = product.special_product;
			            var productTypeText = ''; // 제품 유형에 따른 텍스트 변수

			            if (productType === 1) {
			                productTypeText = '특가'; // productType이 1이면 "특가"
			            } else{
			            productTypeText = '일반'; // productType이 0이면 "일반"
			            }
			            var productTypeElement = document.createElement('div');
			            productTypeElement.textContent = productTypeText;
			            productTypeElement.style.color = 'white';
			            productTypeElement.style.borderRadius = '0.2rem';
			            productTypeElement.style.width = '40px';
			            productTypeElement.style.textAlign = 'center';
			            productTypeElement.style.marginTop = '10px';
			            productTypeElement.style.height = '25px';
			            if (productType === 1) {
			                productTypeElement.style.backgroundColor = 'orange'; // productType이 1이면 초록색 배경
			            } else{
			                productTypeElement.style.backgroundColor = 'green'; // productType이 0이면 주황색 배경
						}
			            productListItem.appendChild(productTypeElement);

			        
			            // 텍스트 요소 생성 및 설정 (상품 이름)
			            var nameTextElement = document.createElement('div');
			            nameTextElement.textContent = product_name;
			            nameTextElement.style.fontSize = '13px'; // 폰트 크기 설정
			            nameTextElement.style.fontColor = '#778899'; // 폰트 크기 설정

			            productListItem.appendChild(nameTextElement);

			         // 가격 텍스트 요소 생성 및 설정
						var priceTextElement = document.createElement('span');
						var priceValue = product.product_quantity * product.product_price; // 가격 계산
						priceTextElement.innerHTML = priceValue + '<span style="font-size: 13px; color: #333;">원</span>'; // HTML 요소와 함께 텍스트 설정
						priceTextElement.style.fontWeight = 'bold'; // 폰트 굵기 설정
						priceTextElement.style.fontSize = '25px'; // 폰트 크기 설정
						priceTextElement.style.marginTop = '100px'; // 상단 여백 설정
						productListItem.appendChild(priceTextElement);
			            
			            
			            var quantityContainer = document.createElement('div');
			            quantityContainer.style.display = 'flex'; // Flexbox 레이아웃 설정
			            productListItem.appendChild(quantityContainer);

			            var quantityInput = document.createElement('input');
			            quantityInput.setAttribute('type', 'number'); // 입력 필드 타입을 숫자로 설정
			            quantityInput.setAttribute('value', product_quantity); // 기본 값 설정
			            quantityInput.setAttribute('min', '0'); // 최소 값 설정
			            quantityInput.setAttribute('step', '1'); // 증가/감소 단위 설정
			            quantityInput.style.width = '50px'; // 입력 필드 너비 설정
			            quantityInput.style.textAlign = 'center'; // 텍스트 가운데 정렬
			            quantityInput.style.border = '1px solid #ccc'; // 테두리 추가
			            quantityInput.style.borderRadius = '5px'; // 둥근 모서리 설정
			            quantityInput.addEventListener('input', function() {
			                var newQuantity = parseInt(this.value); // 입력된 수량 값 가져오기
			                if (!isNaN(newQuantity) && newQuantity >= 0) { // 유효한 숫자인지 확인
			                    // recipeProducts 배열의 해당 인덱스에 있는 product_quantity 업데이트
			                    recipeProducts[index].product_quantity = newQuantity;
			                    // recipeItems 배열의 해당 인덱스에 있는 product_quantity 업데이트
			                    recipeItems[index].product_quantity = newQuantity;
			                    // 가격 텍스트 업데이트
			                    priceTextElement.innerHTML = (newQuantity * product.product_price) + '<span style="font-size: 13px; color: #333;">원</span>';
			                    clearRecipeItemsList();
			                    renderRecipeItems();
			                }
			            });
			            quantityContainer.appendChild(quantityInput); // 부모 요소에 추가
			        
			          
			            // 행에 상품 추가
			            productList.appendChild(productListItem);
			        });

			 
			     // "추가" 버튼 추가
			        var addButton = document.createElement('button');
			        addButton.textContent = '+';
			        addButton.style.fontWeight = 'bold'; // 폰트 굵기를 설정합니다.
			        addButton.style.fontSize = '50px'; // 폰트 크기 설정
			        addButton.classList.add('btn', 'btn-sm', 'btn-primary', 'btn-add'); // 추가 버튼 클래스 추가 및 크기 설정
			        addButton.style.width = '100px'; // 버튼의 너비를 조정하여 짧게 만듭니다.
			        addButton.style.height = '100px'; // 버튼의 높이를 조정하여 정사각형 모양으로 만듭니다.
			        addButton.style.marginTop = '80px'; // 버튼의 높이를 조정하여 정사각형 모양으로 만듭니다.
			        addButton.style.marginLeft = '65px'; // 버튼의 높이를 조정하여 정사각형 모양으로 만듭니다.
	
			        addButton.onclick = function() {
			        	 openModal();
			        };
			        productList.appendChild(addButton);
			    }

			    

			    
			    $(document).on('click', '.plus-btn', function() {
			        var selectedProductName = $(this).closest('.card-info').find('.product-name').text(); // 선택된 제품명
			        var selectedProductId = $(this).closest('.card-info').find('.product-id').text();
			        var selectedProductImg = $(this).closest('.card-info').find('.product-img').text(); // 선택된 제품 이미지 URL
			        var selectedProductPrice = $(this).closest('.card-info').find('.product-price').text(); // 선택된 제품 가격 정보
			        var specialProductText = $(this).closest('.card-info').find('.special_product').text(); // 특별 상품 텍스트 가져오기
			        var selectedProductSpecial = (specialProductText === '특가') ? 1 : 0; // 특별 상품 여부를 1 또는 0으로 설정

			        addProduct(selectedProductName, selectedProductId, selectedProductImg, selectedProductPrice, selectedProductSpecial);
			        clearRecipeItemsList();
			        renderRecipeItems();
			        closeModal();
			    });

			 // 장바구니로 아이템 보내기
			    document.getElementById('sendtoCart').addEventListener('click', function() {
				    sendProducts();
				});
			</script>
</body>
			<!-- footer start -->
			<%@ include file="../footer.jsp"%>
			<!-- footer End -->
</html>