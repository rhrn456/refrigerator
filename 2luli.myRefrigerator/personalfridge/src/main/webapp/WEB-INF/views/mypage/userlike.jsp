<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>찜한 레시피 목록</title>
</head>
<body>
    <h1>찜한 레시피 목록</h1>
    <ul>
    ${likeList} 
    
   <%--  jsp el ${} 
    jstl  taglib <c: 문법 --%>
       <%--  <c:foreach var="like" items="${likeList}">
            <li>${like.recipe_name} - 찜한 날짜: ${like.like_date}</li>
        </c:foreach> --%>
    </ul>
</body>
</html>
