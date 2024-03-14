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
</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar start -->
	<%@ include file="../header.jsp"%>
	<!-- Navbar End -->
	
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
													<a href="#"><i class="fas fa-apple-alt me-2"></i>공지사항</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=2"><i class="fas fa-apple-alt me-2"></i>공유 게시판</a>
												</div>
											</li>
											<li>
												<div class="d-flex justify-content-between fruite-name">
													<a href="/board?CategoryNo=3"><i class="fas fa-apple-alt me-2"></i>나만의 레시피</a>
												</div>
											</li>
										</ul>
									</div>
									
									<div class="container">
										<h2>게시글 상세 화면</h2>
								    	<table class="BoardDetail">
											<colgroup>
												<col width="15%"/>
												<col width="35%"/>
												<col width="15%"/>
												<col width="35%"/>
											</colgroup>
											<caption>게시글 상세내용</caption>
											<tbody>
												<tr>
													<th scope="row">글 번호</th>
													<td th:text="${board.board_no}"></td>
													<th scope="row">조회수</th>
													<td th:text="${board.hit}"></td>
												</tr>
												<tr>
													<th scope="row">작성자</th>
													<td th:text="${board.user_id}"></td>
													<th scope="row">작성일</th>
													<td><fmt:formatDate value="${board.board_create_date}" pattern="yyyy-MM-dd" /></td>
												</tr>
												<tr>
													<th scope="row">제목</th>
													<td colspan="3">${board.title}</td>
												</tr>
												<tr>
													<td colspan="4" class="view_text">${board.content}</td>
												</tr>
											</tbody>
										</table>
									</div>
									
									<%-- <div id="divContent" class="col-xl-9">
					                    <div id="divTitle" class="cont-title">
					                        <h2>공지사항</h2>
					                        <div class="cont-btns btn-group d-print-none">
					                            <button type="button" id="shareButton" data-toggle="dropdown" aria-expanded="false"><i class="material-icons" aria-hidden="true"><span class="sr-only">공유</span>share</i></button>
					                            <ul class="dropdown-menu dropdown-menu-right " aria-labelledby="shareButton">
					                                <li><a class="dropdown-item" href="javascript:void(0);" onclick="snsShare('facebook');" title="새창열림">
					                                    <img src="/common/images/share-sns01.png" alt="" class="mr-1">Facebook</a></li>
					                                <li><a class="dropdown-item" href="javascript:void(0);" onclick="snsShare('twitter');" title="새창열림">
					                                    <img src="/common/images/share-sns02.png" alt="" class="mr-1">Twitter</a></li>
					                                <li><a class="dropdown-item" href="javascript:void(0);" onclick="snsShare('kakao');" title="새창열림">
					                                    <img src="/common/images/share-sns03.png" alt="" class="mr-1">KakaoTalk</a></li>
					                                <li><a class="dropdown-item" href="javascript:void(0);" onclick="snsShare('band');" title="새창열림">
					                                    <img src="/common/images/share-sns04.png" alt="" class="mr-1">Band</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                    <div id="content">
					                        
										    <div id="IContents_divView">
										        <div class="board-view">
										            <div class="board-view-title">
										                <h3><a id="IContents_atitle" class="title" target="_parent">${board.title}</a></h3>
										                <p class="board-info"><span><i class="material-icons notranslate" aria-hidden="true">create</i>&nbsp;${board.user_id}</span>
										                <span id="IContents_span작성일시"><i class="material-icons notranslate" aria-hidden="true">access_time</i>&nbsp;<fmt:formatDate value="${board.board_create_date}" pattern="yyyy-MM-dd" /></span>
										                <span><i class="material-icons notranslate" aria-hidden="true">visibility</i>&nbsp;${board.hit}</span></p>
										            </div>
										            
										            <div id="IContents_div내용" class="board-view-cont">
										                
										                <h2 style="text-align: center;">&nbsp;</h2>
														<p>${board.content}</p>
														<p>&nbsp;</p>
														<p>&nbsp;</p>
										            </div>
										        </div>
										        <div class="pager d-flex justify-content-between">
										            <div class="prev col">
										                <a id="IContents_lnk이전" href="/board/view?boardNo=${(board.board_no) - 1}">
										                    <span class="pager-navi"><i class="material-icons notranslate" aria-hidden="true">navigate_before</i>&nbsp;이전글</span>
										                </a>
										            </div>
										            <div class="next col">
										                <a id="IContents_lnk다음" href="/board/view?boardNo=${(board.board_no) + 1}">
										                    <span class="pager-navi">
										                        다음글&nbsp;<i class="material-icons notranslate" aria-hidden="true">navigate_next</i></span>
										                </a>
										            </div>
										        </div>
										        <div id="IContents_div댓글">
										            <div id="accordion">
										                <div class="card card-style01">
										                    <div class="card-header" id="headingOne">
										                        <button type="button" class="btn btn-link p-0" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" onclick="return false;">
										                            <i class="material-icons notranslate" aria-hidden="true">question_answer</i>&nbsp;댓글&nbsp;
										                            <span class="badge badge-pill badge-primary">
										                                <div id="IContents_UpPnlCommentCnt">0</div>
										                            </span>
										                            <i class="material-icons notranslate rotate-icon card-icon" aria-hidden="true">keyboard_arrow_down</i>
										                        </button>
										                    </div>
										                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
										                        <div class="card-body">
										                            <div id="IContents_UpPnlComment">
									                                    <div class="board-comment mb-0"><div class="messages"><blockquote class="comment mb-0">등록된 댓글이 없습니다.</blockquote></div></div>
																	</div>
										                        </div>
										                    </div>
										                </div>
										            </div>
										        </div>
										        <div id="IContents_div관리" class="form-row board-bottom">
										            <div class="form-group col-md text-right">
										                <a id="IContents_lnk목록" class="btn btn-secondary" href="/ad/board/4">목록</a>
										            </div>
										        </div>
										        <div id="IContents_passwordModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
										            <div class="modal-dialog modal-dialog-centered ui-draggable" role="document">
										                <div class="modal-content">
										                    <div class="modal-header ui-draggable-handle">
										                        <h5 class="modal-title">
										                            비밀번호 확인</h5>
										                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="sr-only">close</span><span aria-hidden="true">×</span></button>
										                    </div>
										                    <div class="modal-body">
										                        <div id="IContents_UpPnlPass">
											
										                                <div class="row">
										                                    <label for="IContents_txt비밀번호" id="IContents_lbl비밀번호" class="col-form-label col-md-3">비밀번호&nbsp;<strong class="text-danger">*</strong></label>
										                                    <div class="col-md-9">
										                                        <input name="ctl00$IContents$txt비밀번호" type="password" id="IContents_txt비밀번호" title="비밀번호" class="form-control" autocomplete="new-password" onkeyup="UserCtrl_Enter(&quot;IContents_btn비밀번호확인&quot;);">
										                                        <input type="hidden" name="ctl00$IContents$hdnPassGubun" id="IContents_hdnPassGubun">
										                                        <span id="IContents_cv비밀번호" style="display:none;">
										                                            <small class="form-text text-danger">
										                                                <span id="IContents_lbl비밀번호_유효성메세지" title="비밀번호_유효성메세지">필수항목 입니다.</span><span id="IContents_lbl비밀번호_오류메세지" title="lbl비밀번호_오류메세지">비밀번호가 틀렸습니다.</span>
										                                            </small>
										                                        </span>
										                                    </div>
										                                </div>
																</div>
										                    </div>
										                    <div class="modal-footer">
										                        <input type="submit" name="ctl00$IContents$btn비밀번호확인_TEMP" value="" onclick="removeAllInvalidClass();WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$IContents$btn비밀번호확인_TEMP&quot;, &quot;&quot;, true, &quot;확인&quot;, &quot;&quot;, false, false))" id="IContents_btn비밀번호확인_TEMP" class="sr-only">
										                        <button id="IContents_btn비밀번호확인" type="button" class="btn btn-primary" title="확인" onclick="fn_check_password();">
										                            확인
										                        </button>
										                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
										                            취소</button>
										                    </div>
										                </div>
										            </div>
										        </div>
										        
										        <input type="submit" name="ctl00$IContents$btn댓글조회" value="" id="IContents_btn댓글조회" tabindex="-1" class="sr-only" aria-hidden="true">
										        <input type="submit" name="ctl00$IContents$btn댓글삭제" value="" onclick="lang_bootConfirmAnchor(&quot;삭제하시겠습니까?&quot;,$(this),&quot;K&quot;);return false;" id="IContents_btn댓글삭제" tabindex="-1" class="sr-only" aria-hidden="true">
										        <input type="submit" name="ctl00$IContents$btn삭제_TEMP" value="" id="IContents_btn삭제_TEMP" tabindex="-1" class="sr-only" aria-hidden="true">
										    </div>
					                    </div>
					                </div> --%>
									
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
		
	</script>
</body>
</html>
