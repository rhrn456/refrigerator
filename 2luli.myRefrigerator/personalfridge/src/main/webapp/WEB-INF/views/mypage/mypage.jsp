<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title>마이페이지</title>
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
        .modal-container {
		         display: none;
		         position: fixed;
		         top: 50%;
		         left: 50%;
		         transform: translate(-50%, -50%);
		         background-color: rgba(255, 255, 255, 1); 
		         padding: 20px;
		         border: 2px solid black;
		         border-radius: 5px;
		         z-index: 9999;
		         color: black; 
		         box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
		}
		
		.modal-content {
		          text-align: center;
		}
		
		.modal-button {
		          margin-top: 20px;
		}
        </style>
    </head>
    
    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->





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


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">My Page</h1>     
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>마이 페이지</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
									                <div class="d-flex justify-content-between allproduct">
									                    <a href="/productshop"><i class="fas fa-apple-alt me-2"></i>회원정보 수정</a>
									                </div>
									            </li>
									            <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>찜한 레시피</a>
                                                        
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>다이어트</a>
                                                        
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>배송조회</a>
                                                     
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>구매내역</a>
                                                      
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>주문취소</a>
                                                      
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>환불/교환 문의</a>
                                                       
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between product-category" id="deleteButton">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>회원탈퇴</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
														<!-- 페이지당 아이템 수와 현재 페이지 설정 -->
						
							
							<div class="col-lg-9">
								<div class="box" style="text-align: center;" >
									<h2>회원 정보</h2>

									<!-- 사용자 정보 표시 -->
									<p>ID: ${mypage.user_id}</p>
									<p>닉네임: ${mypage.user_name}</p>
									<p>이메일: ${mypage.mail}</p>
									<p>주소: ${mypage.adress}</p>
									<p>핸드폰 번호: ${mypage.phone}</p>
								</div>
								
								<!-- 모달창: 삭제 확인 -->
								<div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="deleteConfirmationModalLabel">삭제 확인</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <span aria-hidden="true">&times;</span>
								                </button>
								            </div>
								            <div class="modal-body">
								                <p>정말 삭제하시겠습니까? 삭제하면 복구되지 않아요.</p>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
								                <a href="delete.board?bno=${bno}" class="btn btn-danger">네</a>
								            </div>
								        </div>
								    </div>
								</div>
								
								
								<!-- 회원탈퇴 -->
<form action="/mypage/deleteUser" method="post" onsubmit="return confirm('정말로 계정을 탈퇴하시겠습니까?');">
    <input type="submit" value="회원 탈퇴"/>
</form>

							    <div class="row g-4 justify-content-center">
							        <!-- 상품 목록을 페이지에 맞게 자르기 -->
							        <c:forEach var="product" items="${products}" >
							                <div class="col-md-6 col-lg-6 col-xl-4">
							                    <div class="rounded position-relative fruite-item">
							                        <div class="fruite-img">
							                            <img src="${product.product_img}" class="img-fluid w-100 rounded-top" alt="" style="max-width: 300px; max-height: 150px;">
							                        </div>
							                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px; background-color: green !important;">${product.product_category}</div>
							                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
							                            <h4>${product.product_name}</h4>
							                            <p>${product.product_content}</p>
							                            <p>유통기한 : 구매일로부터 ${product.limit_date}일</p>
							                            <div class="d-flex justify-content-between flex-lg-wrap">
							                                <p class="text-dark fs-5 fw-bold mb-0">${product.product_price}</p>
							                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
							                            </div>
							                        </div>
							                    </div>
							                </div>
							        </c:forEach>
							    </div>
								 <div class="col-12">
						                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer" >
							                 <!-- 총 페이지 수 계산 -->
						                    <c:set var="totalPages" value="${pageInfo.pageAmount}" />
											<div class="col-auto">
											    <nav class="page navigation">
											        <ul class="pagination">
											            <!-- Prev 버튼 -->
											            <c:if test="${pageInfo.prev}">
											                <li class="page-item">
											                    <a class="page-link rounded ${pageInfo.startPage - 1 == pageInfo.currentPage ? 'active' : ''}"
											                       href="#" data-value="${pageInfo.startPage - 1}" aria-label="Previous">Prev</a>
											                </li>
											            </c:if>
											            
											            <!-- 페이지 버튼 -->
											            <c:forEach var="pageNumber" begin="1" end="${totalPages}">
											                <li class="page-item">
											                    <a href="#" class="page-link rounded ${pageNumber == pageInfo.currentPage ? 'active' : ''}" data-value="${pageNumber}">
											                        ${pageNumber}
											                    </a>
											                </li>
											            </c:forEach>
											            
											            <!-- Next 버튼 -->
											            <c:if test="${pageInfo.next}">
											                <li class="page-item next">
											                    <a class="page-link rounded ${pageInfo.endPage + 1 == pageInfo.currentPage ? 'active' : ''}"
											                       href="#" data-value="${pageInfo.endPage + 1}" aria-label="next">Next</a>
											                </li>
											            </c:if>
											        </ul>
											    </nav>
						                      </div>
						                </div>
						            </div> <!-- col-12 끝 -->
							   </div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="modalContainer" class="modal-container">
        <div class="modal-content">
            <p>회원 탈퇴를 진행하시겠습니까?<br>비밀번호를 적어주세</p>
           <input type="password" class="form-comtrol form-control-user" id="password" name="password" placeholer="password">
            <button id="confirmDeleteButton" class="modal-button">네</button>
            <button id="cancelDeleteButton" class="modal-button">아니오</button>
        </div>
    </div>
        <!-- Fruits Shop End-->
        
        <script>
		$(document).ready(function(){
			$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
				let sendData = "username="+$('input[name=username]').val();   //폼의 이름 값을 변수 안에 담아줌
				$.ajax({
					type:'post',   //post 방식으로 전송
					url:'jQueryAjax02_data.jsp',   //데이터를 주고받을 파일 주소
					data:sendData,   //위의 변수에 담긴 데이터를 전송해준다.
					dataType:'html',   //html 파일 형식으로 값을 담아온다.
					success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
						$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
					}
				});
			});
		});
		</script>
        
        <script type="text/javascript">
      //모달창이 작동하는 함수
 		var deleteButton = document.getElementById("deleteButton");
        var modalContainer = document.getElementById("modalContainer");
        var confirmButton = document.getElementById("confirmDeleteButton");
        var cancelButton = document.getElementById("cancelDeleteButton");

        deleteButton.onclick = function() {
            modalContainer.style.display = "block";
        }

        cancelButton.onclick = function() {
            modalContainer.style.display = "none";
        }

        confirmButton.onclick = function() {
             window.location.href = '/userDelete/' + password;
        }
        </script>


        



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
		$(document).ready(function() {
			var category ="";
		    var keyword = "";
		    var page = 1;
		</script>
    </body>
     <!-- footer start -->
       <%@ include file="../footer.jsp" %>
        <!-- footer End -->
</html>