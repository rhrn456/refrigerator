<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	<!-- Libraries Stylesheet -->
	<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
	<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	
	<!-- Customized Bootstrap Stylesheet -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Template Stylesheet -->
	<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar start -->
	<%@ include file="../header.jsp"%>
	<!-- Navbar End -->
	
	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5" style="margin-top: 180px;">
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>카테고리</h4>
										<ul class="list-unstyled fruite-categorie">
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=1"><i class="fas fa-apple-alt me-2"></i>공지사항</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=2"><i class="fas fa-apple-alt me-2"></i>공유 게시판</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=3"><i class="fas fa-apple-alt me-2"></i>나만의 레시피</a>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="row">
							    <div class="col-xl-8 col-lg-7" style="width: 80%">
							        <div class="card shadow mb-4">
							            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							                <h6 class="m-0 font-weight-bold text-primary">게시글 등록</h6>
							            </div>
							            <!-- Card Body -->
							            <form action="/insertBoard" method="POST">
								            <div class="card-body">
								                <input type="text" id="title" name="title" placeholder="제목" class="form-control mb-3" required>
								                <textarea id="content" name="content" placeholder="내용" class="form-control mb-3" rows="8" required></textarea>
								                <div class="dropdown">
								                    <select id="board_category" name="CategoryNo" class="form-control mb-3"">
								                        <option value="" selected disabled hidden>게시판 분류</option>
								                        <option value="1">공지사항</option>
								                        <option value="2">공유 게시판</option>
								                        <option value="3">나만의 레시피</option>
								                    </select>
								                </div>
								                <!-- 확인 버튼 -->
								                <button type="submit" id="confirmButton" class="btn btn-primary" style="float:right; margin-bottom: 1rem">등록</button>
								            </div>
							            </form>
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
	
	function selectCategory(CategoryNo) {
	    document.getElementById("board_category").value = CategoryNo;
	    toggleDropdown();
	  }
	
	  // Close the dropdown if the user clicks outside of it
	  window.onclick = function(event) {
	      var dropdowns = document.getElementsByClassName("dropdown-content");
	      for (var i = 0; i < dropdowns.length; i++) {
	        var openDropdown = dropdowns[i];
	        if (openDropdown.classList.contains('show')) {
	          openDropdown.classList.remove('show');
	        }
	      }
	  }
	  
	  document.getElementById('confirmButton').addEventListener('click', function() {
	      var title = document.getElementById('title').value;
	      var content = document.getElementById('content').value;
	      var board_category = document.getElementById('board_category').value;
		
	      if (title.trim() === '' || content.trim() === '') {
	          alert('빈칸을 입력해주세요');
	          return;
	      } else if(board_category.trim() === '') {
	    	  alert('게시판을 선택해주세요')
	    	  return;
	      }
	  });
	  
	</script>
	
</body>
</html>
