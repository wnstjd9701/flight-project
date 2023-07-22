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

<input type="hidden" id="impNumber" name="impNumber" value="${sessionScope.impNumber}">
<input type="hidden" id="merchantUid" name="merchantUid" value="${sessionScope.merchantUid}">
<input type="hidden" id="flightName" name="flightName" value="${sessionScope.flightName}">
<input type="hidden" id="amount" name="amount" value="${sessionScope.amount}">
<input type="hidden" id="memberEmail" name="memberEmail" value="${sessionScope.memberEmail}">
<input type="hidden" id="memberName" name="memberName" value="${sessionScope.memberName}">
<input type="hidden" id="memberPhoneNumber" name="memberPhoneNumber" value="${sessionScope.memberPhoneNumber}">
<input type="hidden" id="memberAddress" name="memberAddress" value="${sessionScope.memberPhoneNumber}">

<input type="submit" onclick="requestPay()" value="결제하기">


<script type="text/javascript">
	function requestPay(){
		$.ajax({
            url: "/flight/seat/check",
            type: "GET",
            dataType: "json",
            success: function (response) {
            		console.log(response);
            		iamPort();
            },
            error: function (error) {
            	console.log(JSON.stringify(error));
                //window.location.href="/";
            }
        });
	}
	
    function iamPort() {
    	var IMP = window.IMP;
    	var impNumber = "";
    	impNumber = `${sessionScope.impNumber}`;
    	
    	var merchantUid = `${merchantUid}`;
    	var paymentName = `${sessionScope.flightName}`;
    	var amount = `${sessionScope.amount}`;
    	var memberEmail = `${memberEmail}`;
    	var memberName = `${sessionScope.memberName}`;
    	var memberPhoneNumber = `${memberPhoneNumber}`;
    	var memberAddress = `${memberAddress}`;
    	
    	console.log("구매 번호: " + merchantUid);
    	console.log("구매 내용: " + paymentName);
    	console.log("가격: " + amount);
    	console.log("사용자 정보: " + memberEmail + "/" + memberName + "/" + memberPhoneNumber + "/" + memberAddress);
    	
    	IMP.init(impNumber); 
      	IMP.request_pay({ // param
	          pg: "html5_inicis.INIBillTst",
	          pay_method: "card",
	          merchant_uid: "ORD20180131-00000205", // 반드시 다른 번호를 줘야함
	          name: `${flightName}`,
	          amount: `${amount}`,
	          buyer_email: "gildong@gmail.com",
	          buyer_name: `${memberName}`,
	          buyer_tel: "010-4242-4242",
	          buyer_addr: "서울특별시 강남구 신사동",
	      }, function (rsp) { // callback
	      if (rsp.success) {
	         // 결제 성공 시 로직
	         alert(rsp);
	         window.location.href="/flight/ticket/paymentCompleted";
	      } else {
	          console.log(rsp);
	          alert(rsp.error_msg);
	          window.location.href="/";
	      }
      });
    }
</script>
</body>
</html>