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

.mt-3 {
	list-style-type: none;
}

#cartproductList {
	width: 500px;
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

#sendProductsButton {
	position: absolute;
	left: 48%;
	width: 150px;
	height: 40px;
	border-radius: 15px;
	background-color: #dc2e5e;
	border-color: white;
	color:white;
	display: flex; 
    justify-content: center; 
    align-items: center;
	text-align: center;
}

#sendProductsButton:hover {
	 cursor: pointer;
}

#removebutton:hover {
	 cursor: pointer;
}
#productImage {
	-webkit-border-radius: 6px;
}

img {
	-webkit-border-radius: 6px;
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
	
	<!-- Cart Page start -->
	<div class="col-lg-11" style="margin-bottom: 150px;">
		<div class="row justify-content-center" style="margin-top: 150px; margin-left: 200px;">
			<ul id="cartproductList" class="row mt-3"></ul>
		</div>
		<div id="sendProductsButton" onclick="openModal()">구매하기</div>
	</div>
	<!-- Cart Page End -->
	
    <div id="deliveryModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <h2 style="text-align: center;">배송 정보 입력</h2>
	        <div class="modal-inputs" style="width:400px;">
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
	        <input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" style="width:400px; margin-top:5px;" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span>
	        </div>
	        <button class="btn btn-primary" onclick="confirmAddress()">확인</button>
	    </div>
    </div>
	<!-- footer start -->
	<%@ include file="footer.jsp" %>
	<!-- footer End -->
	
    <!-- JavaScript Libraries -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
	
	 <!-- 결제 API JS -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
	<script>
	//결제 aPI(productCount,productName
		function requestPay(productCount, productName, totalPrice, selectedLocation, enteredAddress) {
	    var uid = '';
	    if (productCount === 1) {
	        productNameString = productName;
	    } else {
	        productNameString = productName + " 외 " + (productCount - 1);
	    }
	    var IMP = window.IMP;
	    IMP.init('imp12886452');
	    IMP.request_pay({ // param
	        pg: "kakaopay", // PG사 선택
	        pay_method: "card", // 지불 수단
	        name: productNameString, // 상품명
	        amount: totalPrice, // 가격
	        buyer_addr: selectedLocation + enteredAddress,// 구매자 주소지
	        m_redirect_url: 'https://example.com/mobile/complete', // 모바일 결제시 사용할 url
	        digital: true, // 실제 물품인지 무형의 상품인지(핸드폰 결제에서 필수 파라미터)
	        app_scheme: '' // 돌아올 app scheme
	    }, function (rsp) { // callback
	        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	            // 결제가 성공하면 sendProducts 함수를 호출할 때 selectedLocation와 enteredAddress를 전달합니다.
	            sendProducts(selectedLocation, enteredAddress);
	        }
	    });
	}
	 function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr; 
	            }
	        }).open();
	    }
	 
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
		var arrive = locationDropdown.value;
		var addressInput = document.getElementById('sample4_roadAddress').value;
		var index = addressInput.indexOf(' ') + 1;
		var enteredAddress = addressInput.substring(index);
		var sub_adress = addressInput.substring(index);
		
		var firstProduct = viewCartList[0]; // viewCartList의 첫 번째 배열 가져오기
		var productName = firstProduct.product_name; // 첫 번째 배열의 product_name 가져오기
		var productCount = viewCartList.length; // viewCartList의 배열 수 가져오기
		
	    var totalPrice = viewCartList.reduce(function(total, item) {
	        return total + (item.product_quantity * item.product_price);
	    }, 0);
		requestPay(productCount,productName,totalPrice,selectedLocation,enteredAddress)
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
            	product_id: CartProductDTO.product_id,
                product_name: CartProductDTO.product_name,
                product_quantity: CartProductDTO.product_quantity,
                product_img: CartProductDTO.product_img,
                product_price : CartProductDTO.product_price,
                special_product : CartProductDTO.special_product
            };
            viewCartList.push(viewCart);
            renderRecipeItems();
        });
    }
	
    function removeByIndex(index) {
    	$.ajax({
    		type: "GET",
    		url: "/productDeletById",
    		data: {
    			product_id: index
    		},
    		success: function(response) {
    			console.log(response);
    			updateProducts(response);
    		},
    		error: function(xhr, status, error) {
    			console.error(error);
    		}
    	})
    }
    
    // 레시피 재료 삭제
    function removeProduct(index) {
    	cartItemList.splice(index, 1); // 전송할 데이터 삭제
    	viewCartList.splice(index, 1); // 출력용 재료 삭제
    	//데이터베이스 카트 id 가져와서 삭제
       	renderRecipeItems();
    }

    function sendProducts(selectedLocation,enteredAddress) {
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
        
		var arrive = selectedLocation;
		var sub_adress = enteredAddress;
        var productListString = JSON.stringify(cartItemList); 
        window.location.href = '/buyproduct?cartProducts=' + encodeURIComponent(productListString) + '&arrive=' + arrive + '&sub_adress=' + sub_adress;
    }
	
	// 받아온 상품 정보를 업데이트하는 함수
	function updateProducts(response) {
	    var productsContainer = $('.col-lg-11 .row');
	    productsContainer.empty(); // 기존 상품 목록 비우기
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
		        productsContainer.append(productHTML); // 새로운 상품을 기존의 상품 목록에 추가
	    });
	}
	
	 // 제품 목록을 출력하는 함수
    function renderRecipeItems() {
        var recipeItemsList = document.getElementById('cartproductList');
        recipeItemsList.innerHTML = ''; // 기존 목록 초기화
		console.log(viewCartList);
        // recipeItems 배열을 순회하면서 각 제품의 정보를 출력
        viewCartList.forEach(function(item) {
            // 각 제품을 나타내는 요소 생성
            var listItem = document.createElement('li');
            listItem.style.marginBottom = '4px';
            listItem.style.fontSize = '20px';
			
            // 제품 이미지 출력
            var imgElement = document.createElement('img');
            imgElement.setAttribute('src', item.product_img); // 이미지 URL 설정
            imgElement.setAttribute('alt', item.product_name); // 대체 텍스트 설정
            imgElement.style.width = '50px';
            listItem.appendChild(imgElement);
            
            // 제품 이름 출력
            var nameElement = document.createElement('span');
            nameElement.textContent = item.product_name;
            nameElement.style.marginLeft = '10px';
            listItem.appendChild(nameElement);
			
            // 제품 수량 출력
            var quantityElement = document.createElement('span');
            quantityElement.textContent = ' ' + 'X' + ' ' + item.product_quantity  + '개';
            listItem.appendChild(quantityElement);
			
            // 가격, 삭제버튼 묶음
            var priceList =  document.createElement('div');
            priceList.style.display = 'flex'; // 절대 위치 설정
            priceList.style.float = 'right'; // 절대 위치 설정
            priceList.style.marginTop = '10px'; // 절대 위치 설정
            
            // 제품 가격 출력
            var formattedPrice = (item.product_price * item.product_quantity).toLocaleString('en-US');
            var priceElement = document.createElement('span');
            priceElement.textContent = ' ' + formattedPrice + '원';
            priceList.appendChild(priceElement);
			
            // 삭제 버튼
            var removeButton = document.createElement('div');
            removeButton.style.width = '20px'; // 절대 위치 설정
            removeButton.style.marginLeft = '5px'; // 절대 위치 설정
            removeButton.style.textAlign = 'center'; // 절대 위치 설정
            removeButton.style.fontWeight = 'bold'; // 절대 위치 설정
            removeButton.style.fontSize = '40px;'; // 절대 위치 설정
            removeButton.style.color = 'white'; // 글자색 설정
            removeButton.style.cursor = 'pointer'; // 커서 모양 변경
            removeButton.textContent = 'X'; // 텍스트 설정
            removeButton.style.backgroundColor = '#dc2e5e'; // 패딩 설정
            removeButton.id = 'removebutton';
            
            priceList.appendChild(removeButton);
            
            listItem.appendChild(priceList);
            
            removeButton.onclick = function(index) {
            	var productId = item.product_id;
            	removeCartItem(productId);
                removeProduct(index);
                removeByIndex(index);
            };
            
            // 리스트에 각 제품 요소 추가
            recipeItemsList.appendChild(listItem);
        });
        
        // 총 가격 출력
        var totalPriceElement = document.createElement('hr');
        totalPriceElement.style.marginTop = '30px'; // 위쪽 여백 추가
        totalPriceElement.style.color = 'red';
        recipeItemsList.appendChild(totalPriceElement);
		
        // 텍스트, 가격 묶음
        var totalPriceList = document.createElement('li');
        
        var totalTextElement = document.createElement('span');
        totalTextElement.textContent = '전체 금액: ';
        totalTextElement.style.color = 'red';
        totalPriceList.appendChild(totalTextElement);
		
        var totalPriceValueElement = document.createElement('span');
        var totalPrice = calculateTotalPrice(); // 총 가격 계산 함수 호출
        var formattedTotalPrice = totalPrice.toLocaleString('en-US');
        totalPriceValueElement.textContent = ' ' + formattedTotalPrice + '원';
        totalPriceValueElement.style.color = 'red';
        totalPriceValueElement.style.fontWeight = 'bold';
        totalPriceValueElement.style.float = 'right'; // 오른쪽으로 부유(floating)
        totalPriceList.appendChild(totalPriceValueElement);
		
        totalTextElement.style.fontSize = '20px'; // 폰트 크기 설정
        totalPriceValueElement.style.fontSize = '20px'; // 폰트 크기 설정
        recipeItemsList.appendChild(totalPriceList);
    }
	// 총 가격 계산 함수 // 구매 데이터
	function calculateTotalPrice() {
        var totalPrice = 0;
        viewCartList.forEach(function(item) {
            totalPrice += item.product_price * item.product_quantity;
        });
        return totalPrice;
    }
	function removeCartItem(productId) {
	    console.log(productId);
	    $.ajax({
	        type: 'GET',
	        url: '/deletecartitem',
	        data: { product_id: productId }, // product_id를 데이터로 넘깁니다.
	        success: function(response) {
	        	alert('상품이 삭제되었습니다.');
	            location.reload();
	        },
	        error: function(xhr, status, error) {
	            console.error('Error removing product:', xhr.status);
	            // 에러 처리
	        }
	    });
	}

	
	
</script>    
</body>

</html>