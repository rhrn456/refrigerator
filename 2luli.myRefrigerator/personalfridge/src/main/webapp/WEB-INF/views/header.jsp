<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="icon" type="image/x-icon" href="img/house-AI-Logo.png" />
    <style>

    </style>
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">이루리 짱</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">
                        소가구를 위한 1~2인분 음식 과 레시피를 제공하고 기호에 맞춰 음식을 알려주는 AI 추천 음식 서비스 재료를 원터치로 구매하고 나의 냉장고에서 재료 관리까지.</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand"><img src="img/house-AI-BI.png" style="width:200px;" ></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="/" class="nav-item nav-link active" >홈</a>
                             <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">쇼핑</a>
                          		<div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="/recipeshop" class="dropdown-item">(음식)레시피</a>
                                    <a href="/productshop" class="dropdown-item">식재료</a>
                                    <a href="/specialproductshop" class="dropdown-item">특가 상품</a>
                                </div>
                                </div>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">게시판</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="/board?CategoryNo=1" class="dropdown-item">공지사항</a>
                                    <a href="/board?CategoryNo=2" class="dropdown-item">공유 게시판</a>
                                    <a href="/board?CategoryNo=3" class="dropdown-item">나만의 레시피</a>
                                    <!-- <script>
                                    	history.replaceState({}, null, location.pathname);
                                    </script> -->
                                </div>
                            </div>
                            <a href="/contact" class="nav-item nav-link">고객센터</a>
                        </div>
                       <div class="d-flex m-3 me-0">
						    <form id="searchForm" action="yourMappingUrl" method="get" class="d-flex align-items-center me-4">
						        <input type="text" id="searchInput" name="query" class="form-control me-2 w-30" placeholder="Search" style="margin-left: 6px;">
						        <button type="submit" class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white">
						            <i class="fas fa-search text-primary"></i>
						        </button>
						    </form>
						    <a href="/refrigerator" class="position-relative me-4 my-auto">
						        <i class="bi bi-door-closed-fill" style="font-size:30px;color:#81c408"></i>
						    </a>
						    <a href="/cart" class="position-relative me-4 my-auto">
						        <i class="fa fa-shopping-bag fa-2x"></i>
						        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
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