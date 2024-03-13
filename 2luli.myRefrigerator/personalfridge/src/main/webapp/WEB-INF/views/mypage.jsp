<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Page</title>
</head>
<body>
<h2>My Page</h2>

<!-- 사용자 정보 표시 -->
<p>ID: ${user.user_id}</p>
<p>Name: ${user.user_name}</p>
<p>Email: ${user.mail}</p>
<!-- 정보 수정 폼 -->
<form action="/mypage/update" method="post">
    <input type="hidden" name="userId" value="${user.user_id}" />
    <input type="text" name="user_name" value="${user.user_name}" />
    <input type="email" name="mail" value="${user.mail}" />
    <button type="submit">Update</button>
</form>

<!-- 계정 삭제 폼 -->
<form action="/mypage/delete" method="post">
    <input type="hidden" name="userId" value="${user.user_id}" />
    <button type="submit">Delete Account</button>
</form>

</body>
</html>