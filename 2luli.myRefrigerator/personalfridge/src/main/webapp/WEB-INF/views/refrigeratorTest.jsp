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
  #editForm {
    display: none;
    margin-top: 20px;
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
            product_name: productName,
            product_quantity: productQuantity,
            limit_date: limitDate,
            refrigerator_id: refrigeratorId
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
    
    $("#updateForm").click(function(){
  	  var refrigeratorProductId = $("#editProductId").val();
  	  var productName = $("#editProductName").val();
  	  var productQuantity = $("#editProductQuantity").val();
  	  var limitDate = $("#editLimitDate").val();
	  var refrigeratorId = $("#refrigeratorId").val();
  	  
  	  var data = {
  	    refrigerator_product_id: refrigeratorProductId,
  	    product_name: productName,
  	    product_quantity: productQuantity,
  	    limit_date: limitDate,
  	    refrigerator_id: refrigeratorId
  	  };
  	  
    $.ajax({
      type: "PUT",
      contentType: "application/json",
      url: "/updateRefrigeratorProduct", 
      data: JSON.stringify(data),
      success: function(response){
        alert(response);
        window.location.href = window.location.href; // 페이지 새로고침
      },
      error: function(xhr, status, error){
        console.error(xhr.responseText);
      }
    });
  });
});

function deleteProduct(refrigeratorProductId) {
    if (confirm("이 재료를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/deleteRefrigeratorProduct",
            contentType: "application/x-www-form-urlencoded",
            data: { refrigeratorProductId: refrigeratorProductId },
            success: function(response){
                alert(response);
                window.location.href = window.location.href; // 새로고침
            },
            error: function(xhr, status, error){
                console.error(xhr.responseText);
            }
        });
    }
}

function showEditForm(refrigeratorProductId, productName, productQuantity, limitDate) {
	  $("#editProductName").val(productName);
	  $("#editProductQuantity").val(productQuantity);
	  $("#editLimitDate").val(limitDate);
	  $("#editProductId").val(refrigeratorProductId);
	  
	  $("#editForm").show();
}

function shareProduct(refrigeratorProductId){
	$.ajax({
		type: "POST",
		url: "/shareProduct",
		data: {refrigeratorProductId: refrigeratorProductId},
        success: function(response){
            alert(response);
            window.location.href = window.location.href;
        },
        error: function(xhr, status, error){
            console.error(xhr.responseText);
        }
	})
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
    <c:if test="${0 != refrigeratorProductList.size()}">
	    <c:forEach var="product" items="${refrigeratorProductList}">
	      <tr>
	        <td>${product.product_name}</td>
	        <td>${product.product_quantity}</td>
	        <td>${product.append_date}</td>
	        <td>${product.limit_date}</td>
	        <td>
	        	<button type="button" onclick="showEditForm('${product.refrigerator_product_id}', '${product.product_name}', '${product.product_quantity}', '${product.limit_date}')">수정</button>
	          	<button type="button" onclick="deleteProduct(${product.refrigerator_product_id})">삭제</button>
	          	<button type="button" onclick="shareProduct(${product.refrigerator_product_id})">공유</button>
	        </td>
	      </tr>
	    </c:forEach>
    </c:if>
  </table>  
  
  <form id="productForm">
  	<input type="hidden" id="refrigeratorId" name="refrigeratorId" value="${refrigeratorId}">
  
    <label for="productName">이름:</label>
    <input type="text" id="productName" name="productName"><br><br>
    
    <label for="productQuantity">재고:</label>
    <input type="text" id="productQuantity" name="productQuantity"><br><br>
    
    <label for="limitDate">소비 기한:</label>
    <input type="date" id="limitDate" name="limitDate"><br><br>
    
    <button type="button" id="submitForm">추가</button>
  </form> 
  
	<form id="editForm">
		<input type="hidden" id="editProductId" name="editProductId">
		
		<label for="editProductName">이름:</label>
		<input type="text" id="editProductName" name="editProductName"><br><br>
		
		<label for="editProductQuantity">재고:</label>
		<input type="text" id="editProductQuantity" name="editProductQuantity"><br><br>
		
		<label for="editLimitDate">소비 기한:</label>
		<input type="date" id="editLimitDate" name="editLimitDate"><br><br>
		
		<button type="button" id="updateForm">수정 완료</button>
	</form> 
</body>
</html>