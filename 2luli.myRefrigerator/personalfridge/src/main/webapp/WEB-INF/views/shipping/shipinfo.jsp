<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./memo.css" />
    <title>TEST</title>
</head>
<body>
    <div class="Box">
        <div class="InputBox">
            <h3>배송 API TEST</h3>
            <form id="searchForm" class="InputForm">
                <input id="trackNum" type="number" placeholder="송장번호">
                <select id="carrierList"></select>
                <button id="searchButton" type="button">조회</button>
            </form>
        </div>
        <div class="OutputBox">
            <textarea id="responseData" cols="20" rows="10"></textarea>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script>
        const selectBox = document.getElementById("carrierList");
        const responseData = document.getElementById("responseData");

        $.ajax({
            type: "get",
            url: "https://apis.tracker.delivery/carriers",
            data: "",
            dataType: 'json',
            success: function(data) {
                console.log(data);
                for(let i = 0; i < data.length; i++){
                    let carrierData = document.createElement("option");
                    carrierData.text = data[i].name;
                    carrierData.value = data[i].id;
                    selectBox.options.add(carrierData);    
                }    
            },
            error: function(request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });


        $(function(){
            $('#searchButton').on("click",function(){
                let selectedCarrier = document.getElementById("carrierList").value;
                let trackNum = document.getElementById("trackNum").value;
                console.log(selectedCarrier);
                console.log(trackNum);

                $.ajax({
                    type: "get",
                    url: "https://apis.tracker.delivery/carriers/" + selectedCarrier + "/tracks/" + trackNum,
                    data: "",
                    dataType: 'json',
                    success: function(data) {
                        console.log(data);
                        let string = '';
                        string += "From:" + JSON.stringify(data.from.name) + "\r\n"; 
                        string += "State:" + JSON.stringify(data.state.text) + "\r\n"; 
                        string += "To:" + JSON.stringify(data.to.name) + "\r\n"; 
                        
                        console.log(string);
                        responseData.innerHTML = string;
                    },
                    error: function(request, status, error) {
                        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
        });
    </script>
</body>
</html>
