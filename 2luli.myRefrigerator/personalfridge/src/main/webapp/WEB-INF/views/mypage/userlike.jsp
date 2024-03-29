<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>찜한 레시피</title>
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
<%@ include file="../header.jsp"%>
<!-- Navbar End -->

<style>
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
		<h1 class="text-center text-white display-6">내가 찜한 레시피</h1>
	</div>
	<!-- Single Page Header End -->

	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<div class="col-lg-9" style="margin-top: -52px; margin: 0 auto;">
				<div id="recipeContent" class="row g-4">
					<!-- 반복 -->
					<c:forEach items="${likeList}" var="RecipeDTO">
						<div class="col-md-6 col-lg-6 col-xl-4">
							<div class="rounded position-relative fruite-item">
								<div class="fruite-img">
									<img src="${RecipeDTO.recipe_img}"
										class="img-fluid w-100 rounded-top" alt=""
										style="width: 180px; height: 230px;">
								</div>
								<button class="like-btn"
									style="position: absolute; bottom: 10px; right: 10px; background-color: pink; border: 2px solid pink; border-radius: 50%; padding: 5px;"
									data-recipe-id="${RecipeDTO.recipe_id}">
									<i class="fas fa-heart"
										style="color: ${userlike == 0 ? 'red' : 'white'};"></i>
								</button>
								<div
									class="p-4 border border-secondary border-top-0 rounded-bottom">
									<h6 class="text-center">${RecipeDTO.recipe_name}</h6>
									<!-- 이름 가운데 정렬 추가 -->
									<div class="d-flex justify-content-center">
										<!-- 가운데 정렬 추가 -->
										<a href="#" data-value="${RecipeDTO.recipe_id}"
											class="btn border border-secondary rounded-pill px-3 text-primary"
											style="margin-top: 10px;"> <i
											class="fa fa-search me-2 text-primary"></i>레시피 상세 보기
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
	<!-- Fruits Shop End-->

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
	
	//recipeContent
    $('#recipeContent').on('click', 'a', function(e) {
   	 let recipeId = $(this).data('value');
   	 location.href = "/recipedetail?recipe_id=" + recipeId;
   	
    });
	
	</script>

</body>
<!-- footer start -->
<%@ include file="../footer.jsp"%>
<!-- footer End -->

</html>