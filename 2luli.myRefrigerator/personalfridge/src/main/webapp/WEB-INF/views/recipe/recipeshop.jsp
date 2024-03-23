<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       <%@ include file="../header.jsp" %>
        <!-- Navbar End -->
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
		<h1 class="text-center text-white display-6">이루리 요리책</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="mb-4">이루리 요리책</h1>
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
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>카테고리</h4>
										<ul class="list-unstyled fruite-categorie" style="font-size:20px;">
											<li>
												<div class="d-flex justify-content-between fruite-name" style="margin-top:15px;">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>밥</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name" style="margin-top:15px;">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>반찬</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name" style="margin-top:15px;">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>국&찌개</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name" style="margin-top:15px;">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>후식</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name" style="margin-top:15px;">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>일품</a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								
								
							</div>
						</div>
						<div class="col-lg-9">
							<div id="recipeContent" class="row g-4 justify-content-center">
								<!-- 반복 -->
								<c:forEach items="${recipelist}" var="RecipeDTO">
								    <div class="col-md-6 col-lg-6 col-xl-4">
								        <div class="rounded position-relative fruite-item">
								            <div class="fruite-img">
								                <img src="${RecipeDTO.recipe_img}" class="img-fluid w-100 rounded-top" alt="" style="width: 180px; height: 230px;">
								            </div>
								            <div class="position-absolute top-0 start-0 px-3 py-1 rounded"
								                 style="background-color: 
								                    <c:choose>
								                        <c:when test="${RecipeDTO.recipe_category eq '밥'}">
								                            green
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '국&찌개'}">
								                            orange
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '반찬'}">
								                            skyblue
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '후식'}">
								                            #D09AFF
								                        </c:when>
								                        <c:when test="${RecipeDTO.recipe_category eq '일품'}">
								                            #fc6d6d
								                        </c:when>
								                        <c:otherwise>
								                            white <!-- Default background color -->
								                        </c:otherwise>
								                    </c:choose>;
								                 color: white; /* Text color */
								                 top: 10px; left: 10px;">
								                ${RecipeDTO.recipe_category}
								            </div>
								            <div class="p-4 border border-secondary border-top-0 rounded-bottom">
								                <h6 class="text-center">${RecipeDTO.recipe_name}</h6> <!-- 이름 가운데 정렬 추가 -->
							                    <div class="d-flex justify-content-center"> <!-- 가운데 정렬 추가 -->
							                        <a href="#" data-value="${RecipeDTO.recipe_id}"
							                           class="btn border border-secondary rounded-pill px-3 text-primary" style="margin-top:10px;">
							                            <i class="fa fa-search me-2 text-primary"></i>레시피 상세 보기
								                    </a>
								                </div>
								            </div>
								        </div>
								    </div>
								</c:forEach>
								<!-- 반복 -->
							</div>
							<div class="col-12">
								<div class="pagination d-flex justify-content-center mt-5"
									id="paginationContainer">
									<!-- 총 페이지 수 계산 -->
									<c:set var="totalPages" value="${pageInfo.pageAmount}" />
									<div class="col-auto">
										<nav class="page navigation">
											<ul class="pagination">
												<!-- Prev 버튼 -->
												<c:if test="${pageInfo.prev}">
													<li class="page-item"><a
														class="page-link rounded ${pageInfo.startPage - 1 == pageInfo.currentPage ? 'active' : ''}"
														href="#" data-value="${pageInfo.startPage - 1}"
														aria-label="Previous">Prev</a></li>
												</c:if>

												<!-- 페이지 버튼 -->
												<c:forEach var="pageNumber" begin="1" end="${totalPages}">
													<li class="page-item"><a href="#"
														class="page-link rounded ${pageNumber == pageInfo.currentPage ? 'active' : ''}"
														data-value="${pageNumber}"> ${pageNumber} </a></li>
												</c:forEach>

												<!-- Next 버튼 -->
												<c:if test="${pageInfo.next}">
													<li class="page-item next"><a
														class="page-link rounded ${pageInfo.endPage + 1 == pageInfo.currentPage ? 'active' : ''}"
														href="#" data-value="${pageInfo.endPage + 1}"
														aria-label="next">Next</a></li>
												</c:if>
											</ul>
										</nav>
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
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

	<script>
		$(document).ready(function() {
		    var category ="";
	        var keyword = "";
	        var page = 1;
	        
	        
			// 카테고리 링크 클릭 시
			$('.col-lg-12').on('click', '.fruite-categorie a', function(e) {
				e.preventDefault();
				category = $(this).text().trim();
				keyword = "";
				$('#paginationContainer').empty(); // 페이지 버튼 컨테이너 비우기
				// AJAX 요청 보내기
				getRecipeByCategory(category, 1); // 페이지 번호 1로 초기화
			});
			//전체 상품 페이징
			function getRecipeAll(page) {
	            var pageSize = 9; // 페이지당 아이템 수
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
				var pageSize = 9; // 페이지당 아이템 수
				$.ajax({
					type : "GET",
					url : "/getRecipeByCategory",
					data : {
						category : category,
						page : page,
						pageSize : pageSize
					},
					success : function(response) {
						updateRecipes(response);

					},

					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			}//end getRecipeByCategory()
			
			// 받아온 상품 정보를 업데이트하는 함수
			function updateRecipes(response) {
			    var recipesContainer = $('.col-lg-9 .row'); // 상품 목록 컨테이너 선택
			    recipesContainer.empty(); // 기존 상품 목록 비우기
			
			    // 받아온 데이터를 페이지에 맞게 출력
			    $.each(response.recipes, function(index, recipe) {
			        var recipeCategoryHTML = createRecipeHTML(recipe.recipe_category);
			        // 상품 정보를 HTML로 생성하는 코드
			        var recipeHTML = '<div class="col-md-6 col-lg-6 col-xl-4">' +
			        '<div class="rounded position-relative fruite-item">' +
			        '<div class="fruite-img">' +
			        '<img src="' + recipe.recipe_img + '" class="img-fluid w-100 rounded-top" alt="" style="width: 180px; height: 230px;">' +
			        '</div>' +
			        recipeCategoryHTML + // 카테고리 HTML 추가
			        '<div class="p-4 border border-secondary border-top-0 rounded-bottom">' +
			        '<h6 class="text-center">' + recipe.recipe_name + '</h6>' +
			        '<div class="d-flex justify-content-center">' +
			        '<a href="#" data-value="' + recipe.recipe_id + '"' + // recipe_id 추가
			        ' class="btn border border-secondary rounded-pill px-3 text-primary" style="margin-top:10px;">' +
			        '<i class="fa fa-search me-2 text-primary"></i> 레시피 상세보기</a>' + // 버튼에 data-value 추가
			        '</div>' +
			        '</div>' +
			        '</div>' +
			        '</div>';
			        recipesContainer.append(recipeHTML); // 새로운 레시피를 기존의 레시피 목록에 추가
			    });
			

			    // 페이징 버튼 업데이트
			    $('#paginationContainer').empty();
			    createPaginationButtons(response.pageInfo); // 카테고리 다시 그리기
			   
			}//end updateRecipes()
			
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
			    var html = '<div class="text-white px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px; background-color: ' + backgroundColor + ';">' + recipeCategory + '</div>';
			    return html;
			}//end createRecipeHTML()

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
	             
	         }//create PaginationButtons()
	         
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
		        	getRecipeAll(page);
		        } else if(keyword !== ""){
		        	getRecipeByKeyword(category, keyword, page);
		        } else {
		        	getRecipeByCategory(category, page);
		        }
		    });
	         
         //recipeContent
         $('#recipeContent').on('click', 'a', function(e) {
        	 let recipeId = $(this).data('value');
        	 location.href = "/recipedetail?recipe_id=" + recipeId;
        	
         });
	         
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
             getRecipeByKeyword(category, keyword, 1);
         }
         
		  //검색한 단어로 상품 불러오기
			function getRecipeByKeyword(category, keyword, page) {
			    var pageSize = 9;
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

		});
	</script>
</body>
</html>
