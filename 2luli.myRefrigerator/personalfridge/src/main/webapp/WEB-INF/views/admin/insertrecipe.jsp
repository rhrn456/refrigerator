<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>레시피 등록</title>
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
        
        
		<!-- 레시피 추가 박스 -->
			<div class="row justify-content-center" style="margin-top: 200px; width: 80%; margin-left: 200px;">
			    <div class="col-xl-8 col-lg-7">
			        <div class="card shadow mb-4">
			            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			                <h6 class="m-0 font-weight-bold text-primary">레시피 등록</h6>
			            </div>
			            <!-- Card Body -->
			            <div class="card-body">   
			                <input type="text" id="recipe_name" placeholder="레시피 이름" class="form-control mb-3" required>
			                <textarea id="recipe_content" placeholder="레시피 내용" class="form-control mb-3" rows="5" required></textarea>
			                <input type="text" id="ingredient" placeholder="재료" class="form-control mb-3" required>
			                <div class="dropdown">
			                    <select id="recipe_category" class="form-control mb-3" style="width: 180px;">
			                        <option value="" selected disabled hidden>레시피 카테고리</option>
			                        <option value="밥">밥</option>
			                        <option value="국/찌개">국/찌개</option>
			                        <option value="반찬">반찬</option>
			                    </select>
			                    <div class="arrow-icon">&#9660;</div>
			                </div>
			                <input type="text" id="recipe_img" placeholder="레시피 이미지" class="form-control mb-3" required>
			                <input type="text" id="nutrition_facts" placeholder="영양 성분" class="form-control mb-3" required>
			                <!-- 확인 버튼 -->
			                <button id="confirmButton" class="btn btn-primary">등록</button>
			            </div>
			        </div>
			    </div>
			</div>
			<!-- 레시피 추가 박스 끝 -->
					
                      
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
    document.getElementById("recipe_category").value = category;
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
      var recipe_name = document.getElementById('recipe_name').value;
      var recipe_content = document.getElementById('recipe_content').value;
      var ingredient = document.getElementById('ingredient').value;
      var recipe_category = document.getElementById('recipe_category').value;
      var recipe_img = document.getElementById('recipe_img').value;
      var nutrition_facts = document.getElementById('nutrition_facts').value;
	
      if (recipe_name.trim() === '' || recipe_content.trim() === '' || ingredient.trim() === '' || recipe_category.trim() === '' || recipe_img.trim() === '' || nutrition_facts.trim() === '') {
          alert('빈칸에 입력해주세요');
          return; // 빈 값이 있으면 함수 종료
      }
      // Data validation can be added here

      // Redirect to /insertRecipe with data
      window.location.href = '/RecipePlus?recipe_name=' + encodeURIComponent(recipe_name) + '&recipe_content=' + encodeURIComponent(recipe_content) + '&ingredient=' + encodeURIComponent(ingredient) + '&recipe_category=' + encodeURIComponent(recipe_category) + '&recipe_img=' + encodeURIComponent(recipe_img) + '&nutrition_facts=' + encodeURIComponent(nutrition_facts);
  });
</script>

    </body>
</html>