<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


$(document).ready(function(){
	
    $("#submitForm").click(function(){
        var productName = $("#productName").val();
        var productQuantity = $("#productQuantity").val();
        var limitDate = $("#limitDate").val();
        var refrigeratorId = $("#refrigeratorId").val();
        
        var data = {
            product_name: productName,
            product_quantity: productQuantity,
            limit_date: limitDate,
            refrigerator_id: refrigeratorId
        };
        
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/insertRefrigeratorProduct",
            data: JSON.stringify(data),
            success: function(response){
                alert(response);
                window.location.href = window.location.href;
            },
            error: function(xhr, status, error){
                console.error(xhr.responseText);
            }
        });
    });
    
    $("#updateForm").click(function(){
  	  var refrigeratorProductId = $("#editProductId").val();
  	  var productName = $("#editProductName").val();
  	  var productQuantity = $("#editProductQuantity").val();
  	  var limitDate = $("#editLimitDate").val();
	  var refrigeratorId = $("#refrigeratorId").val();
  	  
  	  var data = {
  	    refrigerator_product_id: refrigeratorProductId,
  	    product_name: productName,
  	    product_quantity: productQuantity,
  	    limit_date: limitDate,
  	    refrigerator_id: refrigeratorId
  	  };
  	  
    $.ajax({
      type: "PUT",
      contentType: "application/json",
      url: "/updateRefrigeratorProduct", 
      data: JSON.stringify(data),
      success: function(response){
        alert(response);
        window.location.href = window.location.href; // 페이지 새로고침
      },
      error: function(xhr, status, error){
        console.error(xhr.responseText);
      }
    });
  });
});

function deleteProduct(refrigeratorProductId) {
    if (confirm("이 재료를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/deleteRefrigeratorProduct",
            contentType: "application/x-www-form-urlencoded",
            data: { refrigeratorProductId: refrigeratorProductId },
            success: function(response){
                alert(response);
                window.location.href = window.location.href; // 새로고침
            },
            error: function(xhr, status, error){
                console.error(xhr.responseText);
            }
        });
    }
}

function showEditForm(refrigeratorProductId, productName, productQuantity, limitDate) {
	  $("#editProductName").val(productName);
	  $("#editProductQuantity").val(productQuantity);
	  $("#editLimitDate").val(limitDate);
	  $("#editProductId").val(refrigeratorProductId);
	  
	  $("#editForm").show();
	  $("#productForm").hide();
}

function shareProduct(refrigeratorProductId){
	$.ajax({
		type: "POST",
		url: "/shareProduct",
		data: {refrigeratorProductId: refrigeratorProductId},
        success: function(response){
            alert(response);
            window.location.href = window.location.href;
        },
        error: function(xhr, status, error){
            console.error(xhr.responseText);
        }
	})
}

</script>

<style>
.btn-group .btn:not(:last-child) {
	margin-right: 15px; /* 마지막 버튼을 제외한 모든 버튼에 오른쪽 마진을 15픽셀로 설정 */
}

#editForm {
	display: none;
	margin-top: 20px;
}

thead th {
	color: #81c408; /* 글자 색을 노란색으로 변경 */
}

.edit-form-container {
	background-color: #fff; /* 테이블 배경색과 일치 */
	padding: 20px; /* 테이블 패딩과 비슷하게 조정 */
	margin-top: 20px; /* 테이블과의 간격 */
	border-radius: 5px; /* 테이블의 border-radius와 일치 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 테이블 스타일과 유사한 그림자 효과 */
}

.edit-form-container input, .edit-form-container button {
	width: 100%; /* 입력 필드와 버튼을 컨테이너에 꽉 차게 */
	padding: 10px; /* 적당한 패딩 */
	margin-bottom: 10px; /* 요소 간의 간격 */
	border-radius: 5px; /* 입력 필드와 버튼의 모서리 둥글게 */
}

#updateForm, #submitForm {
	background-color: #81c408 !important;
	/* !important를 사용하여 다른 스타일에 의해 덮어쓰이지 않도록 함 */
	color: white;
}
</style>

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
		<h1 class="text-center text-white display-6">나의 냉장고</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Cart Page Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Quantity</th>
							<th scope="col">AppendDate</th>
							<th scope="col">LimitDate</th>
							<th scope="col" style="width: 100px;">Handle</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${0 != refrigeratorProductList.size()}">
							<c:forEach var="product" items="${refrigeratorProductList}">
								<tr>
									<td>
										<p class="mb-0 mt-4" style="font-weight: 900;">${product.product_name}</p>
									</td>
									<td>
										<p class="mb-0 mt-4">${product.product_quantity}</p>
									</td>
									<td>
										<p class="mb-0 mt-4">${product.append_date}</p>
									</td>
									<td>
										<p class="mb-0 mt-4">${product.limit_date}</p>
									</td>
									<td>
										<div class="btn-group">
											<button
												class="btn btn-md rounded-circle bg-light border mt-4"
												onclick="showEditForm('${product.refrigerator_product_id}', '${product.product_name}', '${product.product_quantity}', '${product.limit_date}')">
												<i class="bi bi-pen-fill"></i>
											</button>
											<button
												class="btn btn-md rounded-circle bg-light border mt-4"
												onclick="window.location.href='/mypage/shareProduct?refrigeratorProductId=${product.refrigerator_product_id}'">
												<i class="bi bi-people-fill"></i>
											</button>
											<button
												class="btn btn-md rounded-circle bg-light border mt-4"
												onclick="deleteProduct(${product.refrigerator_product_id})">
												<i class="fa fa-times text-danger"></i>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<c:if test="${0 == refrigeratorProductList.size()}">
					<br>
					<br>
					<h2 style="text-align: center; color: #81c408;">나의 냉장고가
						비어있습니다.</h2>
				</c:if>
			</div>
			<div id="productForm" class="mt-5">
				<div class="edit-form-container">
					<form>
						<input type="hidden" id="refrigeratorId" name="refrigeratorId"
							value="${refrigeratorId}">

						<div class="form-group">
							<label for="editProductName" class="mb-2"><strong>Name</strong></label>
							<input type="text" id="productName" name="productName"
								class="form-control">
						</div>

						<div class="form-group">
							<label for="editProductQuantity" class="mb-2"><strong>Quantity</strong></label>
							<input type="text" id="productQuantity" name="productQuantity"
								class="form-control">
						</div>

						<div class="form-group">
							<label for="editLimitDate" class="mb-2"><strong>LimitDate</strong></label>
							<input type="date" id="limitDate" name="limitDate"
								class="form-control">
						</div>

						<button type="button" id="submitForm"
							class="btn btn-md bg-light border mt-4">새로운 재료 추가</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart Page End -->
	<div class="container" id="editForm">
		<div class="edit-form-container">
			<h2 style="text-align: center; color: #81c408;">Product Edit</h2>
			<form>
				<input type="hidden" id="editProductId" name="editProductId">

				<div class="form-group">
					<label for="editProductName" class="mb-2"><strong>Name</strong></label>
					<input type="text" id="editProductName" name="editProductName"
						class="form-control">
				</div>

				<div class="form-group">
					<label for="editProductQuantity" class="mb-2"><strong>Quantity</strong></label>
					<input type="text" id="editProductQuantity"
						name="editProductQuantity" class="form-control">
				</div>

				<div class="form-group">
					<label for="editLimitDate" class="mb-2"><strong>LimitDate</strong></label>
					<input type="date" id="editLimitDate" name="editLimitDate"
						class="form-control">
				</div>

				<button type="button" id="updateForm"
					class="btn btn-md bg-light border mt-4">수정</button>
			</form>
		</div>
	</div>

	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-8 mx-auto" style="margin-bottom: -10px;">
						<h3 class="mb-0">
							<i class="fa fa-calculator" aria-hidden="true""></i> 나의 냉장고 속 재료와 딱 맞는 레시피 추천!
						</h3>
						<br><br>
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
													class="text-white bg-secondary px-3 py-1 rounded position-absolute"
													style="top: 10px; left: 10px;">${RecipeDTO.recipe_category}</div>
												<div
													class="p-4 border border-secondary border-top-0 rounded-bottom">
													<h4>${RecipeDTO.recipe_name}</h4>
													<p>${RecipeDTO.recipe_content}</p>
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

	<!-- footer start -->
	<%@ include file="footer.jsp"%>
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
</body>


</html>