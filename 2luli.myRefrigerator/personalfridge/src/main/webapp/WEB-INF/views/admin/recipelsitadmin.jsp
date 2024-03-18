<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
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
		  <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
        
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    	<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
     <!-- Navbar start -->
       <%@ include file="../header.jsp" %>
        <!-- Navbar End -->
        <style>  
	    .card {
	        width: 400px; /* 카드의 너비 조정 */
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        margin-left:10px;
	        padding: 10px;
	        margin-bottom: 10px;
	        background-color: #fff; /* 배경색 */
	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 */
	        position: relative; /* 부모 요소 기준으로 위치 지정 */
	    }
	
	    .card-info {
	        font-size: 23px;
	        display: flex;
	        margin-bottom: 5px;
	        justify-content: space-between; 
	        color:black;
	    }
	
	    .card-details {
	        display: flex;
	        justify-content: space-between; 
	        color: #666; /* 텍스트 색상 */
	    }
	    
		
		.regular-product {
		    background-color: green; /* 일반 상품 배경색: 파란색 */
		    color: white; /* 글자 색상: 흰색 */
		    padding: 5px 10px; /* 패딩 설정 */
		    font-size: 14px; /* 글자 크기 설정 */
		    border-radius: 5px; /* 테두리 둥글게 만들기 */
		    display: inline-block; /* 인라인 블록 요소로 표시 */
		    width: fit-content; /* 내용에 맞게 너비 조정 */
		    margin-right: 10px; /* 오른쪽 여백 추가 */
		    margin-bottom:10px;
		}
		.card-head{
			
		}
		.cardbtn{
			position: absolute; /* 절대 위치 설정 */
		    top: 6px;
		    right: 3px;
		    font-size:14px;
		}
		.modal-container {
	         display: none;
	         position: fixed;
	         top: 50%;
	         left: 50%;
	         transform: translate(-50%, -50%);
	         background-color: rgba(255, 255, 255, 1); 
	         padding: 10px;
	         border-radius: 5px;
	         z-index: 9999;
	         color: black; 
	         box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
		}

		.modal-content {
		    text-align: center;
		    display: flex;
		    justify-content: center;
		}
		
		.button-container button {
		    margin: 0 5px; /* 버튼들 사이의 간격을 설정 */
		}
		
		.modal-button {
		    width: 100px;
		}
    </style>
    </head>

 <body>
  		<!-- Slidebar start -->
       <%@ include file="adminslidebar.jsp" %>
        <!-- Slidebar End -->
        


		<div class="col-lg-11">
       <div class="row justify-content-center" style="margin-top: 200px; width: 50%; margin-left: 490px; ">
           <c:forEach var="recipe" items="${recipelist}">
                <div class="card">
	                 <c:choose>
					    <c:when test="${recipe.recipe_category == '밥'}">
					        <div class="regular-product" style="background-color: green;">${recipe.recipe_category}</div>
					    </c:when>
					    <c:when test="${recipe.recipe_category == '국&찌개'}">
					        <div class="regular-product" style="background-color: orange;">${recipe.recipe_category}</div>
					    </c:when>
					    <c:when test="${recipe.recipe_category == '반찬'}">
					        <div class="regular-product" style="background-color: skyblue;">${recipe.recipe_category}</div>
					    </c:when>
					    <c:when test="${recipe.recipe_category == '후식'}">
					        <div class="regular-product" style="background-color: #D09AFF;">${recipe.recipe_category}</div>
					    </c:when>
					    <c:when test="${recipe.recipe_category == '일품'}">
					        <div class="regular-product" style="background-color: #fc6d6d;">${recipe.recipe_category}</div>
					    </c:when>
					    <c:otherwise>
					        <div class="regular-product">${recipe.recipe_category}</div>
					    </c:otherwise>
					</c:choose>
                    <div class="card-info">
                     <div class="recipe-id" style="display: none;">${recipe.recipe_id}</div>
       				<div class="recipe-name" style="display: none;">${recipe.recipe_name}</div>
                        <a>${recipe.recipe_name}</a>
                    </div>
                </div>
            </c:forEach>
            </div>
             <div class="col-12">
                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer" style="margin-left:130px;" >
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
            </div>
        </div>
    <!-- 상품 삭제 모달 창 -->
	    <div id="modalContainer" class="modal-container">
		    <div class="modal-content">
		        <p>레시피를 정말 삭제하시겠습니까?</p>
		        <p>레시피 이름: <span class="recipe-name"></span></p>
		        <div class="button-container">
			        <button id="confirmDeleteButton" class="modal-button" style="background-color: red; color: white;">네</button>
			        <button id="cancelDeleteButton" class="modal-button" style="background-color: green; color: white;">아니오</button>
			    </div>
			  </div>
		</div>
   
   
			<!-- 수정 모달 -->
<div class="modal fade" id="editRecipeModal" tabindex="-1" role="dialog" aria-labelledby="editRecipeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="editRecipeModalLabel" style="margin-left:150px;">레시피 정보 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm" action="/RecipeUpdateAdmin" method="post">
                    <div class="form-group">
                        <input type="hidden" id="recipe_id" name="recipe_id">
                        <label for="recipe_name">레시피 이름</label>
                        <input type="text" class="form-control" id="recipe_name" name="recipe_name">
                    </div>
                    <div class="form-group">
                        <label for="recipe_content">레시피 내용</label>
                        <textarea class="form-control" id="recipe_content" name="recipe_content" rows="6" cols="50"></textarea> <!-- 조정된 크기 -->
                    </div>
                    <div class="form-group">
                        <label for="ingredient">재료</label>
                        <input type="text" class="form-control" id="ingredient" name="ingredient">
                    </div>
					<div class="form-group" style="text-align: center;">
					    <label for="recipe_category">카테고리</label>
					    <select id="recipe_category_select" class="form-control mb-3" name="recipe_category" style="text-align: center;">
					        <option value="밥">밥</option>
					        <option value="국&찌개">국&찌개</option>
					        <option value="반찬">반찬</option>
					        <option value="후식">후식</option>
					        <option value="일품">일품</option>
					    </select>
					</div>
                    <div class="form-group">
                        <label for="recipe_img">레시피 이미지</label>
                        <input type="text" class="form-control" id="recipe_img" name="recipe_img">
                    </div>
                    <div class="form-group">
                        <label for="nutrition_facts">영양 성분</label>
                        <input type="text" class="form-control" id="nutrition_facts" name="nutrition_facts">
                    </div>
                    <button type="submit" class="btn btn-primary">저장</button>
                </form>
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
   $(document).ready(function() {
	    var category ="";
        var keyword = "";
        var page = 1;
        // 수정/삭제버튼 생성
        addEditAndDeleteButtons();
        //검생 창 생성
        initializeSearchField();
        //카테고리 생성
        drawCategories();
        //검색 이벤트 생성
        bindSearchEvents();

     // 검색 버튼 클릭 및 엔터 키 이벤트를 바인딩
         function bindSearchEvents() {
            $('#searchButton').on('click', function() {
                executeSearch();
            });

            $('#searchInput1').on('keypress', function(e) {
                if (e.which === 13) { // Enter 키를 누르면
                    executeSearch();
                }
            });
        }

        // 검색 실행 함수
        function executeSearch() {
            keyword = $('#searchInput1').val().trim();
            getRecipeByKeyword(category, keyword, 1);
        }
			
			
        // 제품 수정 모달 열기
        function openRecipeModal(recipeId) {
            // AJAX 요청 보내기
            $.ajax({
                type: "GET",
                url: "/findrecipe",
                data: {
                    recipe_id: recipeId
                },
                success: function(response) {
                    // 반환된 데이터를 모달에 채워 넣기
                    $('#recipe_id').val(response.recipe_id); // 상품 이름 입력 필드에 값 설정
                    $('#recipe_name').val(response.recipe_name); // 상품 이름 입력 필드에 값 설정
                    $('#recipe_content').val(response.recipe_content); // 내용 입력 필드에 값 설정
                    $('#ingredient').val(response.ingredient); // 수량 입력 필드에 값 설정
                    $('#recipe_category_select').val(response.recipe_category); // 카테고리 선택 입력 필드에 값 설정
                    $('#recipe_img').val(response.recipe_img); // 상품 이미지 입력 필드에 값 설정
                    $('#nutrition_facts').val(response.nutrition_facts); // 유통 기한 입력 필드에 값 설정

                    // 수정 모달 열기
                    $('#editRecipeModal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }
        // 수정 모달 닫기
        $('#editRecipeModal .close').click(function() {
            $('#editRecipeModal').modal('hide'); // 모달 닫기
        });
        
        $('#editForm').submit(function(event) {
            // 폼 기본 동작 방지
            event.preventDefault();
		
            // 폼 데이터를 JSON 형식으로 직렬화
            var formData = {
                "recipe_id": $('#recipe_id').val(),
                "recipe_name": $('#recipe_name').val(),
                "recipe_content": $('#recipe_content').val(),
                "ingredient": $('#ingredient').val(),
                "recipe_category": $('#recipe_category_select').val(), 
                "recipe_img": $('#recipe_img').val(),
                "nutrition_facts": $('#nutrition_facts').val(),
            };
			console.log(formData);
            // AJAX 요청 보내기
            $.ajax({
                type: 'POST',
                url: '/RecipeUpdateAdmin',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    // 성공적으로 처리된 경우에 대한 동작 수행
                    location.reload();
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리
                    console.error("오류 발생: " + error);
                }
            });
        });
   
        
        // 카테고리 링크 클릭 시
         $('.col-lg-11').on('click', '.Recipe-category a', function(e) {
	        e.preventDefault();
	        category = $(this).text().trim();
	        keyword = "";
	        $('#paginationContainer').empty(); // 페이지 버튼 컨테이너 비우기
	        // AJAX 요청 보내기
	        getRecipeByCategory(category, 1); // 페이지 번호 1로 초기화
   		 });

        // 페이지 버튼 클릭 이벤트 핸들러 등록
        $('#paginationContainer').on('click', 'a', function(e) {
            e.preventDefault();
            page = $(this).data('value'); // 클릭된 링크의 data-value 속성 값을 가져오기
            if (page === 'Prev' || page === 'Next') {
 		        // Prev 또는 Next 링크를 클릭한 경우
 		        page = $(this).attr('value');
 		    } 
            if (category === "" && keyword === "") {
            	getRecipeAll(page); // 선택된 카테고리가 없으면 전체 상품 불러오기
            } else if(keyword !== ""){
            	getRecipeByKeyword(category, keyword, page);
	        } else {
	        	getRecipeByCategory(category, page);
	        }
        });

        // 페이지 로드 함수 - 선택된 카테고리 없이 모든 상품 불러오기
        function getRecipeAll(page) {
            var pageSize = 8; // 페이지당 아이템 수
            $.ajax({
                type: "GET",
                url: "/getRecipeByCategory",
                data: {
                    category: "",
                    page: page,
                    pageSize: pageSize
                },
                success: function(response) {
                	updateRecipes(response);
                  
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }

        // 카테고리별 상품 불러오기
        function getRecipeByCategory(category, page) {
            var pageSize = 8; // 페이지당 아이템 수
            $.ajax({
                type: "GET",
                url: "/getRecipeByCategory",
                data: {
                    category: category,
                    page: page,
                    pageSize: pageSize
                },
                success: function(response) {
                	updateRecipes(response);
                
                },
                
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }
        
		//검색한 단어로 상품 불러오기
		function getRecipeByKeyword(category, keyword, page) {
		    var pageSize = 8;
		    // AJAX 요청 보내기
		    $.ajax({
		        type: "GET",
		        url: "/searchRecipe",
		        data: {
		        	category : category,
		            keyword: keyword,
		            page: page,
		            pageSize: pageSize
		        },
		        success: function(response) {
		        	updateRecipes(response);
                },
		        error: function(xhr, status, error) {
		            // 에러 처리 로직
		            console.error(error);
		        }
		    });
		}

        // 받아온 상품 정보를 업데이트하는 함수
        function updateRecipes(response) {
		    var recipesContainer = $('.col-lg-11 .row'); // 상품 목록 컨테이너 선택
		    recipesContainer.empty(); // 기존 상품 목록 비우기
		
		    // 받아온 데이터를 페이지에 맞게 출력
		    $.each(response.recipes, function(index, recipe) { // recipe로 수정
		        // 레시피 카테고리에 따라 HTML 생성
		        var recipeCategoryHTML = createRecipeHTML(recipe.recipe_category);
		
		        // 레시피 카드 HTML 생성
		        var recipeHTML = '<div class="card">' +
		            recipeCategoryHTML +
		            '<div class="card-info">' +
		            '<div class="recipe-id" style="display: none;">' + recipe.recipe_id + '</div>' +
		            '<div class="recipe-name" style="display: none;">' + recipe.recipe_name + '</div>' +
		            '<a>' + recipe.recipe_name + '</a>' +
		            '</div>' +
		            '</div>';
		        recipesContainer.append(recipeHTML); // 새로운 레시피를 기존의 레시피 목록에 추가
		    });
		
		    // 페이징 버튼 업데이트
		    $('#paginationContainer').empty();
		    createPaginationButtons(response.pageInfo); // 카테고리 다시 그리기
		    addEditAndDeleteButtons();
		    initializeSearchField()
		    drawCategories();
		    bindSearchEvents();
		} 
		
		function createRecipeHTML(recipeCategory) {
		    var backgroundColor;
		    switch (recipeCategory) {
		        case '밥':
		            backgroundColor = 'green';
		            break;
		        case '국&찌개':
		            backgroundColor = 'orange';
		            break;
		        case '반찬':
		            backgroundColor = 'skyblue';
		            break;
		        case '후식':
		            backgroundColor = '#D09AFF';
		            break;
		        case '일품':
		            backgroundColor = '#fc6d6d';
		            break;
		        default:
		            backgroundColor = ''; // Default background color
		    }
		    var html = '<div class="regular-product" style="background-color: ' + backgroundColor + ';">' + recipeCategory + '</div>';
		    return html;
		}
        
        // 페이지 버튼 생성 함수
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
                 '</nav>' +
                 '</div>';
             paginationContainer.append(paginationHTML);
         }
        
     // 수정과 삭제 버튼을 추가하는 함수
		 function addEditAndDeleteButtons() {
		    // 모든 card-info 요소에 대해 작업
		    $('.card-info').each(function() {
		        // 현재 요소에 새로운 버튼 추가
		        var ButtonsHTML = `
		            <div class="cardbtn">
		                <button class="btn btn-primary edit-recipe-btn" 
		                        style="width: fit-content;"
		                        data-toggle="modal"
		                        >수정</button>
		                <button class="btn btn-danger" 
		                        style="width: fit-content;">삭제</button>
		                        <button class="btn btn-warning edit-ingredients-btn" 
		                            style="width: fit-content;">재료 수정</button>
		            </div>`;
		        // 현재 요소의 내부에 새로운 버튼 추가
		        $(this).prepend(ButtonsHTML);
		    });
		
		    // 수정 버튼과 삭제 버튼에 대한 이벤트 리스너 추가
		    $('.edit-recipe-btn').click(function() {
		        var recipeId = $(this).closest('.card').find('.recipe-id').text();
		        console.log(recipeId);
		        openRecipeModal(recipeId);RecipePlus
		    });
		    
		    //레시피 재료 변경하기
		    $('.edit-ingredients-btn').click(function() {
		        var recipeId = $(this).closest('.card').find('.recipe-id').text();
		        console.log(recipeId);
		        window.location.href = '/RecipePlus?recipe_id=' + recipeId;
		    });
		
		    $('.btn-danger').click(function() {
		        var recipeId = $(this).closest('.card').find('.recipe-id').text();
		        var recipeName = $(this).closest('.card').find('.recipe-name').text();
		        // 삭제 모달을 표시하고 확인 버튼과 취소 버튼에 대한 이벤트 리스너 추가
		        var modalContainer = document.getElementById("modalContainer");
		        var confirmButton = document.getElementById("confirmDeleteButton");
		        var cancelButton = document.getElementById("cancelDeleteButton");
		        var modalContent = document.querySelector('.modal-content');
		        var modalRecipeName = modalContent.querySelector('.recipe-name');
		
		        // 모달 내용 설정
		        modalRecipeName.textContent = recipeName;
		        modalContainer.style.display = "block"; // 모달 열기
		        confirmButton.dataset.recipeId = recipeId; // 확인 버튼의 data-product-id 속성에 product_id 설정
		
		        cancelButton.onclick = function() {
		            modalContainer.style.display = "none";
		        }
		
		        confirmButton.onclick = function() {
		            var recipeId = confirmButton.dataset.recipeId; // 확인 버튼의 data-product-id 속성에서 product_id 가져오기
		            window.location.href = '/recipedeleteadmin/' + recipeId; // 해당 product_id를 사용하여 삭제 URL로 이동
		        }
		    });
		}
        

			
	
        // 카테고리를 그리는 함수
        function drawCategories() {
            var categoryHTML = `
                <div style="text-align: center; margin-bottom: 20px;">     
                    <h4>레시피 카테고리</h4>
                    <div class="list-unstyled allrecipe-categorie">
                        <div class="d-flex justify-content-center recipe-topcategory"style="margin: 0 -15px;">
                            <a href="/RecipeListAdmin" style="margin: 0 15px;"><i class="fas fa-utensils me-2"></i>모든 레시피</a>
                            <span>|</span>
                            <div class="d-flex justify-content-center Recipe-category">
                            <a href="#" style="margin: 0 15px;"><i class="fas fa-utensils me-2"></i>밥</a>
                            <span>|</span>
                            <a href="#" style="margin: 0 15px;"><i class="fas fa-utensils me-2"></i>국&찌개</a>
                            <span>|</span>
                            <a href="#" style="margin: 0 15px;"><i class="fas fa-utensils me-2"></i>반찬</a>
                            <span>|</span>
                            <a href="#" style="margin: 0 15px;"><i class="fas fa-utensils me-2"></i>후식</a>
                            <span>|</span>
                            <a href="#" style="margin: 0 15px;"><i class="fas fa-utensils me-2"></i>일품</a>
                        </div>
                      </div>
                    </div>	
                </div>`;
            $('.col-lg-11 .row').prepend(categoryHTML); // 카테고리를 컨테이너에 추가
        }
        //검생창 생성 함수
        function initializeSearchField() {
            var inputGroupHTML = `
                <div class="input-group mb-3">
                    <input type="text" class="form-control" style="margin-left:250px; max-width:300px;" placeholder="레시피 검색" id="searchInput1">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="searchButton">검색</button>
                    </div>
                </div>`;
            // 새로운 입력 필드 추가
            $('.col-lg-11 .row').prepend(inputGroupHTML);
           
        }
    });
 


   </script> 
</body>
</html>