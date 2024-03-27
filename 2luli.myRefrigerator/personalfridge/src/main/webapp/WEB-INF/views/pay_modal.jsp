<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/house-AI-Logo.png" />
<html>
	<head>
	<title>iamport</title>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
 
<button onclick="requestPay()">결제하기</button>
 
<script>
function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    var uid = '';
    console.log("찍힘");
    IMP.init('imp12886452');
    IMP.request_pay({ // param
        pg: "kakaopay", // PG사 선택
        pay_method: "card", // 지불 수단
        name: "맥북 프로 16인치", // 상품명
        amount: 100, // 가격
        buyer_name: "tester", // 구매자 이름
        buyer_tel: "010-4242-4242", // 구매자 연락처 
        buyer_addr: "서울특별시 강남구 신사동",// 구매자 주소지
        buyer_postcode: "01181", // 구매자 우편번호
        m_redirect_url : 'https://example.com/mobile/complete', // 모바일 결제시 사용할 url
        digital: true, // 실제 물품인지 무형의 상품인지(핸드폰 결제에서 필수 파라미터)
        app_scheme : '' // 돌아올 app scheme
      }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            uid = rsp.imp_uid;
            // 결제검증
            $.ajax({
                url: '/order/verify_iamport/' + rsp.imp_uid,
                type: 'post'
            }).done(function(data) {
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                if (cdPay.textContent == data.response.amount) {
                    // jQuery로 HTTP 요청
                    // 주문정보 생성 및 테이블에 저장 
		        	
                        // 데이터를 json으로 보내기 위해 바꿔준다.
                        data = JSON.stringify({
                            "orderNum" :  rsp.merchant_uid,
                            "productNum" : detailNum.textContent, //상품번호
                            "num" : userNum.value, // 회원번호
                            "productName" : rsp.name,
                            "orderDate" : new Date().getTime(),
                            "totalPrice" : rsp.paid_amount,
                            "imp_uid" : rsp.imp_uid,
                            "reserNum" :  reserNum.textContent // 예약정보를 담고있는번호
                        });
					
                        jQuery.ajax({
                            url: "/order/complete", 
                            type: "POST",
                            dataType: 'json',
                            contentType: 'application/json',
                            data : data
                        })
                        .done(function(res) {
                            if (res > 0) {
                                swal('주문정보 저장 성공')
                                createPayInfo(uid);
                            }
                            else {
                                swal('주문정보 저장 실패');
                            }
                        })
                }
                else {
                    alert('결제 실패');
                }
            })
            } else {
                swal("결제에 실패하였습니다.","에러 내용: " +  rsp.error_msg,"error");
            }
        });
}
  </script>
</body>
</html>