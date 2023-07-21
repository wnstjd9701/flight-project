<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<script type="text/javascript">
	
    function requestPay() {
    	var IMP = window.IMP;
    	var impNumber = "";
    	impNumber = $('#impNumber').val();
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
<input type="text" id="impNumber" name="impNumber" value="${sessionScope.impNumber}">
<div>
	항공사 이름: ${sessionScope.flightScheduleToGo.airlineName}
	/ 비행기 기종: ${sessionScope.flightScheduleToGo.airplaneTypeName}
	/ 출발 도시: ${sessionScope.flightScheduleToGo.departmentNation}
	/ 도착 도시: ${sessionScope.flightScheduleToGo.arrivalNation}
	/ 출발 날짜: ${sessionScope.flightScheduleToGo.departmentDate}
	/ 도착 날짜: ${sessionScope.flightScheduleToGo.arrivalDate}
	/ 출발 시간: ${sessionScope.flightScheduleToGo.departmentTime}
	/ 도착 시간: ${sessionScope.flightScheduleToGo.arrivalTime}
	/ 비행 시간: ${sessionScope.flightScheduleToGo.flightTimeDetail} 
	<c:choose> 
		<c:when test="${sessionScope.grade eq '1' }">
			/ 좌석 등급: 이코노미
			/ 좌석 금액: ${sessionScope.flightScheduleToGo.economyClassFare}
		</c:when> 
		<c:when test="${sessionScope.grade eq '2'}">
			/ 좌석 등급: 비즈니스
			/ 좌석 금액: ${sessionScope.flightScheduleToGo.businessClassFare}
		</c:when> 
		<c:otherwise>
			/ 좌석 등급: 퍼스트
			/ 좌석 금액: ${sessionScope.flightScheduleToGo.firstClassFare}
		</c:otherwise> 
	</c:choose> 
</div>
<div>
	<p>
		오는편 항공권
		항공사 이름: ${sessionScope.flightScheduleToCome.airlineName}
		/ 비행기기종: ${sessionScope.flightScheduleToCome.airplaneTypeName}
		/ 출발 시간: ${sessionScope.flightScheduleToCome.departmentNation}
		/ 도착 시간: ${sessionScope.flightScheduleToCome.arrivalNation}
		/ 출발 날짜: ${sessionScope.flightScheduleToCome.departmentDate}
		/ 도착 날짜: ${sessionScope.flightScheduleToCome.arrivalDate}
		/ 출발 시간: ${sessionScope.flightScheduleToCome.departmentTime}
		/ 도착 시간: ${sessionScope.flightScheduleToCome.arrivalTime}
		/ 비행 시간: ${sessionScope.flightScheduleToCome.flightTimeDetail}
		<c:choose> 
		<c:when test="${sessionScope.grade eq '1' }">
			/ 좌석 등급: 이코노미
			/ 좌석 금액: ${sessionScope.flightScheduleToCome.economyClassFare}
		</c:when> 
		<c:when test="${sessionScope.grade eq '2'}">
			/ 좌석 등급: 비즈니스
			/ 좌석 금액: ${sessionScope.flightScheduleToCome.businessClassFare}
		</c:when> 
		<c:otherwise>
			/ 좌석 등급: 퍼스트
			/ 좌석 금액: ${sessionScope.flightScheduleToCome.firstClassFare}
		</c:otherwise> 
	</c:choose>
	</p>
</div>
<p>인원수: ${sessionScope.person}</p>
<form action="<c:url value="/flight/ticket/insert"/>" method="post">
	<c:forEach var="i" begin="1" end="${sessionScope.person}">
		<div>
		이름: <input type="text" name="name">
		영문 이름: <input type="text" name="firstName">
		영문 성: <input type="text" name="lastName">
		전화 번호: <input type="text" name="phoneNumber">
		생일: <input type="text" name="birthday">
		여권 번호: <input type="text" name="passportNumber">
		여권 만료일: <input type="text" name="passportExpiryDate">
		</div>
	<br>
	</c:forEach>
	<input type="submit" value="결제">
</form>
	<button onclick="requestPay()">결제하기</button>
</body>
</html>
