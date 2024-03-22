<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


 
        <!-- Single Page Header End -->






	<div class="col-lg-11">
		<div class="row justify-content-center" style="margin-top: 200px; width: 40%; margin-left: 620px; ">
			<div class="cart_id" style="display: none;">${cart.cart_id}</div>
			<div class="product_id" style="display: none;">${cart.product_id}</div>
			<div class="product_quantity" style="display: none;">${cart.product_quantity}</div>
			<table>
				<thead>
					<tr>
						<th style="text-align:center;">상품이미지</th>
						<th style="text-align:center;">상품명</th>
						<th style="text-align:center;">수 량</th>
						<th style="text-align:center;">가 격</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach var="cart" items="${mergedCartList}">
					<tbody>
						<tr style="text-align:center;">
							<td><img src="${cart.product_img}" style="width: 65px;"></td>
							<td>${cart.product_name}</td>
						    <td>
						        <button type ="button" onclick="">-</button>
						        <input type="text" name="pop_out" value="${cart.product_quantity} 개" readonly="readonly" style="text-align:center;"/>
						        <button type="button" onclick="">+</button>
						    </td>
							<td>${cart.product_price}원</td>
							<td><button type="button" onclick="">X</button></td>
						</tr>
					</tbody>
	            </c:forEach>
			</table>
		</div>
	</div>
	<!-- Cart Page End -->
	
	
	
	
	
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
           console.log(cartItem);
            // recipeItem을 생성하여 recipeItems 배열에 추가
            var viewCart = {
                product_name: CartProductDTO.product_name,
                product_quantity: CartProductDTO.product_quantity,
                product_img: CartProductDTO.product_img,
                product_price : CartProductDTO.product_price,
                special_product : CartProductDTO.special_product
            };
            
            
            viewCartList.push(viewCart);
            //renderProductList();
            
        });
    }

    //debugger;

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
	
	</script>    
</body>

</html>