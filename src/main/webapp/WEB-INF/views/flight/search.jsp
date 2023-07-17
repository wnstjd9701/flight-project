<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>검색 목록</p>
<p>항공권 목록 개수: ${goListCount}</p>
<p>인원: ${person}</p>
<p>좌석 등급: ${grade}</p>
<c:forEach var="flightScheduleToGo" items="${flightScheduleToGo}">
	<form action="<c:url value="/flight/ticket/reservation"/>" method="post">
		<p>
		<input type="checkbox" name="checkbox">
		항공사 이름: <input type="hidden" name="airlineName" readonly> ${flightScheduleToGo.airlineName} / 비행기 기종: ${flightScheduleToGo.airplaneTypeName} / 항공사 이미지: ${flightScheduleToGo.image} /
		출발 도시: ${flightScheduleToGo.departmentNation} / 도착 도시: ${flightScheduleToGo.arrivalNation} / 출발 날짜: ${flightScheduleToGo.departmentDate} /
		도착 날짜: ${flightScheduleToGo.arrivalDate} / 출발 시간: ${flightScheduleToGo.departmentTime} / 도착 시간: ${flightScheduleToGo.arrivalTime} / 
		비행 시간: ${flightScheduleToGo.flightTime} / 좌석 금액: ${flightScheduleToGo.economyClassFare} / 잔여 좌석: ${flightScheduleToGo.economyClassRemain}
		<input type="submit" value="선택">
		</p>
	</form>
</c:forEach>

<c:if test="${comeListCount eq '0'}"> 
		<p>검색된 항공권이 없습니다.</p>
</c:if>
<c:forEach var="flightScheduleToCome" items="${flightScheduleToCome}">
	<c:if test="${comeListCount eq '0'}">
		<p>검색된 항공권이 없습니다.</p>
	</c:if>
</c:forEach>

</body>
</html>