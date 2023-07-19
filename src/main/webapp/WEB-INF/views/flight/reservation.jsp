<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
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
	/ 비행 시간: ${sessionScope.flightScheduleToCome.flightTime}
	/ 좌석 금액: ${sessionScope.flightScheduleToCome.economyClassFare}
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
</body>
</html>
