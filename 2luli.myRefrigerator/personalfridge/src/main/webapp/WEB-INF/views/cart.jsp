<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<%@ include file="header.jsp" %>
    <!-- Navbar End -->
    
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.4);
}

/* 모달 콘텐츠 스타일 */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 500px; /* 모달 최대 너비 설정 */
  border-radius: 10px;
}

/* 모달 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

/* 모달 입력 요소 간 마진 설정 */
.modal-inputs {
  margin-bottom: 10px;
}

/* 확인 버튼 스타일 */
.btn-primary {
  width: 100%;
}

/* 주소 입력 요소 정렬 */
#locationDropdown,
#addressInput {
  width: calc(100% - 10px);
  margin-bottom: 10px;
}

/* 주소 입력 모달 타이틀 정렬 */
h2 {
  margin-top: 0;
}
</style>
</head>
<body>

	<!-- Spinner Start -->
	<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">장바구니</h1>
	</div>
	<!-- Single Page Header End -->

	<ul id="cartproductList" class="row mt-3" style="margin-right:2px;"></ul>
	
	
	
	
	<button id="sendProductsButton" onclick="openModal()">제품 보내기</button>

    <div id="deliveryModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 style="text-align: center;">배송 정보 입력</h2>
        <div class="modal-inputs">
        <select id="locationDropdown">
        <option value="부산">부산</option>
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="강원도">강원도</option>
        <option value="전라북도">전라북도</option>
        <option value="전라남도">전라남도</option>
        <option value="경상북도">경상북도</option>
        <option value="경상남도">경상남도</option>
        <option value="충청남도">충청남도</option>
        <option value="충청북도">충청북도</option>
        </select>
        <input type="text" style="width:450px;"id="addressInput" placeholder="주소를 입력하세요">
        </div>
        <button class="btn btn-primary" onclick="confirmAddress()">확인</button>
    </div>
    </div>

	<div style="height:600px;">
	</div>
	<!-- footer start -->
	<%@ include file="footer.jsp" %>
	<!-- footer End -->
	
	
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
	//택배 주소 창열기
	 function openModal() {
		    var modal = document.getElementById("deliveryModal");
		    modal.style.display = "block";
		  }

		  // 모달 닫기
		  function closeModal() {
		    var modal = document.getElementById("deliveryModal");
		    modal.style.display = "none";
		  }

		  function confirmAddress() {
			    var locationDropdown = document.getElementById('locationDropdown');
			    var selectedLocation = locationDropdown.value;
			    var addressInput = document.getElementById('addressInput');
			    var enteredAddress = addressInput.value;

			    // 선택된 위치와 입력된 주소 확인
			    console.log('선택된 위치:', selectedLocation);
			    console.log('입력된 주소:', enteredAddress);

			    $.ajax({
			        type: "POST",
			        url: "/delevery",
			        contentType: "application/json",
			        data: JSON.stringify({
			            arrive: selectedLocation,
			            sub_adress: enteredAddress
			        }),
			        success: function(response) {
			            console.log('배송 정보 전송 성공');
			            sendProducts();
			            closeModal();
			        },
			        error: function(xhr, status, error) {
			            console.error('배송 정보 전송 실패');
			            console.error(error);
			        }
			    });
			}
		  
		  
		  function closeModal() {
			    var modal = document.getElementById('deliveryModal');
			    modal.style.display = 'none';
			}
			  // 사용자가 모달 외부를 클릭하면 모달이 닫히도록 설정
			  window.onclick = function(event) {
			    var modal = document.getElementById("deliveryModal");
			    if (event.target == modal) {
			      modal.style.display = "none";
			    }
			  }//택배 끝
		  
		  
		  
		  

	var cartItemList = [];
    var viewCartList = [];
    var cartItemAlltList = ${cartListJson}; // JSON 형식의 문자열로 전달된 recipeproductList
    if (cartItemAlltList && cartItemAlltList.length > 0) {
        // recipeproductList의 각 요소를 순회하면서 recipeProducts 배열에 저장
        cartItemAlltList.forEach(function(CartProductDTO) {
            // recipeProduct를 JavaScript 객체로 변환하여 recipeProducts 배열에 추가
            var cartItem = {
            	cart_id: CartProductDTO.cart_id,
                product_id: CartProductDTO.product_id,
                product_quantity: CartProductDTO.product_quantity
            };
            cartItemList.push(cartItem);
            
            // recipeItem을 생성하여 recipeItems 배열에 추가
            var viewCart = {
                product_name: CartProductDTO.product_name,
                product_quantity: CartProductDTO.product_quantity,
                product_img: CartProductDTO.product_img,
                product_price : CartProductDTO.product_price,
                special_product : CartProductDTO.special_product
            };
            viewCartList.push(viewCart);
            renderProductList();
            //renderProductList();
            
        });
    }
	
    function renderProductList() {
        var productList = document.getElementById('cartproductList');
        productList.innerHTML = ''; // 이전 상품들을 모두 삭제

        viewCartList.forEach(function(product) {
            var productListItem = document.createElement('li');
            productListItem.classList.add('col-lg-3', 'col-md-6', 'mb-4');

            var productImage = document.createElement('img');
            productImage.src = product.product_img;
            productImage.alt = product.product_name;
            productListItem.appendChild(productImage);

            var productName = document.createElement('h3');
            productName.textContent = product.product_name;
            productListItem.appendChild(productName);

            var productQuantity = document.createElement('p');
            productQuantity.textContent = 'Quantity: ' + product.product_quantity;
            productListItem.appendChild(productQuantity);

            var productPrice = document.createElement('p');
            productPrice.textContent = 'Price: ' + product.product_price + '원';
            productListItem.appendChild(productPrice);

            var addToCartButton = document.createElement('button');
            addToCartButton.textContent = 'Add to Cart';
            addToCartButton.classList.add('btn', 'btn-primary');
            productListItem.appendChild(addToCartButton);

            productList.appendChild(productListItem);
        });
    }



    
    // 레시피 재료 삭제
    function removeProduct(index) {
    	cartItemList.splice(index, 1); // 전송할 데이터 삭제
    	viewCart.splice(index, 1); // 출력용 재료 삭제
       // renderProductList();
    }

    function sendProducts() {
        if (cartItemList.length === 0) {
            alert('빈칸에 입력해주세요');
            return;
        }

        var isEmpty = false;
        cartItemList.forEach(function(product) {
            if (!product.product_quantity || !product.product_id) {
                // 빈 값이 하나라도 있으면 isEmpty를 true로 설정
                isEmpty = true;
                return; // 반복문 종료
            }
        });

        if (isEmpty) {
            alert('빈칸에 입력해주세요');
            return;
        }

        var productListString = JSON.stringify(cartItemList); 
        window.location.href = '/buyproduct?cartProducts=' + encodeURIComponent(productListString);

    }
	
    function addProduct(selectedProductName, selectedProductId, selectedProductImg, selectedProductPrice, selectedProductSpecial) {	    	
	    var product_id = selectedProductId;
	    var product_name = selectedProductName;
	    var product_quantity = 1;
	    var product_img = selectedProductImg;
	    var product_price = selectedProductPrice;
	    var special_product = selectedProductSpecial;
	    
	    // 전송할 데이터
	    var recipeProduct = {
	        product_id: product_id,
	        product_quantity: product_quantity
	    };
	    
	    // 출력용
	    var recipeItem = {
	        product_name: product_name,
	        product_quantity: product_quantity,
	        product_img: product_img,
	        product_price: product_price,
	        special_product : special_product
	    };
	    
	    recipeItems.push(recipeItem);
	    recipeProducts.push(recipeProduct);
	    renderProductList();
	}
    
	// 받아온 상품 정보를 업데이트하는 함수
	function updateProducts(response) {
	    var productsContainer = $('.col-lg-11 .row');
	    productsContainer.empty(); // 기존 상품 목록 비우기
	   	console.log("여기 열렸어");
	   	console.log(response);
	    // 받아온 데이터를 페이지에 맞게 출력
	    $.each(response.viewCart, function(index, viewCart) {
	        // 상품 정보를 HTML로 생성하는 코드
	        var productHTML = '<div class="card" style="margin-left:1px; padding:0;">' +
				'<div class="card-info">' +
	            '<div class="product-img" style="display: none;">' + viewCart.product_img + '</div>' +
	            '<div class="product-name" style="display: none;">' + viewCart.product_name + '</div>' +
	            '<div class="product_quantity" style="display: none;">' + viewCart.product_quantity + '</div>' +
	            '<div class="product-price" style="display: none;">' + viewCart.product_price + '</div>' +
	            '<div class="main-top" style="margin-left:10px;">' +
	            '<a style="display: block; margin-top:7px; color:#4d4c4c; font-weight:bold;">' + viewCart.product_name + '</a>' + 
                '<a style="display: block; font-size:15px;">' + viewCart.product_price + '원' + '</a>' + 
	            '</div>' +
	            '<div class="main-top">' +
	           /*  '<div class="special_product" style="font-size:13px; color:white; background-color: ' + (viewCart.special_product ? 'orange' : 'green') + '; text-align: center;">' + (viewCart.special_product ? '특가' : '일반') + '</div>' + */
	            '<button id="confirmButton3" class="btn plus-btn" style="font-size:15px;">추가</button>' + // 추가 버튼 추가
	            '</div>' +
	            '</div>' +
	            '</div>';
	            console.log(productHTML);
	        productsContainer.append(productHTML); // 새로운 상품을 기존의 상품 목록에 추가
	    });
	}
	
	// 제품 목록을 출력하는 함수
    function renderRecipeItems() {
        var recipeItemsList = document.getElementById('recipeItemsList');
        recipeItemsList.innerHTML = ''; // 기존 목록 초기화

        // recipeItems 배열을 순회하면서 각 제품의 정보를 출력
        recipeItems.forEach(function(item) {
			// 각 제품을 나타내는 요소 생성
            var listItem = document.createElement('li');
            listItem.style.marginBottom = '4px';
            listItem.style.fontSize = '20px';

            // 제품 이름 출력
            var nameElement = document.createElement('span');
            nameElement.textContent = item.product_name;
            listItem.appendChild(nameElement);

            // 제품 수량 출력
            var quantityElement = document.createElement('span');
            quantityElement.textContent = ' ' + 'X' + ' ' + item.product_quantity  + '개';
            listItem.appendChild(quantityElement);

            // 제품 가격 출력
            var priceElement = document.createElement('span');
            priceElement.textContent = (item.product_price * item.product_quantity) + '원';
            priceElement.style.float = 'right'; // 오른쪽으로 부유(floating)
            listItem.appendChild(priceElement);

            // 리스트에 각 제품 요소 추가
            recipeItemsList.appendChild(listItem);
        });
        
        // 총 가격 출력
        var totalPriceElement = document.createElement('hr');
        totalPriceElement.style.marginTop = '130px'; // 위쪽 여백 추가
        recipeItemsList.appendChild(totalPriceElement);

        var totalTextElement = document.createElement('span');
        totalTextElement.textContent = '전체 금액: ';

        var totalPriceValueElement = document.createElement('span');
        var totalPrice = calculateTotalPrice(); // 총 가격 계산 함수 호출
        totalPriceValueElement.textContent = totalPrice + '원';
        totalPriceValueElement.style.float = 'right'; // 오른쪽으로 부유(floating)
		
        totalTextElement.style.fontSize = '20px'; // 폰트 크기 설정
        totalPriceValueElement.style.fontSize = '20px'; // 폰트 크기 설정
        recipeItemsList.appendChild(totalTextElement);
        recipeItemsList.appendChild(totalPriceValueElement);
    }

    // 총 가격 계산 함수
    function calculateTotalPrice() {
        var totalPrice = 0;
        recipeItems.forEach(function(item) {
            totalPrice += item.product_price * item.product_quantity;
        });
        return totalPrice;
    }
	
</script>    
</body>

</html>