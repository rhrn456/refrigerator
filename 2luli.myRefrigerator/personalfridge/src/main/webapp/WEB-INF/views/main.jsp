<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body{
 	background-color: pink;
 }
 .user-detail{
 	text-align: center;
 	margin: 0 auto;
 }

</style>
</head>
<body>
 <h1>User List</h1>
    <table border="1">
        <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>Email</th>
        </tr>
        <c:forEach var="AdminDTO" items="${users}">
            <tr>
                <td>${AdminDTO.userId}</td>
                <td>${AdminDTO.userName}</td>
                <td>${AdminDTO.mail}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>