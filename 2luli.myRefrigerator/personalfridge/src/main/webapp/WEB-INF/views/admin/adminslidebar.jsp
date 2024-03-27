<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->
	

	 <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" style="width: 250px !important;" id="accordionSidebar" >

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"  href="/admin/page">
                <div class="sidebar-brand-icon rotate-n-15" >
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">이루리 <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/admin/page">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>관리자 페이지</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading"style="color:white;">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item" >
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span style="color:white; font-weight: bold;">데이터 등록</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" style="color:black; font-weight:bold; font-size:13px;">
                        <h4 class="collapse-header" style="color:#5e5e5e; font-weight:bold; font-size:10px;">데이터 관리:</h4>  
                        <a class="collapse-item" href="/admin/insertRecipeAdmin">레시피 추가</a>
                        <a class="collapse-item" href="/admin/insertProductAdmin">일반/특가상품 추가</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <c:if test="${sessionScope.userAdmin == 2}">
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span style="color:white; font-weight: bold;">유틸</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" style="color:black; font-weight:bold; font-size:13px;">
                        <h4 class="collapse-header" style="color:#5e5e5e; font-weight:bold; font-size:10px;">계정 관리:</h4>
                        <a class="collapse-item" href="/admin/userListadmin">사용자 관리</a>
                        <a class="collapse-item" href="/admin/managerListadmin">매니저 관리</a>
                    </div>
                </div>
            </li>
            </c:if>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="color:white;">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span style="color:white; font-weight: bold;">데이터 목록</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" style="color:black; font-weight:bold; font-size:13px;">
                    <h4 class="collapse-header" style="color:#5e5e5e; font-weight:bold; font-size:10px;">데이터 리스트:</h4>
                        <a class="collapse-item" href="/admin/RecipeListAdmin">레시피</a>
                        <a class="collapse-item" href="/admin/productAllList">일반 상품</a>
                        <a class="collapse-item" href="/admin/SpecialProductAllList">특가 상품</a>
                        <h4 class="collapse-header" style="color:#5e5e5e; font-weight:bold; font-size:10px;">리뷰:</h4>
                        <a class="collapse-item" href="/admin/ReviewRecipeAdmin">레시피 리뷰 관리</a>
                        <h4 class="collapse-header" style="color:#5e5e5e; font-weight:bold; font-size:10px;">배송 관리:</h4>
                        <a class="collapse-item" href="/admin/shipcontrollerAdmin">배송 정보</a>
                        <a class="collapse-item" href="/admin/shipScheduleAdmin">배송 현황</a>
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


        </ul>
        <!-- End of Sidebar -->