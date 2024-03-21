<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
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
	        padding: 10px;
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
	         background-color: rgba(255, 255, 255, 1); 
	         padding: 10px;
	         border-radius: 5px;
	         z-index: 9999;
	         color: black; 
	         box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
		}
		
		.modal-content {
		    text-align: center;
		    display: flex;
		    justify-content: center;
		}
		
		.button-container button {
		    margin: 0 10px; /* 버튼들 사이의 간격을 설정 */
		}
		
		.modal-button {
		    width: 100px;
		}
		</style>
</head>
<body>
  		<!-- Slidebar start -->
       <%@ include file="adminslidebar.jsp" %>
        <!-- Slidebar End -->
        
        	<!-- 페이지당 아이템 수와 현재 페이지 설정 -->
		<c:set var="pageSize" value="12" />
		<c:set var="currentPage" value="${not empty param.page ? param.page : 1}" />
		
		<div class="col-lg-11">
       <div class="row justify-content-center" style="margin-top: 200px; width: 40%; margin-left: 620px; ">
           <c:forEach var="user" items="${userlist}">
                <div class="card">
                   <div class="card-head"> <!-- 삭제 버튼을 포함할 요소 -->
                        <div class="cardbtn">
			       		</div>
			        </div>
       				<div class="card-info">
                    <div class="user-id" style="display: none;">${user.user_id}</div>
       				<div class="user-name" style="display: none;">${user.user_name}</div>
                        <a>아이디 : ${user.user_id}</a>
                        <a style=margin-left:10px;>이름 : ${user.user_name}</a>
                        </div>
                </div>
            </c:forEach>
            </div>
			 <div class="col-12">
			                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer" style="margin-left:130px;" >
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
			        
		
		
		<!-- 사용자 전환 모달 창 -->
	    <div id="ManagerContainer" class="modal-container">
		    <div class="modal-content" id="manager-content">
		        <p>매니저를 사용자로 전환하십니까?</p>
		        <p>매니저 이름: <span class="user-name"></span></p>
		        <div class="button-container">
			        <button id="confirmUpdateButton" class="modal-button" style="background-color: red; color: white;">네</button>
			        <button id="cancelUpdateButton" class="modal-button" style="background-color: green; color: white;">아니오</button>
			    </div>
			  </div>
		</div>
        	                 
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
$(document).ready(function() {
    var keyword = "";
    var page = 1;
    // 수정/삭제버튼 생성
    addUpdateAndDeleteButtons();
    initializeSearchField();
    bindSearchEvents();
    
 // 검색 버튼 클릭 및 엔터 키 이벤트를 바인딩
    function bindSearchEvents() {
        $('#searchButton').on('click', function() {
            executeSearch();
        });

        $('#searchInput1').on('keypress', function(e) {
            if (e.which === 13) { // Enter 키를 누르면
                executeSearch();
            }
        });
    }

    // 검색 실행 함수
    function executeSearch() {
         keyword = $('#searchInput1').val().trim();
         getManagerByKeyword(keyword, 1);
    }

    // 페이지 버튼 클릭 이벤트 핸들러 등록
    $('#paginationContainer').on('click', 'a', function(e) {
        e.preventDefault();
        page = $(this).data('value'); // 클릭된 링크의 data-value 속성 값을 가져오기
        if (page === 'Prev' || page === 'Next') {
		        // Prev 또는 Next 링크를 클릭한 경우
		        page = $(this).attr('value');
		    } 
        if (keyword !== "") {
        	getManagerByKeyword(keyword, page); 
        } else {
        	 getAllManager(page); 
        }
    });


    function getAllManager(page) {
        var pageSize = 12; // 페이지당 아이템 수
        $.ajax({
            type: "GET",
            url: "/getAllManagerrAndPage",
            data: {
            	keyword: "",
                page: page,
                pageSize: pageSize
            },
            success: function(response) {
                updateUser(response);
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
    //검색한 단어로 매니저 불러오기
	function getManagerByKeyword(keyword, page) {
	    var pageSize = 12;
	    // AJAX 요청 보내기
	    $.ajax({
	        type: "GET",
	        url: "/getAllManagerrAndPage",
	        data: {
	            keyword: keyword,
	            page: page,
	            pageSize: pageSize
	        },
	        success: function(response) {
	        	 updateUser(response);
            },
	        error: function(xhr, status, error) {
	            // 에러 처리 로직
	            console.error(error);
	        }
	    });
	}


    function updateUser(response) {
        var UserListContainer = $('.col-lg-11 .row'); 
        UserListContainer.empty(); // 기존 상품 목록 비우기

        // 받아온 데이터를 페이지에 맞게 출력
        $.each(response.userlist, function(index, user) {

            var userHTML = '<div class="card">' +
                '<div class="card-info">' +
                '<div class="user-id" style="display: none;">' + user.user_id + '</div>' +
                '<div class="user-name" style="display: none;">' + user.user_name + '</div>' +
                '<a>아이디 : ' +user.user_id + '</a>' +
                '<a style=margin-left:10px;>이름 : ' + user.user_name + '</a>' +
                '</div>' +
                '</div>';
            UserListContainer.append(userHTML); // 새로운 상품을 기존의 상품 목록에 추가
        });
 
        $('#paginationContainer').empty();
        // 페이징 버튼 업데이트
        createPaginationButtons(response.pageInfo);
        addUpdateAndDeleteButtons();
        initializeSearchField();
        bindSearchEvents();
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
	
  //검생창 생성 함수
  function initializeSearchField() {
      var inputGroupHTML = `
      	<div class="input-group mb-3" style="margin-left:140px;">
          <div class="input-group-prepend">
              <button class="btn btn-secondary" onclick="window.location.href='/userListadmin'" type="button" id="viewAllButton">전체보기</button>
          </div>
          <input type="text" class="form-control" style="max-width: 400px;" placeholder="정보를 입력해주세요" id="searchInput1">
          <div class="input-group-append">
              <button class="btn btn-outline-secondary" type="button" id="searchButton">검색</button>  
          </div>
      </div>`;
      // 새로운 입력 필드 추가
      $('.col-lg-11 .row').prepend(inputGroupHTML);
     
  }

  
    // 수정과 삭제 버튼을 추가하는 함수
    function addUpdateAndDeleteButtons() {
        // 모든 card-info 요소에 대해 작업
        $('.card-info').each(function() {
            // 현재 요소에 새로운 버튼 추가
            var ButtonsHTML = `
                <div class="cardbtn">
                    <button class="btn btn-primary update-user-btn" style="width: fit-content;">사용자 전환</button> 
                </div>`;
            // 현재 요소의 내부에 새로운 버튼 추가
            $(this).prepend(ButtonsHTML);
        });

        // 사용자 전환 이벤트 및 버튼
        $('.update-user-btn').click(function() {
            var UserId = $(this).closest('.card').find('.user-id').text();
            var UserName = $(this).closest('.card').find('.user-name').text();
            // 관리자 등록 모달을 표시하고 확인 버튼과 취소 버튼에 대한 이벤트 리스너 추가
            var modalContainer = document.getElementById("ManagerContainer");
            var confirmButton = document.getElementById("confirmUpdateButton");
            var cancelButton = document.getElementById("cancelUpdateButton");
            var modalContent = document.querySelector('#manager-content');
            var modalUsertName = modalContent.querySelector('.user-name');

            // 모달 내용 설정
            modalUsertName.textContent = UserName;
            modalContainer.style.display = "block"; // 모달 열기
            confirmUpdateButton.dataset.userId= UserId; 

            cancelUpdateButton.onclick = function() {
                modalContainer.style.display = "none";
                isModalOpen = false; // 모달 닫을 때 상태 변경
            }

            confirmUpdateButton.onclick = function() {
                var UserId = confirmButton.dataset.userId; 
                window.location.href = '/managerupdateadmin/' + UserId; 
            }

        });


    }
});
</script>
</body>
</html>