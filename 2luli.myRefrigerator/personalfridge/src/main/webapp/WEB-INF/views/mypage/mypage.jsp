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
<p>ID: ${mypage.user_id}</p>
<p>닉네임: ${mypage.user_name}</p>
<p>이메일: ${mypage.mail}</p>
<p>주소: ${mypage.adress}</p>
<p>핸드폰 번호: ${mypage.phone}</p>

<!-- 정보 수정 폼 -->
<h3>유저 정보 수정</h3>
<form action="${pageContext.request.contextPath}/mypage/update" method="post">
    <input type="hidden" name="user_id" value="${user.user_id}"/>
    <div>
        <label for="adress">주소:</label>
        <input type="text" id="adress" name="adress" value="${user.adress}"/>
    </div>
    <div>
        <label for="phone">핸드폰 번호:</label>
        <input type="text" id="phone" name="phone" value="${user.phone}"/>
    </div>
    <button type="submit">수정</button>
</form>

<!-- 기타 사용자 정보 표시 -->

<!-- 환불/교환 요청 버튼 -->
<div>
    <button onclick="location.href='${pageContext.request.contextPath}/refundPage'">환불/교환 요청</button>
</div>

<!-- 회원탈퇴 -->
<form action="/mypage/deleteUser" method="post" onsubmit="return confirm('정말로 계정을 탈퇴하시겠습니까?');">
    <input type="submit" value="회원 탈퇴"/>
</form>



</body>
</html>