<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>상품 등록</title>
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
     <!-- Navbar start -->
       <%@ include file="../header.jsp" %>
        <!-- Navbar End -->
        <style>
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
    right: 10px; /* 오른쪽 여백 */
    cursor: pointer;
}
</style>
    </head>

 <body>
       <!-- Slidebar start -->
       <%@ include file="adminslidebar.jsp" %>
        <!-- Slidebar End -->
        
        
		<!-- 재료 추가 박스 -->
			<div class="row justify-content-center" style="margin-top: 200px; width: 80%; margin-left: 320px;">
			    <div class="col-xl-8 col-lg-7">
			        <div class="card shadow mb-4">
			            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			                <h6 class="m-0 font-weight-bold text-primary">재료 등록</h6>
			            </div>
			            <!-- Card Body -->
			            <div class="card-body">   
			                <input type="text" id="product_name" placeholder="재료 이름" class="form-control mb-3">
			                <textarea id="product_content" placeholder="재료 내용" class="form-control mb-3" rows="5"></textarea>
			                <input type="text" id="product_quantity" placeholder="재료 재고" class="form-control mb-3">
			                <input type="text" id="product_price" placeholder="재료 가격" class="form-control mb-3">
			                <input type="text" id="product_img" placeholder="재료 이미지" class="form-control mb-3">
			                <input type="text" id="limit_date" placeholder="유통 기한" class="form-control mb-3">
			                <div class="dropdown">
			                    <select id="product_category" class="form-control mb-3" style="width: 180px;">
			                        <option value="" selected disabled hidden>재료 카테고리</option>
			                        <option value="가공 식품">가공 식품</option>
			                        <option value="야채 ">야채</option>
			                        <option value="과일">과일</option>
			                        <option value="육류/생선">육류/생선</option>
			                        <option value="향신료">향신료</option>
			                        <option value="유제품">유제품</option>
			                    </select>
			                    <div class="arrow-icon">&#9660;</div>
			                </div>
		                		<div class="radio-buttons">
							        <label><input type="radio" id="normal_product" name="product_type" value="0"> 일반</label>
							        <label><input type="radio" id="special_product" name="product_type" value="1"> 특가</label>
							    </div>
			                <!-- 확인 버튼 -->
			                <button id="confirmButton" class="btn btn-primary">등록</button>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 재료 추가 박스 끝 -->
					
                      
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
		
		
		  function selectCategory(category) {
		    document.getElementById("product_category").value = category;
		    toggleDropdown();
		  }
		
		  // Close the dropdown if the user clicks outside of it
		  window.onclick = function(event) {
		    if (!event.target.matches('.arrow-icon')) {
		      var dropdowns = document.getElementsByClassName("dropdown-content");
		      var i;
		      for (i = 0; i < dropdowns.length; i++) {
		        var openDropdown = dropdowns[i];
		        if (openDropdown.classList.contains('show')) {
		          openDropdown.classList.remove('show');
		        }
		      }
		    }
		  }
		  
		  document.getElementById('confirmButton').addEventListener('click', function() {
		      var product_name = document.getElementById('product_name').value;
		      var product_content = document.getElementById('product_content').value;
		      var product_quantity = document.getElementById('product_quantity').value;
		      var product_price = document.getElementById('product_price').value;
		      var product_img = document.getElementById('product_img').value;
		      var limit_date = document.getElementById('limit_date').value;
		      var product_category = document.getElementById('product_category').value;
		      // 라디오 버튼 요소 가져오기
		      var normalProductRadio = document.getElementById('normal_product');
		      var specialProductRadio = document.getElementById('special_product');
		
		      // 선택된 상품 유형 가져오기
		      var special_product;
		      if (normalProductRadio.checked) {
		          special_product = normalProductRadio.value;
		      } else if (specialProductRadio.checked) {
		          special_product = specialProductRadio.value;
		      } else {
		          // 선택된 라디오 버튼이 없는 경우 처리
		          alert('일반 또는 특가 상품을 선택해주세요.');
		          return;
		      }
		
		      // Data validation can be added here
		
		      // Redirect to /insertRecipe with data
		      window.location.href = '/ProductPlus?product_name=' + encodeURIComponent(product_name) + 
		    		  				  '&product_content=' + encodeURIComponent(product_content) + 
		    		  				  '&product_quantity=' + encodeURIComponent(product_quantity) + 
		    		  				  '&product_price=' + encodeURIComponent(product_price) + 
		    		  				  '&product_img=' + encodeURIComponent(product_img) + 
		    		  				  '&limit_date=' + encodeURIComponent(limit_date) + 
		    		  				  '&product_category=' + encodeURIComponent(product_category) + 
		    		  				  '&special_product=' + encodeURIComponent(special_product);
		  });
		</script>

    </body>
</html>