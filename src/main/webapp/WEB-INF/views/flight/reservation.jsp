<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
  <section>
		<p>예약확인</p>
<input type="text" id="impNumber" name="impNumber" value="${sessionScope.impNumber}">
<div>
	<div><p>항공사 이름</p> <p>${sessionScope.flightScheduleToGo.airlineName}</p></div>
	<div><p>비행기 기종</p> <p>${sessionScope.flightScheduleToGo.airplaneTypeName}</p></div>
	<div><p>출발 도시</p> <p>${sessionScope.flightScheduleToGo.departmentNation}</p></div>
	<div><p>도착 도시</p> <p>${sessionScope.flightScheduleToGo.arrivalNation}</p></div>
	<div><p>출발 날짜</p> <p>${sessionScope.flightScheduleToGo.departmentDate}</p></div>
	<div><p>도착 날짜</p> <p>${sessionScope.flightScheduleToGo.arrivalDate}</p></div>
	<div><p>출발 시간</p> <p>${sessionScope.flightScheduleToGo.departmentTime}</p></div>
	<div><p>도착 시간</p> <p>${sessionScope.flightScheduleToGo.arrivalTime}</p></div>
	<div><p>비행 시간</p> <p>${sessionScope.flightScheduleToGo.flightTimeDetail}</p></div>
	
	<c:choose> 
		<c:when test="${sessionScope.search.grade eq '1' }">
			/ 좌석 등급: 이코노미
			/ 좌석 금액: ${sessionScope.selectScheduleToGo.economyClassFare}
		</c:when> 
		<c:when test="${sessionScope.search.grade eq '2'}">
			/ 좌석 등급: 비즈니스
			/ 좌석 금액: ${sessionScope.selectScheduleToGo.businessClassFare}
		</c:when> 
		<c:otherwise>
			/ 좌석 등급: 퍼스트
			/ 좌석 금액: ${sessionScope.selectScheduleToGo.firstClassFare}
		</c:otherwise> 
	</c:choose> 
</div>
<div>
	<p>
		오는편 항공권
		항공사 이름: ${sessionScope.selectScheduleToCome.airlineName}
		/ 비행기기종: ${sessionScope.selectScheduleToCome.airplaneTypeName}
		/ 출발 시간: ${sessionScope.selectScheduleToCome.departmentNation}
		/ 도착 시간: ${sessionScope.selectScheduleToCome.arrivalNation}
		/ 출발 날짜: ${sessionScope.selectScheduleToCome.departmentDate}
		/ 도착 날짜: ${sessionScope.selectScheduleToCome.arrivalDate}
		/ 출발 시간: ${sessionScope.selectScheduleToCome.departmentTime}
		/ 도착 시간: ${sessionScope.selectScheduleToCome.arrivalTime}
		/ 비행 시간: ${sessionScope.selectScheduleToCome.flightTimeDetail}
	<c:choose> 
		<c:when test="${sessionScope.search.grade eq '1' }">
			/ 좌석 등급: 이코노미
			/ 좌석 금액: ${sessionScope.selectScheduleToCome.economyClassFare}
		</c:when> 
		<c:when test="${sessionScope.search.grade eq '2'}">
			/ 좌석 등급: 비즈니스
			/ 좌석 금액: ${sessionScope.selectScheduleToCome.businessClassFare}
		</c:when> 
		<c:otherwise>
			/ 좌석 등급: 퍼스트
			/ 좌석 금액: ${sessionScope.selectScheduleToCome.firstClassFare}
		</c:otherwise> 
	</c:choose>
	</p>
</div>
<p>결제 금액: ${sessionScope.totalPrice}</p>
<p>인원수: ${sessionScope.search.person}</p>
<form action="<c:url value="/flight/ticket/insert"/>" method="post">
	<input type="hidden" name="person" value="${sessionScope.search.person}">
	<c:choose> 
		<c:when test="${sessionScope.search.grade eq '1' }">
			<input type="hidden" name="fareToGo" value="${sessionScope.selectScheduleToGo.economyClassFare}">
			<input type="hidden" name="fareToCome" value="${sessionScope.selectScheduleToCome.economyClassFare}">
		</c:when> 
		<c:when test="${sessionScope.search.grade eq '2'}">
			<input type="hidden" name="fareToGo" value="${sessionScope.selectScheduleToGo.businessClassFare}">
			<input type="hidden" name="fareToCome" value="${sessionScope.selectScheduleToCome.businessClassFare}">
		</c:when> 
		<c:otherwise>
			<input type="hidden" name="fareToGo" value="${sessionScope.selectScheduleToGo.firstClassFare}">
			<input type="hidden" name="fareToCome" value="${sessionScope.selectScheduleToCome.firstClassFare}">
		</c:otherwise> 
	</c:choose>
	<c:forEach var="i" begin="1" end="${sessionScope.search.person}">
		<div>
		이름: <input type="text" name="name">
		영문 이름: <input type="text" name="firstName">
		영문 성: <input type="text" name="lastName">
		전화 번호: <input type="text" name="phoneNumber">
		생일: <input type="date" name="birthday">
		여권 번호: <input type="text" name="passportNumber">
		여권 만료일: <input type="date" name="passportExpiryDate">
		</div>
	<br>
	</c:forEach>
	<input type="submit" value="탑승객 정보 입력">
</form>
	<button onclick="requestPay()">결제하기</button>
	</section> 
</body>

</html>
