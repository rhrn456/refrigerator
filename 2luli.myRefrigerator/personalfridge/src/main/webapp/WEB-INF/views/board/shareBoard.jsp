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
	<%@ include file="../header.jsp"%>
	<!-- Navbar End -->
</head>

<body>
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->
		
		
		
        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">공유 게시판</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/board?CategoryNo=1">공지사항</a></li>
                <li class="breadcrumb-item active text-white">공유 게시판</li>
            </ol>
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
                                            <h4>카테고리</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="/board?CategoryNo=1"><i class="fas fa-apple-alt me-2"></i>공지사항</a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i class="fas fa-apple-alt me-2"></i>공유 게시판</a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:set var="pageSize" value="9" />
							<c:set var="currentPage" value="${not empty param.page ? param.page : 1}" />
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                <table>
									<thead>
										<tr>
											<th>글 번호</th>
											<th>제목</th>
											<th>I D</th>
											<th>작성날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<c:forEach items="${boards}" var="board">
											<tbody>
												<tr>
													<td>${board.board_no}</td>
													<td><a href="/view?boardNo=${board.board_no}">${board.title}</a></td>
													<td>${board.user_id}</td>
													<td><fmt:formatDate value="${board.board_create_date}" pattern="yyyy-MM-dd" /></td>
													<td>${board.hit}</td>
												</tr>
											</tbody>
									</c:forEach>
								</table>
								
								<div class="col-12">
					                <div class="pagination d-flex justify-content-center mt-5" id="paginationContainer">
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
					                <c:if test="${not empty sessionScope.userId}">
					                	<a href="/boardInsert" style="float:right; border: 1px solid #ffB524; padding:10px">글쓰기</a>
					                </c:if>
					            </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->
	
	<!-- footer start -->
	<%@ include file="../footer.jsp"%>
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
	<script src="js/main.js">
	var CategoryNo = "";
	
	function getBoardByCategoryNo(CategoryNo, page) {
	    var pageSize = 10; // 페이지당 아이템 수
	    
	    $.ajax({
	        type: "GET",
	        url: "/getBoardByCategoryNo",
	        data: {
	        	CategoryNo : CategoryNo,
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
	
	function createPaginationButtons(totalPages, currentPage) {
	    var paginationContainer = $('#paginationContainer');
	    paginationContainer.empty();
	    
	    for (var i = 1; i <= totalPages; i++) {
	        var button = $('<a href="#" class="page-link rounded ' + (i == currentPage ? 'active' : '') + '">' + i + '</a>');
	        paginationContainer.append(button);
	    }
	
	}
	
	$('#paginationContainer').on('click', 'a', function(e) {
	    e.preventDefault();
	    page = $(this).data('value'); // 클릭된 링크의 data-value 속성 값을 가져오기
	    if (page === 'Prev' || page === 'Next') {
	        // Prev 또는 Next 링크를 클릭한 경우
	        page = $(this).attr('value');
	    }
	    getBoardByCategoryNo(CategoryNo, page);
	});
	
	</script>
</body>
</html>
