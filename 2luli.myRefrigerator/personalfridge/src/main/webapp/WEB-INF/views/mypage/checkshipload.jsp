<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>우리집 AI 냉장고</title>
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
    <!-- Navbar start -->
	<%@ include file="../header.jsp" %>
    <!-- Navbar End -->
    
    <style>
    	body{
    	width:100%;
    	height:100%;
    	}
        .ship-list {
        	margin-top:200px !important;
            font-family: Arial, sans-serif;
		    width: 50%;
		    background-color: #fff;
		    justify-content: center;
            align-items: center;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    padding: 20px;
		    margin: auto; /* 추가 */
		}
        .ship-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
            display: flex;
  			justify-content: space-between;
        }
        .ship-item:last-child {
            border-bottom: none;
        }
        .ship-info-left {
		    flex: 1;
		}
		
		.ship-info-right {
			margin-right:-400px;
			text-align: left;
		    flex: 1;
		}
		.card-header {
	  	    position: relative;
		    cursor: pointer;
		}
		
		.header-text {
		    display: inline-block;
		}
		.card-body {
		    display: none;
		}
		
		.card.show .card-body {
		    display: block;
		}
		.arrow {
		    position: absolute;
		    right: 10px;
		    top: 50%;
		    transform: translateY(-50%);
		}

    </style>
</head>
<body>
<div class="ship-list">
    <h1>배송 정보</h1>
    <div class="ship-items">
        <%-- ship_code를 기준으로 그룹화된 Map을 순회 --%>
        <c:forEach var="group" items="${sortedGroupedShipList}">
            <%-- 그룹별 카드 생성 --%>
            <div class="card mb-3">
                <div class="card-header">
				    <span class="header-text">송장 번호: ${group.key}</span>
				    <span class="arrow">&#9660;</span>
				</div>
			<div class="card-body">
                    <%-- 각 송장 번호별 배송 정보 순회 --%>
                    <c:forEach var="ship" items="${group.value}">
                        <div class="ship-item" style="display: flex;">
                            <div class="ship-info-left" style="flex: 1;">
                                <p><strong>배송지:</strong> ${ship.arrive}${ship.sub_adress}</p>
                            </div>
                           <div class="ship-info-right" style="flex: 1;">
                           <c:set var="dateFormat" value="yyyy-MM-dd HH:mm" />
							<fmt:formatDate value="${ship.move_time}" pattern="${dateFormat}" var="formattedMoveTime" />
							<p style="margin-bottom:-3px;"><strong>이동 시간:</strong> ${formattedMoveTime}</p>
							    <p>
							        <c:choose>
									    <c:when test="${ship.go_on == 0}">
									        <strong>배송 상태:</strong> 배송 중&nbsp;
									    </c:when>
									    <c:when test="${ship.go_on == 2}">
									        <strong>배송 상태:</strong> 배송 완료&nbsp;
									    </c:when>
									    <c:otherwise>
									        <strong>배송 상태:</strong> 하차 완료&nbsp;
									    </c:otherwise>
									</c:choose>
							        <strong>현재 위치:</strong> ${ship.now_location} 
							    </p>
							</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div style="height:100px;">

</div>

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
	
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
    //시간 출력
    function toggleCard(card) {
        card.classList.toggle('show');
    }

    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.card');

        cards.forEach(card => {
            const header = card.querySelector('.card-header');

            header.addEventListener('click', function() {
                toggleCard(card);
            });
        });
    });
    
    

    </script>
</body>
<!-- footer start -->
<%@ include file="../footer.jsp" %>
<!-- footer End -->
</html>