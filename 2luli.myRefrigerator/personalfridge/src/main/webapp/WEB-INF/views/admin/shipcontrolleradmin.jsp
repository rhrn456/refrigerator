<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 관리</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

		<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
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
    	<link href="css/adminhead.css" rel="stylesheet">

     <!-- Navbar start -->
       <%@ include file="../header.jsp" %>
        <!-- Navbar End -->
        <style>  
	    .card {
	        width: 700px; /* 카드의 너비 조정 */
	        border: 1px solid #ccc;
	        border-radius: 5px;
	        margin-left:10px;
	        padding: 20px;
	        margin-bottom: 10px;
	        background-color: #fff; /* 배경색 */
	        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 */
	    }
	
	    .card-info {
	        font-size: 16px;
	        margin-bottom: 5px;
	        color:black;
	        display: flex;
	        
	    }
	
		.cardbtn {
		    position: absolute;
		    top: 48%; /* 부모 요소의 상단에서 50% 떨어진 위치로 설정 */
		    transform: translateY(-50%); /* 버튼의 중심을 부모 요소의 중심에 맞춤 */
		    right: 10px;
		    font-size: 14px;
		    text-align: center; /* 버튼을 가운데 정렬하기 위해 필요 */
		    display: flex;
		    
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
		
		.modal-content {
		    text-align: center;
		    display: flex;
		    width:250px;
		    height:150px;
		    border: none;
		    border-radius: 5px;
    		outline: none;
		    justify-content: center;
		}
		
		.confirm-button {
		    background-color: red;
		    border: none;
		    color: white;
		}
	
		.cancel-button {
		    background-color: green;
		    border: none;
		    color: white;
		}
		.button-container button {
		    margin: 0 10px; /* 버튼들 사이의 간격을 설정 */
		}
		
		.modal-button {
		    width: 100px;
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
		    width:300px;
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

		</style>
</head>
<body>
  		<!-- Slidebar start -->
       <%@ include file="adminslidebar.jsp" %>
        <!-- Slidebar End -->
        
				
		<div class="col-lg-11">
		    <div class="row justify-content-center" style="margin-top: 200px; width: 40%; margin-left: 670px; ">
		        <c:forEach var="ship" items="${shipList}">
		            <div class="card">
		                <div class="card-head"> <!-- 삭제 버튼을 포함할 요소 -->
		                    <div class="cardbtn">
		                    </div>
		                </div>
		                <div class="card-info" style="margin-bottom:-2px;">
		                    <!-- 송장 번호를 한 번만 표시하도록 수정 -->
		                    <span class="header-text" style="display: none;">${ship.ship_code}</span>
		                    <a><strong>사용자:</strong> ${ship.user_id}<strong style="margin-left:5px;">송장 번호:</strong>${ship.ship_code}</a> <!-- 송장 번호 표시 -->
		                    
		                    <!-- 각 그룹의 첫 번째 항목에 대한 정보만 표시 -->
		                    <div class="user-id" style="display: none;">${ship.user_id}</div>
		                    <div class="arrive" style="display: none;">${ship.arrive}</div>
		                    
		                    <!-- 필요한 경우 추가적인 정보 표시 -->
		                </div>
		            </div>
		        </c:forEach>
		    </div>
		</div>
              <div class="col-12">
                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer" style="margin-left:70px;" >
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
            </div> 
        </div>
		
		<div class="infoshipitem modal-container">
		    <div class="modal-contentinfo">
		        <!-- 정보가 여기에 추가됩니다 -->
		    </div>
		        <button class="close-infobutton">닫기</button>
		</div>
		
		<!-- 발송 모달 창 -->
	    <div id="ShipContainer" class="modal-container">
		    <div class="modal-content" id="manager-content">
		        <p>배송을 시작하나요?</p>
		        <p><strong>송장 번호:</strong><span class="ship-code"></span></p>
		        <div class="button-container">
			        <button id="confirmShipButton" class="modal-button confirm-button" style="background-color: red; color: white;">네</button>
			        <button id="cancelShipButton" class="modal-button cancel-button" style="background-color: green; color: white;">아니오</button>
			    </div>
			  </div>
		</div>
	 <div style="height:100px;">
	
	 </div>           
   		<!-- footer start -->
       <%@ include file="../footer.jsp" %>
        <!-- footer End -->
		     
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    
<script>
$(document).ready(function() {
    var page = 1;
    addDeleveryAndShipInfo();
    
   
    
    //발송하기
    $(document).on('click', '.delevery', function() {
    // 클릭된 카드의 송장 번호 가져오기
    var shipCode = $(this).closest('.card-info').find('.header-text').text().trim();
    
    // 모달에 송장 번호 삽입
    $('#ShipContainer .ship-code').text(shipCode);
    
    // 모달 열기
    $('#ShipContainer').show();
	});
    
    // 모달 닫기
    $(document).on('click', '#cancelShipButton', function() {
        $('#ShipContainer').hide();
    });
    
    $(document).on('click', '#confirmShipButton', function() {
        // 모달에서 송장 번호 가져오기
         var ship_code = $('#ShipContainer .ship-code').text().trim();
        console.log(ship_code);
        // startShip로 요청 보내기
        $.ajax({
            type: "POST",
            url: "/admin/startShip",
            data: { ship_code: ship_code },
            success: function(response) {
                console.log('배송 시작 요청 성공');
                window.location.reload();
            },
            error: function(xhr, status, error) {
                console.error('배송 시작 요청 실패');
                console.error(error);
            }
        });
    });
    
    
    
    // 페이지 버튼 클릭 이벤트 핸들러 등록
    $('#paginationContainer').on('click', 'a', function(e) {
        e.preventDefault();
        var page = $(this).data('value'); // 클릭된 링크의 data-value 속성 값을 가져오기
        if (page === 'Prev' || page === 'Next') {
		        // Prev 또는 Next 링크를 클릭한 경우
		        page = $(this).attr('value');
		    } 
        getShipByKeword(page);
       
    });

  //검색한 단어로 사용자 불러오기
	function getShipByKeword(page) {
	    var pageSize = 12;
	    // AJAX 요청 보내기
	    $.ajax({
	        type: "GET",
	        url: "/admin/getShipByPage",
	        data: {
	            page: page,
	            pageSize: pageSize
	        },
	        success: function(response) {
	        		updatShip(response);
            },
	        error: function(xhr, status, error) {
	            // 에러 처리 로직
	            console.error(error);
	        }
	    });
	}

	    // 받아온정보를 업데이트하는 함수
	function updatShip(response) {
	    var ShipListContainer = $('.col-lg-11 .row'); 
	    ShipListContainer.empty(); 
	    // 받아온 데이터를 페이지에 맞게 출력
	    $.each(response['shipList'], function(index, shipItem) {
	        var shipHTML = '<div class="card">' +
	            '<div class="card-head">' +
	            '<div class="cardbtn"></div>' +
	            '</div>' +
	            '<div class="card-info" style="margin-bottom:-2px;">' +
	            '<span class="header-text" style="display: none;">' + shipItem.ship_code + '</span>' +
	            '<a><strong>사용자:</strong>' + shipItem.user_id + '<strong style="margin-left:5px;">송장 번호:</strong> ' + shipItem.ship_code + '</a>' +
	            '<div class="user-id" style="display: none;">' + shipItem.user_id + '</div>' +
	            '<div class="arrive" style="display: none;">' + shipItem.arrive + '</div>' +
	            '</div>' +
	            '</div>';
	        // 생성된 상품 HTML을 기존의 상품 목록에 추가
	        ShipListContainer.append(shipHTML);
	    });
	    
	
	    $('#paginationContainer').empty();
	    // 페이징 버튼 업데이트
	    createPaginationButtons(response['pageInfo']);
	    addDeleveryAndShipInfo();
	}

    // 페이지 버튼 생성 함수
    function createPaginationButtons(pageInfo) {
        var paginationContainer = $('#paginationContainer');
        var paginationHTML =
            '<div class="col-auto">' +
            '<nav class="page navigation">' +
            '<ul class="pagination">';

        if (pageInfo.prev) {
            paginationHTML += '<li class="page-item">' +
                '<a class="page-link rounded ' + (pageInfo.startPage - 1 === pageInfo.currentPage ? 'active' : '') + '" aria-label="Previous" data-value="' + (pageInfo.startPage - 1) + '" href="#">Prev</a>' +
                '</li>';
        }

        for (var num = pageInfo.startPage; num <= pageInfo.endPage; num++) {
            paginationHTML += '<li class="page-item ' + (pageInfo.currentPage == num ? "active" : "") + '">' +
                '<a class="page-link rounded ' + (num == pageInfo.currentPage ? 'active' : '') + '" href="#" data-value="' + num + '">' + num + '</a>' +
                '</li>';
        }

        if (pageInfo.next) {
            paginationHTML += '<li class="page-item next">' +
                '<a class="page-link rounded" aria-label="next" data-value="' + (pageInfo.endPage + 1) + '" href="#">Next</a>' +
                '</li>';
        }

        paginationHTML += '</ul>' +
            '</nav>' +
            '</div>';
        paginationContainer.append(paginationHTML);
    }
	
    
 // 모달이 열려 있는지 여부를 추적하는 변수
    var isModalOpen = false;

    function addDeleveryAndShipInfo() {
        $('.card-info').each(function() {
            var ButtonsHTML = `
                <div class="cardbtn">
                    <button class="btn btn-primary delevery" >발송 하기</button>
                    <button class="btn btn-danger shipinfo" style="margin:0 5px;" >정보 보기</button>
                </div>`;
            $(this).prepend(ButtonsHTML);
     });
    }

     $(document).ready(function() {
    $(document).on('click', '.shipinfo', function() {
        var shipCode = $(this).closest('.card').find('.header-text').text();
        console.log(shipCode);

        $.ajax({
            type: "GET",
            url: "/admin/getshipItemlist",
            data: { ship_code: shipCode },
            success: function(response) {
                console.log(response);

                var modalContent = '';
                if (response.groupedShipList && Object.keys(response.groupedShipList).length > 0) {
                    var shipCode = Object.keys(response.groupedShipList)[0]; // 첫 번째 송장 번호 키 가져오기
                    var group = response.groupedShipList[shipCode];
                    modalContent = '<p><strong>송장번호:</strong> ' + shipCode + '</p>' +
                    '<p><strong>도착지:</strong> ' + '<br>' + group[0].arrive + ' ' + group[0].sub_adress + '</p>' +
                    '<a><strong>제품:</strong></a>' +
                    '<ul>';
				    for (var i = 0; i < group.length; i++) {
				        var specialProductStyle = group[i].special_product == 1 ? 'font-weight: bold; margin-left:5px; color:white; background-color: #ffb524; padding: 2px 5px; border-radius: 3px;' : 'font-weight: bold; margin-left:5px; color:white; background-color: #dc2e5e; padding: 2px 5px; border-radius: 3px;';
				        var specialProductText = group[i].special_product == 1 ? '특가' : '일반';
				        modalContent += '<li>' + group[i].product_name + ' (' + group[i].product_quantity + '개)<span style="' + specialProductStyle + '">' + specialProductText + '</span></li>';
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


    $(document).on('click', '.close-infobutton', function() {
        $('.infoshipitem').hide();
    });
     });
 });
    


</script>
</body>
</html>