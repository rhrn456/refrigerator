<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
	<%@ include file="../header.jsp" %>
    <!-- Navbar End -->
    
        <style>
		.myPAgeBox{
			display: flex;
			justify-content: center;
		    align-items: center;
		}
		.cart-mainbox{
			margin-top:220px;
			display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		}
         .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            width: 800px;
            display: block;
        }
        .big-card {
            background-color: #f5f5f5;
        }
        .small-card {
            background-color: #fff;
            margin-top: 10px;
        }
       .last-card {
		    background-color: #fff; /* 배경색을 흰색으로 설정 */
		   	right:40px;
		   	position: absolute; /* 절대 위치 지정 */
		}
		
		.delivery-button {
		    border: 2px solid rgb(52, 106, 255); /* 배송조회 버튼의 테두리 색상과 두께 설정 */
		    border-radius:5px;
		    background-color: transparent; /* 배경색을 투명으로 설정 */
		    color: rgb(52, 106, 255); /* 글자 색상 설정 */
		    margin-right: 10px; /* 오른쪽 마진 설정 */
		    width:150px;
		    height:40px;
		    margin-bottom:5px;
		    display: block;
		}
		
		.cart-button {
		    border: 1px solid rgb(221, 221, 221); /* 장바구니 버튼의 테두리 색상과 두께 설정 */
		    border-radius:5px;
		    background-color: transparent; /* 배경색을 투명으로 설정 */
		    color: #000; /* 글자 색상 설정 */
		    width:150px;
		    height:40px;
		    display: block;
		}
		.item-box {
		    display: flex; /* Flexbox 사용 */
		    align-items: center; /* 수직 가운데 정렬 */
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;		
		}
		.modal-container {
	         display: none;
	         position: fixed;
	         top: 50%;
	         left: 50%;
	         transform: translate(-50%, -50%);
	         background-color: rgba(0, 0, 0, 0.5); 
	         padding: 2px;
	         z-index: 9999;
	         color: black; 
	         box-shadow: 0 0 2px rgba(0, 0, 0, 0.5); 
		}
		
		.infoshipitem {
		    display: none;
		    position: fixed;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    padding: 2px;
		    z-index: 9999;
		    color: black; 
		}
		
		/* 모달 콘텐츠 */
		.infoshipitem .modal-contentinfo {
		    text-align: center;
		    width:350px;
		    padding: 20px;
		    background-color: #fefefe;
		    border-radius: 5px;
		}
		
		.infoshipitem h2 {
		    margin-bottom: 10px;
		}
		
		.infoshipitem ul {
		    list-style-type: none;
		    padding: 0;
		    margin-bottom:30px;
		}
		
		.infoshipitem ul li {
		    margin-bottom: 5px;
		}
		.infoshipitem .close-infobutton {
		    position: absolute; 
		    bottom: 10px; 
    		left: 40%; 
		    background-color: red;
		    color: white; 
		    border: none; 
		    padding: 5px 10px; 
		    border-radius: 5px; 
		    cursor: pointer; 
		    z-index: 1000; 
		}
		.mypagemenu {
			margin-top:-510px;
			margin-right:20px;
		    border: 3px solid #ccc;
		    border-radius: 10px;
		    font-size:20px;
		    text-align: center;
		    height:310px;
		    width:200px;
		}
		.product-category{
		 	margin-top:11px;
		 	display: block;
		 	padding:10px;
		}
		.product-category:hover {
		    background-color: #f0f0f0;
		}
		.product-category:active {
		    background-color: #ccc;
		}
		.product-category a{
			color:#666666;
		}
		hr:not([size]) {
		    height: 2px !important;
		}
    </style>
</head>
<body>

					<div class = "myPAgeBox" >
						<div class="row g-4">
                                    <div class="col-lg-12" >
                                        <div class="mypagemenu">
                                            <h3 style="margin-top:20px;">마이 페이지</h3>
                                            <hr>
									                <div class="product-category" id=editButton>
									                    <a href="#">회원정보 수정</a>
									                </div>
                                                    <div class="product-category" id=userlikebutton>
                                                        <a href="/userLikePage?user_id=${mypage.user_id}">찜한 레시피</a>    
                                                    </div>                                              
                                                    <div class="product-category">
                                                        <a href="/mypage/buyproductcheck">구매내역</a>                                                      
                                                    </div>                                          
                                                    <div class="product-category" id="deleteButton">
                                                        <a href="#">회원탈퇴</a>
                                                    </div>
			                                      </div>
			                                  </div>
			                              </div>
											<div class="cart-mainbox">
											    <%-- 각 ship_code 별로 카드 생성 --%>
											    <c:forEach var="group" items="${sortedGroupedShipList}">
											        <div class="card mb-3">
											            <div class="card-header">
											                <span class="header-text" style="display: none;">송장 번호: ${group.key}</span>
											                <span class="whereisdelevery" style="font-size:20px; font-weight:bold;"></span>
											            </div>
											            <div class="card-body">
											                <c:forEach var="product" items="${group.value}">
											                 <div class="item-box">
											                	<div clas="nomorebox">
												    				<img src="${product.product_img}" style="width: 100px; height: auto; margin-right: 10px;">
												                    </div>
												                    <div class="textbox">
												                        <h5 style="font-family: 'Gothic', sans-serif;">${product.product_name}</h5>
												                        <h6 style="font-family: 'Gothic', sans-serif;">${product.product_price}원 x ${product.product_quantity}개</h6>
												                     </div>
												                    <div class="last-card">
													                   <button class="delivery-button checkDelivery" data-ship-code="${group.key}">배송 조회</button>
											  						   <button class="cart-button" data-product-id="${product.product_id}" onclick="addToCart(this)">장바구니 담기</button>
												                    </div>
												                    </div>
											                </c:forEach>
											            </div>
											        </div>
											    </c:forEach>
											    </div>
										    </div>
    										
		<div class="infoshipitem modal-container">
		    <div class="modal-contentinfo">
		        <!-- 정보가 여기에 추가됩니다 -->
		    </div>
		        <button class="close-infobutton">닫기</button>
		</div>
		
		
		<div class="modal fade" id="quantityModal" tabindex="-1"
		aria-labelledby="quantityModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="quantityModalLabel">수량 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form class="row g-3">
						<!-- 제품 ID와 이름을 출력하는 부분 -->
						<div class="col-12 mb-3">
							<input type="hidden" id="productId" name="productId"> <label
								for="productName" class="form-label">제품 이름</label> <input
								type="text" class="form-control" id="productName"
								name="productName" readonly required>
						</div>
						<!-- 수량 입력 필드 -->
						<div class="col-12 mb-3">
							<label for="quantityInput" class="form-label">수량</label> <input
								type="number" class="form-control" id="quantityInput"
								name="quantityInput" placeholder="수량을 입력하세요" min="1" required>
						</div>
						<!-- 추가 버튼 -->
						<div class="col-12">
							<button type="button" class="btn"
								style="border: 1px solid #dc2e5e; float: right; margin-top: -20px; color: #dc2e5e;"
								id="addToCartBtn">
								<i class="fa fa-shopping-bag me-2 text-primary"> </i> 담기
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<div style="height:160px;">

</div>

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
		//배송위치 확인함수 시작
        $(".header-text").each(function() {
            var shipCode = $(this).text().split(": ")[1];
            checkDeliveryStatus(shipCode);
        });
	//배송위치확인
    function checkDeliveryStatus(shipCode) {
        $.ajax({
            url: "/checkwheredelivery", // 상태를 확인할 서버 엔드포인트
            method: "GET", // 요청 방법 (GET 또는 POST)
            data: { ship_code: shipCode }, // 요청 데이터 (송장 번호)
            success: function(response) {
                var statusText = ""; // 배송 상태 텍스트

                // 서버에서 반환된 데이터에 따라 상태 텍스트를 설정합니다.
                if (response === 0) {
                    statusText = "상품 준비중";
                } else if (response === 3) {
                    statusText = "배송 완료";
                } else {
                    statusText = "배송중";
                }

                // 해당 송장 번호에 대한 상태 텍스트를 설정합니다.
                $(".whereisdelevery").text(statusText);
            },
            error: function(xhr, status, error) {
                console.error("배송 상태를 확인하는 중 오류 발생:", error);
            }
        });
    }
    
    
	//장바구니 수량 제한
	var modal = new bootstrap.Modal(document.getElementById('quantityModal'));
	var confirmedOverLimit = false;
	var quantityInput = document.getElementById('quantityInput');

	quantityInput.addEventListener('input', function(event) {
		var quantity = parseInt(event.target.value);
		if (quantity >= 10 && !confirmedOverLimit) {
			var confirmResult = confirm("선택한 제품 수량이 10개 이상입니다. 계속하시겠습니까?");
			if (!confirmResult) {
				event.target.value = '9';
			} else {
				confirmedOverLimit = true;
			}
		}
	});
	//닫으면 수량 초기화
	var quantityModal = document.getElementById('quantityModal');
	quantityModal.addEventListener('hidden.bs.modal', function() {
		quantityInput.value = '1';
		confirmedOverLimit = false;
	});

	// 장바구니 담기 
	$('.cart-button').click(function() {
	    var productId = $(this).data('product-id'); // 제품 ID 가져오기

	    // 모달에 제품 정보 설정하여 모달 열기
	    $('#quantityModal #productId').val(productId);
	    $('#quantityModal #productName').val($(this).closest('.item-box').find('.textbox h5').text().trim());
	    $('#quantityModal').modal('show');
	});

	$('#addToCartBtn').click(function() {
	    var productId = $('#quantityModal #productId').val(); // 모달에서 선택된 제품 ID 가져오기
	    var quantity = $('#quantityInput').val(); // 수량 입력값 가져오기

	    $.ajax({
	        type: "POST",
	        url: "/ItemToCart",
	        data: {
	            product_id: productId,
	            product_quantity: quantity
	        },
	        success: function(response) {
	            modal.hide(); // 모달 닫기
	            $('#quantityModal #productId').val(''); // 모달 내의 제품 ID 초기화
	            $('#quantityInput').val(''); // 수량 입력값 초기화
	            alert(response.message); // 성공 메시지 표시
	            $('#cartCountIndicator').text(response.cartCount); // 장바구니 아이템 개수 업데이트
	        },
	        error: function(xhr, status, error) {
	            console.error('장바구니 추가 실패:', error); // 오류 발생 시 콘솔에 오류 메시지 출력
	        }
	    });
	});
	
    //배송조회
    $(document).ready(function() {
        $(document).on('click', '.checkDelivery', function() {
        	 var shipCode = $(this).data('ship-code');
        	 console.log(shipCode);
            $.ajax({
                type: "GET",
                url: "/searchShipList",
                data: { ship_code: shipCode },
                success: function(response) {
                    var modalContent = '';
                    if (response.groupedShipList && Object.keys(response.groupedShipList).length > 0) {
                        var shipCode = Object.keys(response.groupedShipList)[0]; // 첫 번째 송장 번호 키 가져오기
                        var group = response.groupedShipList[shipCode];
                        modalContent = '<p><strong>송장번호:</strong> ' + shipCode + '</p>' +
                            '<p><strong>도착지</strong> ' + '<br>' + group[0].arrive + ' ' + group[0].sub_adress + '</p>' +
                            '<a><strong>이동 경로</strong></a>';
                        modalContent += '<ul>';
                        for (var i = 0; i < group.length; i++) {
                            var deliveryStatus = '';
                            switch (group[i].go_on) {
                                case 0:
                                    deliveryStatus = '상품 준비중';
                                    break;
                                case 1:
                                    deliveryStatus = '배송 중';
                                    break;
                                case 2:
                                    deliveryStatus = '하차 완료';
                                    break;
                                case 3:
                                    deliveryStatus = '배송 완료';
                                    break;
                                default:
                                    deliveryStatus = '알 수 없음';
                            }
                            modalContent += '<li>' +
                                '<div style="display: flex; justify-content: center;">' +
                                '<div style="margin-right:20px;"><strong>위치:</strong> ' + group[i].now_location + '</div>' +
                                '<div style="float:left;"><strong>배송 상태:</strong> ' + deliveryStatus + '</div>' +
                                '</div>' +
                                '</li>';
                        }
                        modalContent += '</ul>';
                    } else {
                        modalContent = '<p>해당하는 송장 정보가 없습니다.</p>';
                    }

                    $('.modal-contentinfo').html(modalContent);
                    $('.infoshipitem').css('display', 'flex');
                },
                error: function(xhr, status, error) {
                    // 에러 처리 로직
                    console.error(error);
                }
            });
        });
    });
    $(document).on('click', '.close-infobutton', function() {
        $('.infoshipitem').hide();
    });
    </script>
</body>
<!-- footer start -->
<%@ include file="../footer.jsp" %>
<!-- footer End -->
</html>