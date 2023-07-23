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
<<<<<<< HEAD
<div>
	<div>탑승객 정보 </div>
	<div>
		<c:forEach var="passenger" items="${sessionScope.passengerList}" varStatus="status">
			<p>예약자 정보: ${passenger.memberId}
			/가는 항공편 아이디: ${passenger.scheduleIdToGo}
			/오는 항공편 아이디: ${passenger.scheduleIdToCome}
			/예약 번호: ${passenger.reservationId}
			/ <c:out value="${status.count}"/>번 탑승객 이름: ${passenger.name}
			/영문 이름: ${passenger.firstName}
			/영문 성: ${passenger.lastName}
			/핸드폰 번호: ${passenger.phoneNumber}
			/생일: ${passenger.birthday}
			/여권 번호: ${passenger.passportNumber}
			/여권 만료일: ${passenger.passportExpiryDate}
			/좌석 등급: ${passenger.seatType}
			/가는편 항공권 요금: ${passenger.fareToGo}
			/오는편 항공권 요금: ${passenger.fareToCome}
			/총 결제 금액: ${passenger.totalPrice}
			/예약 상태: ${passenger.reservationStatus}
		</c:forEach>
	</div>
</div>
=======
<!--  <input type="text" id="impNumber" name="impNumber" value="${sessionScope.impNumber}"> -->

<input type="hidden" id="impNumber" name="impNumber" value="${sessionScope.impNumber}">
<input type="hidden" id="merchantUid" name="merchantUid" value="${sessionScope.merchantUid}">
<input type="hidden" id="flightName" name="flightName" value="${sessionScope.flightName}">
<input type="hidden" id="amount" name="amount" value="${sessionScope.amount}">
<input type="hidden" id="memberEmail" name="memberEmail" value="${sessionScope.memberEmail}">
<input type="hidden" id="memberName" name="memberName" value="${sessionScope.memberName}">
<input type="hidden" id="memberPhoneNumber" name="memberPhoneNumber" value="${sessionScope.memberPhoneNumber}">
<input type="hidden" id="memberAddress" name="memberAddress" value="${sessionScope.memberPhoneNumber}">
>>>>>>> 58a762dc9101822cc6e8a0b71fee4a71c68f2660

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
<<<<<<< HEAD
    	var impNumber = "${sessionScope.impNumber}";
    	var merchantUid = "${sessionScope.reservationId}";
    	var purchaseDetails = "${sessionScope.purchaseDetails}";
    	var amount = "${sessionScope.totalPrice}";
    	var memberEmail = "${sessionScope.memberEmail}";
    	var memberName = "${sessionScope.memberName}";
    	var memberPhoneNumber = "${sessionScope.memberPhoneNumber}";
=======
    	var impNumber = "";
    	impNumber = `${sessionScope.impNumber}`;
    	
    	var merchantUid = `${merchantUid}`;
    	var paymentName = `${sessionScope.flightName}`;
    	var amount = `${sessionScope.amount}`;
    	var memberEmail = `${memberEmail}`;
    	var memberName = `${sessionScope.memberName}`;
    	var memberPhoneNumber = `${memberPhoneNumber}`;
    	var memberAddress = `${memberAddress}`;
>>>>>>> 58a762dc9101822cc6e8a0b71fee4a71c68f2660
    	
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
	         alert(rsp.success);
	         $.ajax({
	        	 method: 'GET',
	        	 url: '/flight/ticket/paymentCompleted',
	        	 success: function(data) {
	        		 alert("좌석이 성공적으로 예약되었습니다.");
	        		 console.log(data);
	        		 window.location.href="/";
	        	 },
	        	 error: function(err){
	        		 alert(err);
	        		 window.location.href="/";
	        	 }
	         })
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