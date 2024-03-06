<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8">
        <title>Fruitables - Vegetable Website Template</title>
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
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
       <%@ include file="header.jsp" %>
        <!-- Navbar End -->


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


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                        <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->



        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Our Organic Products</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">All Products</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                        <span class="text-dark" style="width: 130px;">Vegetables</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                        <span class="text-dark" style="width: 130px;">Fruits</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                        <span class="text-dark" style="width: 130px;">Bread</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">
                                        <span class="text-dark" style="width: 130px;">Meat</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="data:image/jpeg;base64,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" class="img-fluid w-100 rounded-top" alt=""style="height:212px;">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Italy</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>피자</h4>
                                                    <p>너무 맛이있는 피자<br>또먹고 싶은 피자<br>개꿀맛<br> 박스맞추려고 한줄더</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary" style="margin-left:58px;"><i class="fa fa-shopping-bag me-2 text-primary"></i> 재료 보기</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="data:image/jpeg;base64,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" class="img-fluid w-100 rounded-top" alt="" style="height:212px;">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Japan</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>돈까스</h4>
                                                    <p>너무<br>맛이있고<br>한줄더<br>연장하자</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$500</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Raspberries</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Apricots</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Banana</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Oranges</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Raspberries</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Grapes</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Grapes</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Raspberries</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Oranges</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-6.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Apple</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-5.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Grapes</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-4.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Apricots</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-5" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-3.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Banana</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-2.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Raspberries</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-3">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="img/fruite-item-1.jpg" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Fruits</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4>Oranges</h4>
                                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->


       

        <!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="mb-0">특가상품</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">
            <c:forEach var="ProductDTO" items="${products}">
                <div class="border border-primary rounded position-relative vesitable-item">
                    <div class="vesitable-img">
                        <img src="${ProductDTO.productImg}" class="img-fluid w-100 rounded-top" alt="">
                    </div>
                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${ProductDTO.productCategory}</div>
                    <div class="p-4 rounded-bottom">
                        <h4>${ProductDTO.productName}</h4>
                        <p>${ProductDTO.productContent}</p>
                        <div class="d-flex justify-content-between flex-lg-wrap">
                            <p class="text-dark fs-5 fw-bold mb-0">${ProductDTO.productPrice}</p>
                            <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->


      

      

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Fruitables</h1>
                                <p class="text-secondary mb-0">Fresh products</p>
                            </a>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mx-auto">
                                <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like us!</h4>
                            <p class="mb-4">typesetting, remaining essentially unchanged. It was 
                                popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                            <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Shop Info</h4>
                            <a class="btn-link" href="">About Us</a>
                            <a class="btn-link" href="">Contact Us</a>
                            <a class="btn-link" href="">Privacy Policy</a>
                            <a class="btn-link" href="">Terms & Condition</a>
                            <a class="btn-link" href="">Return Policy</a>
                            <a class="btn-link" href="">FAQs & Help</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="">My Account</a>
                            <a class="btn-link" href="">Shop details</a>
                            <a class="btn-link" href="">Shopping Cart</a>
                            <a class="btn-link" href="">Wishlist</a>
                            <a class="btn-link" href="">Order History</a>
                            <a class="btn-link" href="">International Orders</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: 1429 Netus Rd, NY 48247</p>
                            <p>Email: Example@gmail.com</p>
                            <p>Phone: +0123 4567 8910</p>
                            <p>Payment Accepted</p>
                            <img src="img/payment.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->



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
    </body>

