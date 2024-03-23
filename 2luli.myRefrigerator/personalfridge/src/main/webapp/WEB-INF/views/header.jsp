<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/house-AI-Logo.png" />
    <style>
	    /* 네비게이션 아이템 간격 조정 */
	    .navbar-nav .nav-item {
	        margin: 0 20px; /* 좌우 여백을 20px로 설정 */
	    }
	
	    /* 드롭다운 메뉴 위치 조정 */
	    .navbar-nav .dropdown-menu {
	        transform: translateX(50px); /* 오른쪽으로 50px 이동 */
	    }
	
	    /* 드롭다운 메뉴 스타일 조정 */
	    .navbar-nav .dropdown-menu {
	        background-color: #6c757d; /* 배경 색상 조정 */
	        border-radius: 0; /* 모서리 둥글기 제거 */
	    }
	    	
	    /* 드롭다운 아이템 호버 스타일 조정 */
	    .navbar-nav .dropdown-item:hover {
	        background-color: #5a6268; /* 배경 색상 조정 */
	    }
    </style>
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-link pe-2" style= "margin-left:50px;">
						<a href="#" class="text-white">
						    <small class="text-white mx-2" style="font-weight: 600; font-size: 18px;">
						        1~2인분 레시피를 제공하고 기호에 맞춰 음식을 알려주는 
						        <span id="topstory" style="color:white; font-weight:bold; font-size:22px;">AI 추천 음식 재료를 원터치로 구매하고</span> 
						        나의 냉장고에서 재료 관리까지.
						    </small>
						</a>
					</div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand"><img src="${pageContext.request.contextPath}/img/house-AI-BI.png" style="width:200px;" ></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse" style="margin-top:20px; font-weight:bold;">
                        <div class="navbar-nav mx-auto">
                             <div class="nav-item dropdown">

                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="margin-left:60px; color:#3D3D3D; font-size: 17px;">간편한 요리책</a>
                          		<div class="dropdown-menu m-0 bg-secondary rounded-0" style="margin-left:50px !important;">
                                    <a href="/recipeshop" class="dropdown-item">이루리 요리책</a>
                                    <a href="/board?CategoryNo=3" class="dropdown-item">나만의 레시피</a>
                                </div>
                                 </div>
                             <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="margin-left:60px; color:#3D3D3D; font-size: 17px;">물건 보러가기</a>
                          		<div class="dropdown-menu m-0 bg-secondary rounded-0" style="margin-left:50px !important;">
                                    <a href="/productshop" class="dropdown-item">냉장고 식량 창고</a>
                                    <a href="/specialproductshop" class="dropdown-item">알뜰 쇼핑</a>
                                </div>
                                </div>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" style="margin-left:60px; color:#3D3D3D; font-size: 17px;">우리의 게시판</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0" style="margin-left:50px !important;">
                                    <a href="/board?CategoryNo=1" class="dropdown-item">공지사항</a>
                                    <a href="/board?CategoryNo=2" class="dropdown-item">공유 게시판</a>
                                    <!-- <script>
                                    	history.replaceState({}, null, location.pathname);
                                    </script> -->
                                </div>
                            </div>
                            <a href="/contact" class="nav-item nav-link" style="margin-left:60px; color:#3D3D3D; font-size: 17px;">고객센터</a>
                        </div>
                       	<div class="d-flex m-3 me-0" >
						    <a href="/refrigerator" class="position-relative me-4 my-auto" >
						        <i class="bi bi-door-closed-fill" style="font-size:30px;color:#81c408;"></i>
						    </a>
						    <a href="/mycart" class="position-relative me-4 my-auto" >
						        <i class="fa fa-shopping-bag fa-2x"></i>
						       	<c:if test="${not empty sessionScope.cartCount && sessionScope.cartCount ne 0}">
								    <span id="cartCountIndicator" class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
								        ${sessionScope.cartCount}
								    </span>
								</c:if>
						    </a>
							<div class="d-inline-flex align-items-center">
							    <a href="/goPage" class="my-auto mr-3">
							        <i class="fas fa-user fa-2x"></i>
							    </a>
							    <c:if test="${not empty sessionScope.userId}">
							        <a href="/logout" id="unlock" class="fa fa-unlock-alt fa-2x"></a>
							    </c:if>
							</div>
						</div>
                    </div>
                </nav>
            </div>
        </div>