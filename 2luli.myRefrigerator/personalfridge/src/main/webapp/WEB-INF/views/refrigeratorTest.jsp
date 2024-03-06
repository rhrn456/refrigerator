<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Refrigerator Products</title>
<style>
  table {
    width: 100%;
    border-collapse: collapse;
  }
  th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  th {
    background-color: #f2f2f2;
  }
  form {
    margin-top: 20px;
  }
  label {
    display: inline-block;
    width: 100px;
    margin-right: 10px;
  }
  input[type=text], input[type=date] {
    width: 200px;
    padding: 5px;
  }
  button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
  }
  button:hover {
    background-color: #45a049;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#submitForm").click(function(){
        var productName = $("#productName").val();
        var productQuantity = $("#productQuantity").val();
        var limitDate = $("#limitDate").val();
        var refrigeratorId = $("#refrigeratorId").val();
        
        var data = {
            productName: productName,
            productQuantity: productQuantity,
            limitDate: limitDate,
            refrigeratorId: refrigeratorId
        };
        
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/insertRefrigeratorProduct",
            data: JSON.stringify(data),
            success: function(response){
                alert(response);
                window.location.href = window.location.href;
            },
            error: function(xhr, status, error){
                console.error(xhr.responseText);
            }
        });
    });
});

function deleteProduct(refrigeratorProductId) {
    if (confirm("이 제품을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/deleteRefrigeratorProduct",
            data: { refrigeratorProductId: refrigeratorProductId },
            success: function(response){
                alert(response);
                window.location.href = window.location.href;
            },
            error: function(xhr, status, error){
                console.error(xhr.responseText);
            }
        });
    }
}
</script>
</head>
<body>
  <h1>나의 냉장고</h1>
  
  <table>
    <tr>
      <th>이름</th>
      <th>재고</th>
      <th>추가 날짜</th>
      <th>소비 기한</th>
      <th>작업</th>
    </tr>
    <c:forEach var="product" items="${refrigeratorProductList}">
      <tr>
        <td>${product.productName}</td>
        <td>${product.productQuantity}</td>
        <td>${product.appendDate}</td>
        <td>${product.limitDate}</td>
        <td><button type="button" onclick="deleteProduct(${product.refrigeratorProductId})">삭제</button></td>
      </tr>
    </c:forEach>
  </table>
  
  <form id="productForm">
  	<input type="hidden" id="refrigeratorId" name="refrigeratorId" value="${product.refrigeratorId}">
  
    <label for="productName">이름:</label>
    <input type="text" id="productName" name="productName"><br><br>
    
    <label for="productQuantity">재고:</label>
    <input type="text" id="productQuantity" name="productQuantity"><br><br>
    
    <label for="limitDate">소비 기한:</label>
    <input type="date" id="limitDate" name="limitDate"><br><br>
    
    <button type="button" id="submitForm">추가</button>
  </form>
</body>
</html>