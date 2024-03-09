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
    </style>
</head>

<body>
    <!-- Slidebar start -->
    <%@ include file="adminslidebar.jsp" %>
    <!-- Slidebar End -->

    <!-- 레시피 추가 박스 -->
    <div class="row justify-content-center" style="margin-top: 200px; width: 80%; margin-left: 320px;">
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">레시피 등록</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">   
                
                    <input id="recipe_id" value="${onerecipe.recipe_id}" class="form-control mb-3" readonly>
                    <div class="dropdown">
                        <select id="recipe_ingredient" class="form-control mb-3" style="width: 180px;">
                            <option value="" selected disabled hidden>레시피 재료</option>
                            <c:forEach items="${productList}" var="product">
                                <option value="${product.product_id}">${product.product_name}</option>
                            </c:forEach>
                        </select>
                        <div class="arrow-icon" onclick="toggleDropdown()">&#9660;</div>
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
        // 저장된 레시피 제품들의 배열
        var recipeProducts = [];
        var recipeItems = [];
		//데이터 변수에 저장
        function addProduct() {
            var recipe_id = document.getElementById('recipe_id').value;
            var product_id = document.getElementById('recipe_ingredient').value;
            var product_name = document.getElementById('recipe_ingredient').options[document.getElementById('recipe_ingredient').selectedIndex].text;
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
            recipeProducts.push(recipeProduct);
            recipeItems.push(recipeItem);
            renderProductList();
			//완료되면 초기화
            document.getElementById('product_quantity').value = '';
            document.getElementById('recipe_ingredient').value = '';
        }
        
        //레시피 재료 삭제
        function removeProduct(index) {
            recipeProducts.splice(index, 1); // 전송할 데이터 삭제
            recipeItems.splice(index, 1); //출력용 재료 삭제
            renderProductList(); 
        }
        function sendProducts() {
            var productListString = JSON.stringify(recipeProducts);
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

        // 버튼 클릭 이벤트
        document.getElementById('confirmButton').addEventListener('click', sendProducts);
        document.getElementById('confirmButton2').addEventListener('click', addProduct);
    </script>

</body>
</html>