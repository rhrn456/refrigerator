<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../css/style.css" rel="stylesheet">
<!-- Navbar start -->
<%@ include file="../header.jsp"%>
<!-- Navbar End -->

<style>
body, html {
    height: 100%;
    margin: 0;
    padding: 0;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
  }

  .content {
    width: 500px; /* 내용의 너비 */
    height: 200px; /* 내용의 높이 */
    text-align: center; /* 내용을 수평으로 정렬 */
  }
</style>
</head>
<body>
<div class="container">
  <div class="content">
  	<img src="img/error.jpg" style="width:100%; hegiht:100%">
    <h2 style="margin-top:10px;">${exceptionMessage}</h2>
  </div>
</div>
<!-- footer start -->
			<%@ include file="../footer.jsp"%>
			<!-- footer End -->
</body>
</html>