<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h1 class="text-center text-white display-6">Recipe Shop</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item active text-white">Recipe Shop</li>
			<li class="breadcrumb-item"><a href="/productshop">Product
					Shop</a></li>
			<li class="breadcrumb-item"><a href="/specialproductshop">Special
					Product Shop</a></li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="mb-4">Fresh fruits shop</h1>
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">
							<div class="input-group w-100 mx-auto d-flex">
								<input type="search" class="form-control p-3"
									placeholder="keywords" aria-describedby="search-icon-1">
								<span id="search-icon-1" class="input-group-text p-3"><i
									class="fa fa-search"></i></span>
							</div>
						</div>
						<div class="col-6"></div>
						<div class="col-xl-3">
							<div
								class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
								<label for="fruits">Default Sorting:</label> <select id="fruits"
									name="fruitlist" class="border-0 form-select-sm bg-light me-3"
									form="fruitform">
									<option value="volvo">Nothing</option>
									<option value="saab">Popularity</option>
									<option value="opel">Organic</option>
									<option value="audi">Fantastic</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>Categories</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
													<span>(3)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a>
													<span>(5)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a>
													<span>(2)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a>
													<span>(8)</span>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a>
													<span>(5)</span>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="mb-3">
										<h4 class="mb-2">Price</h4>
										<input type="range" class="form-range w-100" id="rangeInput"
											name="rangeInput" min="0" max="500" value="0"
											oninput="amount.value=rangeInput.value">
										<output id="amount" name="amount" min-velue="0"
											max-value="500" for="rangeInput">0</output>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>Additional</h4>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-1"
												name="Categories-1" value="Beverages"> <label
												for="Categories-1"> Organic</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-2"
												name="Categories-1" value="Beverages"> <label
												for="Categories-2"> Fresh</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-3"
												name="Categories-1" value="Beverages"> <label
												for="Categories-3"> Sales</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-4"
												name="Categories-1" value="Beverages"> <label
												for="Categories-4"> Discount</label>
										</div>
										<div class="mb-2">
											<input type="radio" class="me-2" id="Categories-5"
												name="Categories-1" value="Beverages"> <label
												for="Categories-5"> Expired</label>
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<h4 class="mb-3">Featured products</h4>
									<div class="d-flex align-items-center justify-content-start">
										<div class="rounded me-4" style="width: 100px; height: 100px;">
											<img src="img/featur-1.jpg" class="img-fluid rounded" alt="">
										</div>
										<div>
											<h6 class="mb-2">Big Banana</h6>
											<div class="d-flex mb-2">
												<i class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="d-flex mb-2">
												<h5 class="fw-bold me-2">2.99 $</h5>
												<h5 class="text-danger text-decoration-line-through">4.11
													$</h5>
											</div>
										</div>
									</div>
									<div class="d-flex align-items-center justify-content-start">
										<div class="rounded me-4" style="width: 100px; height: 100px;">
											<img src="img/featur-2.jpg" class="img-fluid rounded" alt="">
										</div>
										<div>
											<h6 class="mb-2">Big Banana</h6>
											<div class="d-flex mb-2">
												<i class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="d-flex mb-2">
												<h5 class="fw-bold me-2">2.99 $</h5>
												<h5 class="text-danger text-decoration-line-through">4.11
													$</h5>
											</div>
										</div>
									</div>
									<div class="d-flex align-items-center justify-content-start">
										<div class="rounded me-4" style="width: 100px; height: 100px;">
											<img src="img/featur-3.jpg" class="img-fluid rounded" alt="">
										</div>
										<div>
											<h6 class="mb-2">Big Banana</h6>
											<div class="d-flex mb-2">
												<i class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star text-secondary"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="d-flex mb-2">
												<h5 class="fw-bold me-2">2.99 $</h5>
												<h5 class="text-danger text-decoration-line-through">4.11
													$</h5>
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-center my-4">
										<a href="#"
											class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew
											More</a>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="position-relative">
										<img src="img/banner-fruits.jpg"
											class="img-fluid w-100 rounded" alt="">
										<div class="position-absolute"
											style="top: 50%; right: 10px; transform: translateY(-50%);">
											<h3 class="text-secondary fw-bold">
												Fresh <br> Fruits <br> Banner
											</h3>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								<!-- 반복 -->
								<c:forEach items="${recipe}" var="RecipeDTO">
									<div class="col-md-6 col-lg-6 col-xl-4">
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
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- 반복 -->
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-5.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Grapes</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-2.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Raspberries</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-4.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Apricots</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-3.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Banana</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-1.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Oranges</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-2.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Raspberries</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-5.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Grapes</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item">
											<div class="fruite-img">
												<img src="img/fruite-item-1.jpg"
													class="img-fluid w-100 rounded-top" alt="">
											</div>
											<div
												class="text-white bg-secondary px-3 py-1 rounded position-absolute"
												style="top: 10px; left: 10px;">Fruits</div>
											<div
												class="p-4 border border-secondary border-top-0 rounded-bottom">
												<h4>Oranges</h4>
												<p>Lorem ipsum dolor sit amet consectetur adipisicing
													elit sed do eiusmod te incididunt</p>
												<div class="d-flex justify-content-between flex-lg-wrap">
													<p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
													<a href="#"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="pagination d-flex justify-content-center mt-5">
											<a href="#" class="rounded">&laquo;</a> <a href="#"
												class="active rounded">1</a> <a href="#" class="rounded">2</a>
											<a href="#" class="rounded">3</a> <a href="#" class="rounded">4</a>
											<a href="#" class="rounded">5</a> <a href="#" class="rounded">6</a>
											<a href="#" class="rounded">&raquo;</a>
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
