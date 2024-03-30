<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>소셜 회원가입</title>
  <link rel="icon" type="image/x-icon" href="https://kr.object.ncloudstorage.com/2luli.refrigerator/house-AI-Logo.png" />
   
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #f5ffea, #6fde6f);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .container {
            width: 450px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
            text-align: center;
        }
        
        .logo-img {
		    width: 200px;

		}
        
        .text-center {
            text-align: center;
        }
        
        .form-control-user,
        .btn-user {
            padding: 10px 20px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        .form-control-user {
            height: 30px; /* 높이 조정 */
            width: 300px;
            margin-bottom: 10px; /* 아래 간격 조정 */
        }
        
        .btn-user {
            text-align: center;
            width: 200px; /* 버튼 너비 조정 */
            height: 40px; /* 버튼 높이 조정 */
            background-color: #4e73df; /* 배경색 */
            color: #fff; /* 글자색 */
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        .btn-user:hover {
            background-color: #2e59d9; /* 호버시 배경색 */
        }
        
        .signup-text {
            font-size: 20px; /* 텍스트 크기 조정 */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="text-center">
        <img src="img/house-AI-BI.png" style="max-width: 70%; max-height: 70%; margin-top:-30px; margin-bottom:20px;">
         <img src="https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png" alt="Google 로고" class="logo-img">
        <p class="mb-4">상품 배송을 위해 핸드폰 번호와 이메일을 작성해주세요.</p>
        </div>
        <form class="user" action="/insertUserInfoBySocial" method="post">
            <input type="hidden" id="user_id" name="user_id" value="${userid}">
            <input type="hidden" id="password" name="password" value="${password}">
            <input type="hidden" id="user_name" name="user_name" value="${name}">
            <input type="hidden" id="mail" name="mail" value="${mail}">
            <input type="hidden" id="access_token" name="access_token" value="${access_token}">
            <input type="hidden" id="sns_type" name="sns_type" value="${sns_type}">
            <div class="form-group text-center mb-3">
                <input type="adress" class="form-control form-control-user" id="adress" name="adress" placeholder="주소를 입력해주세요">
                <input type="text" class="form-control form-control-user" id="phone" name="phone" placeholder="핸드폰 번호">
            </div>
            <button type="submit" class="btn btn-primary btn-user btn-block">
                회원 가입 하기
            </button>
        </form>
        <hr>
        <div class="text-center">
            <a class="small" href="http://localhost:8077/loginPage">계정이 이미 있나요? 로그인!</a>
        </div>
    </div>

</body>
</html>