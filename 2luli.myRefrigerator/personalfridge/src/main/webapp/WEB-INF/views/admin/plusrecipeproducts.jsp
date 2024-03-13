<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>레시피 재료 추가하기</title>
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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Navbar start -->
    <%@ include file="../header.jsp" %>
    <!-- Navbar End -->

    <style>
   	   	.card{
   	   	margin-top:10px;
   	   	}
	    .card-info {
	        font-size: 20px;
	        display: flex;
	        justify-content: space-between; 
	        color:black;
	        
	    }
        /* Dropdown styles */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
            z-index: 1;
        }

        .dropdown-content div {
            cursor: pointer;
        }

        .dropdown-content div:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .arrow-icon {
            position: absolute;
            top: 40%;
            transform: translateY(-50%);
            right: 10px;
            cursor: pointer;
        }
        
        /* 모달 스타일 */
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
		  margin: 10% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 400px;
		  height:680px;
		}
		
		.close {
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}

    </style>
</head>

<body>
    <!-- Slidebar start -->
    <%@ include file="adminslidebar.jsp" %>
    <!-- Slidebar End -->

    <!-- 레시피 추가 박스 -->
    <div class="row justify-content-center" style="margin-top: 200px; width: 80%; margin-left: 190px;">
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">레시피 재료 등록</h6>
                </div>
  
                <!-- Card Body -->
                <div class="card-body">   
                    <input id="recipe_id" value="${onerecipe.recipe_id}" class="form-control mb-3" readonly>
        				<div style="display: flex; flex-direction: row; margin-bottom:12px;">
						    <button id="openModalButton" class="btn btn-primary">모달 열기</button>
						    <input type="text" id="selectedIngredient" class="form-control" style="margin-left:5px;width: 180px;" placeholder="레시피 재료" readonly>
						</div>
                    <input type="text" id="product_quantity" placeholder="수량" class="form-control mb-3">
                    <!-- 확인 버튼 -->
                    <button id="confirmButton" class="btn btn-primary">등록</button>
                    <button id="confirmButton2" class="btn btn-danger">추가</button>
                    <!-- 추가된 제품 목록 -->
                    <ul id="productList"></ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 레시피 추가 박스 끝 -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    	<!-- 페이지당 아이템 수와 현재 페이지 설정 -->
		<c:set var="pageSize" value="12" />
		<c:set var="currentPage" value="${not empty param.page ? param.page : 1}" />
    <div class="col-lg-11" style="margin-left:20px;">
       <div class="row justify-content-center">
 		 <c:forEach var="product" items="${productlist}">
 		<div class="card">
 		 <div class="card-info">
                     <div class="product-id" style="display: none;">${product.product_id}</div>
       				<div class="product-name" style="display: none;">${product.product_name}</div>
                        <a>${product.product_name}</a>
                    </div>
                </div>
 		 </c:forEach>
          </div>
          <div class="col-12">
                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer" >
                    <!-- 총 페이지 수 계산 -->
                    <c:set var="totalPages" value="${pageRequestDTO.totalPages}" />
                    <!-- 페이지 링크 생성 -->
                    <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                        <a href="#" class="rounded ${pageNumber == currentPage ? 'active' : ''}">${pageNumber}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
  </div>
</div>
    <!-- footer start -->
    <%@ include file="../footer.jsp" %>
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

    var category ="";
    var keyword = "";
    var page = 1;
    initializeSearchField();
    bindSearchEvents();
    
    // openModalButton에 클릭 이벤트 연결
    document.getElementById('openModalButton').onclick = openModal;

    // 모달 닫기 버튼에 클릭 이벤트 연결
    document.getElementsByClassName('close')[0].onclick = closeModal;
    
 // 모달 열기 함수
    function openModal() {
        document.getElementById('myModal').style.display = 'block';
        getProductsByKeyword(category, keyword, page);
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

	
	//중복 방지
    function bindSearchEvents() {
    	
    	 
        $('#searchButton').off().on('click', function() {
            console.log("실행");
            executeSearch();
        });

        $('#searchInput1').off().on('keypress', function(e) {
            if (e.which === 13) { // Enter 키를 누르면
                executeSearch();
            }
        });
    }

		$('#paginationContainer').on('click', 'a', function(e) {
			 e.preventDefault();
			 getProductsByKeyword(category, keyword, page);
		
		});
		
		
		// 페이지 버튼 클릭 이벤트 핸들러 등록
		$('#paginationContainer').on('click', 'a', function(e) {
		    e.preventDefault();
		    page = $(this).text().trim(); // 클릭된 페이지 번호 가져오기
		    getProductsByKeyword(category, keyword, page);
		
		});
		
		// 검색 실행 함수
		function executeSearch() {
		    keyword = $('#searchInput1').val().trim();
		    getProductsByKeyword(category, keyword, 1);
		}
		
		//검색한 단어로 상품 불러오기
		function getProductsByKeyword(category, keyword, page) {
		
		    var pageSize = 10;
		    // AJAX 요청 보내기
		    $.ajax({
		        type: "GET",
		        url: "/searchProduct",
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
			    var productHTML = '<div class="card">' +
			        '<div class="card-info">' +
			        '<div class="product-id" style="display: none;">' + product.product_id + '</div>' +
			        '<div class="product-name" style="display: none;">' + product.product_name + '</div>' +
			        '<a style="margin-top:4px;">' + product.product_name + '</a>' + 
			        '<button id="confirmButton3" class="btn plus-btn"style="font-size:15px;">추가</button>' + // 추가 버튼 추가
			        '</div>' +
			        '</div>';
			    productsContainer.append(productHTML); // 새로운 상품을 기존의 상품 목록에 추가
			});
		    // 페이징 버튼 업데이트
		    createPaginationButtons(response.pageRequestDTO.totalPages, response.pageRequestDTO.currentPage);
		    bindSearchEvents();
		}
		
		// 페이지 버튼 생성 함수
		function createPaginationButtons(totalPages, currentPage) {
		    var paginationContainer = $('#paginationContainer');
		    paginationContainer.empty(); // 기존 페이지 버튼 제거
		    // 페이지 수만큼 버튼 생성
		    for (var i = 1; i <= totalPages; i++) {
		        var button = $('<a href="#" class="rounded" style="margin-top:-30px;" ' + (i == currentPage ? 'active' : '') + '">' + i + '</a>');
		        paginationContainer.append(button);
		    }
		}
		
		//검생창 생성 함수
		function initializeSearchField() {
		    var inputGroupHTML = `
		        <div class="input-group mb-3">
		            <input type="text" class="form-control" style="margin-botto:5px;" placeholder="상품 검색" id="searchInput1">
		            <div class="input-group-append">
		                <button class="btn btn-outline-secondary" type="button" id="searchButton">검색</button>
		            </div>
		        </div>`;
		    // 새로운 입력 필드 추가
		    $('.col-lg-11').prepend(inputGroupHTML);
		   
		}

// 저장된 레시피 제품들의 배열
        var recipeProducts = [];
        var recipeItems = [];
		//데이터 변수에 저장
        function addProduct() {
            var recipe_id = document.getElementById('recipe_id').value;
            var product_id = $('#selectedIngredient').data('product-id');
            var product_name = $('#selectedIngredient').val();
            var product_quantity = document.getElementById('product_quantity').value;

			//전송할 데이터
            var recipeProduct = {
            	recipe_id : recipe_id,
                product_id : product_id,
                product_quantity : product_quantity
            };
            //출력용
            var recipeItem = {
                product_name : product_name,
                product_quantity : product_quantity
            };
           
            recipeItems.push(recipeItem);
            recipeProducts.push(recipeProduct);
            renderProductList();
			//완료되면 초기화
            document.getElementById('product_quantity').value = '';
            document.getElementById('selectedIngredient').value = '';
        }
        
        //레시피 재료 삭제
        function removeProduct(index) {
            recipeProducts.splice(index, 1); // 전송할 데이터 삭제
            recipeItems.splice(index, 1); //출력용 재료 삭제
            renderProductList(); 
        }
        function sendProducts() {
        	 if (recipeProducts.length === 0) {
        	        alert('빈칸에 입력해주세요');
        	        return;
        	    }

        	    var isEmpty = false;
        	    recipeProducts.forEach(function(product) {
        	        if (!product.recipe_id || !product.product_id || !product.product_quantity) {
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
            console.log(productListString);
            window.location.href = '/RecipeProductPlus?recipeProducts=' + encodeURIComponent(productListString);
        }
        	
        	
		
        function renderProductList() {
            var productList = document.getElementById('productList');
            productList.innerHTML = ''; 

            // 재료 선택될때마다 이름과 수량 출력
            recipeItems.forEach((product, index) => {
                var productListItem = document.createElement('li');
                
                var product_name = product.product_name;
                var product_quantity = product.product_quantity;
                productListItem.innerText = product_name + ' (' + product_quantity + ')';
                var removeButton = document.createElement('button');
                removeButton.textContent = 'X';
                removeButton.onclick = function() {
                    removeProduct(index);
                };

                productListItem.appendChild(removeButton);
                productList.appendChild(productListItem);
            });
        }
        
        $(document).on('click', '#confirmButton3', function() {
            var selectedProductName = $(this).siblings('.product-name').text(); // 선택된 제품명
            var selectedProductId = $(this).siblings('.product-id').text();
            console.log("실행");
            selectItem(selectedProductName, selectedProductId);
        });
        function selectItem(selectedProductName,selectedProductId) {
            
            // 선택된 제품명과 ID를 선택된 재료 입력 필드에 설정
            $('#selectedIngredient').val(selectedProductName);
            $('#selectedIngredient').attr('data-product-id', selectedProductId);
            console.log(selectedProductName);
            console.log(selectedProductId);

            // 모달 닫기
            closeModal();
        }
        // 버튼 클릭 이벤트
        document.getElementById('confirmButton').addEventListener('click', sendProducts);
        document.getElementById('confirmButton2').addEventListener('click', addProduct);
        
    </script>

</body>
</html>