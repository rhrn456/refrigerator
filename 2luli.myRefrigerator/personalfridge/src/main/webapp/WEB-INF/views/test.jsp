<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() { //jquery - js의 라이브러리 
	$('#b1').click(function() { //이벤트가 발생하면 자동호출되는 익명함수(콜백함수)
		$.ajax({
			url : "http://openapi.foodsafetykorea.go.kr/api/67d21b2aa52f435480ad/COOKRCP01/json/3/10",
			success: function(json) {
				
				//RCP_NM : 메뉴명 //recipe_name
				//ATT_FILE_NO_MAIN : 이미지명 //recipe_img
				//RCP_WAY2 : 조리방법	
				//RCP_PAT2 : 요리종류 //recipe_category
				//INFO_WGT : 중량(1인분)
				//INFO_ENG : 열량 //nutrition_facts
				//INFO_CAR : 탄수화물 //nutrition_facts
				//INFO_PRO : 단백질 //nutrition_facts
				//INFO_FAT : 지방 //nutrition_facts
				//INFO_NA : 나트륨 //nutrition_facts
				//RCP_PARTS_DTLS : 재료정보 //ingredient
				//MANUAL01 ~ 20 : 만드는법 //recipe_content
				
				/* let recipe_name = json.COOKRCP01.row[0].RCP_NM;
				let recipe_img = json.COOKRCP01.row[0].ATT_FILE_NO_MAIN;
				let recipe_category = json.COOKRCP01.row[0].RCP_PAT2;
				let nutrition_facts = "열량 : " + json.COOKRCP01.row[0].INFO_ENG + "탄수화물 : " +json.COOKRCP01.row[0].INFO_CAR+
									"단백질 : "+ 	json.COOKRCP01.row[0].INFO_PRO+ " 지방 : "+json.COOKRCP01.row[0].INFO_FAT+
									"나트륨 : "+json.COOKRCP01.row[0].INFO_NA;
				let ingredient = json.COOKRCP01.row[0].RCP_PARTS_DTLS;
				let recipe_content = json.COOKRCP01.row[0].MANUAL01+json.COOKRCP01.row[0].MANUAL02+
									json.COOKRCP01.row[0].MANUAL03;
				
				console.log(recipe_name);
				console.log(recipe_img);
				console.log(recipe_category);
				console.log(nutrition_facts);
				console.log(ingredient);
				console.log(recipe_content); */
				
				let data = json.COOKRCP01.row;
				
				for(let i = 0; i< data.length; i++){
					/* let recipe_name = data[i].RCP_NM;
					let recipe_img = data[i].ATT_FILE_NO_MAIN;
					let recipe_category = data[i].RCP_PAT2;
					let nutrition_facts = "열량 : " + data[i].INFO_ENG + "탄수화물 : " +data[i].INFO_CAR+
										"단백질 : "+ 	data[i].INFO_PRO+ " 지방 : "+ data[i].INFO_FAT+
										"나트륨 : "+data[i].INFO_NA;
					let ingredient = data[i].RCP_PARTS_DTLS;
					let recipe_content = data[i].MANUAL01+data[i].MANUAL02+ data[i].MANUAL03; */
					let recipe_name = json.COOKRCP01.row[i].RCP_NM;
					let recipe_img = json.COOKRCP01.row[i].ATT_FILE_NO_MAIN;
					let recipe_category = json.COOKRCP01.row[i].RCP_PAT2;
					let nutrition_facts = "열량 : " + json.COOKRCP01.row[i].INFO_ENG +""+ "탄수화물 : " +json.COOKRCP01.row[i].INFO_CAR+""+
										"단백질 : "+ 	json.COOKRCP01.row[i].INFO_PRO+ "" + " 지방 : "+json.COOKRCP01.row[i].INFO_FAT+ "" +
										"나트륨 : "+json.COOKRCP01.row[i].INFO_NA;
					let ingredient = json.COOKRCP01.row[i].RCP_PARTS_DTLS;
					let recipe_content = json.COOKRCP01.row[i].MANUAL01+json.COOKRCP01.row[i].MANUAL02+
										json.COOKRCP01.row[i].MANUAL03;
					
					console.log(recipe_name);
					console.log(recipe_img);
					console.log(recipe_category);
					console.log(nutrition_facts);
					console.log(ingredient);
					console.log(recipe_content);
					$.ajax({
						url:"insertRecipe",
						type:"post",
						data:{
							recipe_name : recipe_name,
							recipe_img : recipe_img,
							recipe_category : recipe_category,
							nutrition_facts : nutrition_facts,
							ingredient : ingredient,
							recipe_content : recipe_content
						},
						success: function() {
						
						}
						
					});
				}
				
				
			}//success
		})//ajax
	})//b1
	
	
}) //$
</script>
</head>
<body>
<button id="b1">레시피</button>
<button id="b2">영화</button>
<hr color="red">
<div id="result"></div>
</body>
</html>