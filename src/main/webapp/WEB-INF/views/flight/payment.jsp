<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>iamport</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<!--  <input type="text" id="impNumber" name="impNumber" value="${sessionScope.impNumber}"> -->

<button onclick="requestPay()">결제하기</button>

<script type="text/javascript">
	
    function requestPay() {
    	var IMP = window.IMP;
    	var impNumber = "";
    	//impNumber = $('#impNumber').val();
    	impNumber = `${sessionScope.impNumber}`;
    	console.log(impNumber);
    	IMP.init(impNumber); // 예: imp00000000
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis.INIBillTst",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000003", // 반드시 다른 번호를 줘야함
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181",
      }, function (rsp) { // callback
          if (rsp.success) {
              // 결제 성공 시 로직
              console.log(rsp);
              window.location.href="/home";
          } else {
              // 결제 실패 시 로직
              console.log(rsp);
              alert(rsp.error_msg);
              window.location.href="/home";
          }
      });
    }
</script>
</body>
</html>