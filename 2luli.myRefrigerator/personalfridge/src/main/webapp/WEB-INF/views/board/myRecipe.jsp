<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
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
	    table {
		  border-collapse: collapse;
		  border-spacing: 0;
		}
		section.notice {
		  padding: 80px 0;
		}
		
		.page-title {
		  margin-bottom: 60px;
		}
		.page-title h3 {
		  font-size: 28px;
		  color: #333333;
		  font-weight: 400;
		  text-align: center;
		}
		
		#board-search .search-window {
		  padding: 15px 0;
		}
		#board-search .search-window .search-wrap {
		  position: relative;
		/*   padding-right: 124px; */
		  margin: 0 auto;
		  width: 80%;
		  max-width: 564px;
		}
		#board-search .search-window .search-wrap input {
		  height: 40px;
		  width: 100%;
		  font-size: 14px;
		  padding: 7px 14px;
		  border: 1px solid #fc9a9a;
		}
		#board-search .search-window .search-wrap input:focus {
		  border-color: #333;
		  outline: 0;
		  border-width: 1px;
		}
		#board-search .search-window .search-wrap .btn {
		  position: absolute;
		  right: 0;
		  top: 0;
		  bottom: 0;
		  width: 108px;
		  padding: 0;
		  font-size: 16px;
		}
		
		.board-table {
		  font-size: 13px;
		  width: 100%;
		
		}
		
		.board-table a {
		  color: #333;
		  display: inline-block;
		  line-height: 1.4;
		  word-break: break-all;
		  vertical-align: middle;
		}
		.board-table a:hover {
		  text-decoration: underline;
		}
		.board-table th {
		  text-align: center;
		}
		
		.board-table .th-num {
		  width: 100px;
		  text-align: center;
		}
		
		.board-table .th-date {
		  width: 200px;
		}
		
		.board-table th, .board-table td {
		  padding: 14px 0;
		}
		
		.board-table tbody td {
		  border-top: 1px solid #e7e7e7;
		  text-align: center;
		}
		
		.board-table tbody th {
		  padding-left: 28px;
		  padding-right: 14px;
		  border-top: 1px solid #e7e7e7;
		  text-align: left;
		}
		
		.board-table tbody th p{
		  display: none;
		}
		
		.btn {
		  display: inline-block;
		  padding: 0 30px;`
		  font-size: 15px;
		  font-weight: 400;
		  background: transparent;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: middle;
		  -ms-touch-action: manipulation;
		  touch-action: manipulation;
		  cursor: pointer;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		  border: 1px solid transparent;
		  text-transform: uppercase;
		  -webkit-border-radius: 0;
		  -moz-border-radius: 0;
		  border-radius: 0;
		  -webkit-transition: all 0.3s;
		  -moz-transition: all 0.3s;
		  -ms-transition: all 0.3s;
		  -o-transition: all 0.3s;
		  transition: all 0.3s;
		}
		
		.btn-dark {
		  background: #fc9a9a;
		  color: #fff;
		}
		
		
		
		
		.btn-dark:hover, .btn-dark:focus {
		  background: #dc3545;
		  border-color: #dc3545;
		  color: #fff;
		}
		
		/* reset */
		
		* {
		  list-style: none;
		  text-decoration: none;
		  padding: 0;
		  margin: 0;
		  box-sizing: border-box;
		}
		.clearfix:after {
		  content: '';
		  display: block;
		  clear: both;
		}
		.container {
		  width: 1100px;
		  margin: 0 auto;
		}
		.blind {
		  position: absolute;
		  overflow: hidden;
		  clip: rect(0 0 0 0);
		  margin: -1px;
		  width: 1px;
		  height: 1px;
		}
		td {
		    border-left: white !important;
		    border-right: white !important;
		    border-bottom: 1px solid #fc9a9a;
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
            <h1 class="text-center text-white display-6">나만의 레시피</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/recipeshop">이루리 요리책</a></li>
                <li class="breadcrumb-item active text-white">나만의 레시피</li>
            </ol>
        </div>
        <!-- Single Page Header End -->
		
		
		
<section class="notice">

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="searchInput1" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button id="searchButton" type="submit" class="btn btn-dark">검색</button>
                    </div>
            </div>
        </div>
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-id">작성자</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boards}" var="board">
						<tbody>
							<tr>
								<td>${board.board_no}</td>
								<td><a href="/view?boardNo=${board.board_no}">${board.title}</a></td>
								<td>${board.user_id}</td>
								<td><fmt:formatDate value="${board.board_create_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</tbody>
				</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
		<div class="col-12">
		<div class="pagination d-flex justify-content-center mt-5"
			id="paginationContainer">
			<!-- 총 페이지 수 계산 -->
			<c:set var="totalPages" value="${pageInfo.pageAmount}" />
			<div class="col-auto">
				<nav class="page navigation">
					<ul class="pagination">
						<!-- Prev 버튼 -->
						<c:if test="${pageInfo.prev}">
							<li class="page-item"><a
								class="page-link rounded ${pageInfo.startPage - 1 == pageInfo.currentPage ? 'active' : ''}"
								href="#" data-value="${pageInfo.startPage - 1}"
								aria-label="Previous">Prev</a></li>
						</c:if>

						<!-- 페이지 버튼 -->
						<c:forEach var="pageNumber" begin="1" end="${totalPages}">
							<li class="page-item"><a href="#"
								class="page-link rounded ${pageNumber == pageInfo.currentPage ? 'active' : ''}"
								data-value="${pageNumber}"> ${pageNumber} </a></li>
						</c:forEach>

						<!-- Next 버튼 -->
						<c:if test="${pageInfo.next}">
							<li class="page-item next"><a
								class="page-link rounded ${pageInfo.endPage + 1 == pageInfo.currentPage ? 'active' : ''}"
								href="#" data-value="${pageInfo.endPage + 1}"
								aria-label="next">Next</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
               <c:if test="${not empty sessionScope.userId}">
               	<a href="/mypage/boardInsert" style="float:right; border: 1px solid #ffB524; padding:10px">글쓰기</a>
               </c:if>
</section>
		
	<!-- Fruits Shop End-->
	
	<!-- footer start -->
	<%@ include file="../footer.jsp"%>
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
	var CategoryNo = 3;
	var keyword = "";
	var page = 1;

	$('#searchButton').on('click', function() {
	    executeSearch();
	});
	
	// Enter 키를 누를 때 검색 실행
	$('#searchInput1').on('keypress', function(e) {
	    if (e.which === 13) { // Enter 키를 누르면
	        executeSearch();
	    }
	});

	 // 검색 실행 함수
	 function executeSearch() {
	     keyword = $('#searchInput1').val().trim();
	     console.log(keyword);
	     getBoardByCategoryNoAndSearch(CategoryNo, keyword, page);
	 }
 
	function getBoardByCategoryNoAndSearch(CategoryNo, keyword, page) {
	    var pageSize = 10; // 페이지당 아이템 수
	    $.ajax({
	        type: "GET",
	        url: "/getBoardByCategoryNoAndSearch",
	        data: {
	        	CategoryNo : CategoryNo,
	         	keyword: keyword,
	            page : page,
	            pageSize : pageSize
	        },
	        success: function(response) {
	        	updateBoards(response);
            },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
	}
	
	
	function updateBoards(response) {
	    $('#board-list').empty();

	    var boardListHTML = '';
	    $.each(response.boards, function(index, board) {
	        boardListHTML += '<tr>' +
	            '<td>' + board.board_no + '</td>' +
	            '<td><a href="/view?boardNo=' + board.board_no + '">' + board.title + '</a></td>' +
	            '<td>' + board.user_id + '</td>' +
	            '<td>' + formatDate(board.board_create_date) + '</td>' +
	            '</tr>';
	    });


	    $('#board-list').html('<div class="container">' +
	        '<table class="board-table">' +
	        '<thead>' +
	        '<tr>' +
	        '<th scope="col" class="th-num">번호</th>' +
	        '<th scope="col" class="th-title">제목</th>' +
	        '<th scope="col" class="th-id">작성자</th>' +
	        '<th scope="col" class="th-date">등록일</th>' +
	        '</tr>' +
	        '</thead>' +
	        '<tbody>' +
	        boardListHTML +
	        '</tbody>' +
	        '</table>' +
	        '</div>');
	    $('#paginationContainer').empty();
	    createPaginationButtons(response.pageInfo);
	}

	function formatDate(dateStr) {
	    var date = new Date(dateStr);
	    return date.getFullYear() + '-' + (date.getMonth() + 1).toString().padStart(2, '0') + '-' + date.getDate().toString().padStart(2, '0');
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
	
	$('#paginationContainer').on('click', 'a', function(e) {
	    e.preventDefault();
	    page = $(this).data('value'); // 클릭된 링크의 data-value 속성 값을 가져오기
	    if (page === 'Prev' || page === 'Next') {
	        // Prev 또는 Next 링크를 클릭한 경우
	        page = $(this).attr('value');
	    }
	    getBoardByCategoryNoAndSearch(CategoryNo,keyword, page);
	});
	
	
	</script>
</body>
</html>
