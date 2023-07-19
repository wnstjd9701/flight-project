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
<p>인원: ${sessionScope.person}</p>
<p>좌석 등급: ${sessionScope.grade}</p>
<c:choose>
	<c:when test="${goListCount eq '0' || comeListCount eq '0'}">
		검색된 항공권이 없습니다.
	</c:when>
	<c:otherwise>
		<form action="<c:url value="/flight/ticket/select"/>" method="get">
			<input type="hidden" name="grade" value="${sessionScope.grade}"> 
			<p>가는편 항공권: ${goListCount}</p>
			<c:forEach var="flightScheduleToGo" items="${flightScheduleToGo}" varStatus="status">
				<p>
					<input type="checkbox" name="scheduleIdList" value="${flightScheduleToGo.scheduleId}">
					<c:out value="${status.count}"/>
					항공사 이름: ${flightScheduleToGo.airlineName}
					/ 비행기 기종: ${flightScheduleToGo.airplaneTypeName} 
					/ 항공사 이미지: ${flightScheduleToGo.image}
					/ 출발 도시: ${flightScheduleToGo.departmentNation}
					/ 도착 도시: ${flightScheduleToGo.arrivalNation} 
					/ 출발 날짜: ${flightScheduleToGo.departmentDate}
					/ 도착 날짜: ${flightScheduleToGo.arrivalDate}
					/ 출발 시간: ${flightScheduleToGo.arrivalDate}
					/ 도착 시간: ${flightScheduleToGo.arrivalTime}
					/ 비행 시간: ${flightScheduleToGo.flightTime}
					/ 좌석 금액: ${flightScheduleToGo.economyClassFare}
					/ 잔여 좌석: ${flightScheduleToGo.economyClassRemain}
				</p>
			</c:forEach>
			<p>오는편 항공권: ${comeListCount}</p>
			<c:forEach var="flightScheduleToCome" items="${flightScheduleToCome}" varStatus="status">
				<p>
					<input type="checkbox" name="scheduleIdList" value="${flightScheduleToCome.scheduleId}">
					<c:out value="${status.count}"/>
					항공사 이름: ${flightScheduleToCome.airlineName}
					/ 비행기 기종: ${flightScheduleToCome.airplaneTypeName}
					/ 출발 도시: ${flightScheduleToCome.departmentNation}
					/ 도착 도시: ${flightScheduleToCome.arrivalNation}
					/ 출발 날짜: ${flightScheduleToCome.departmentDate}
					/ 도착 날짜: ${flightScheduleToCome.arrivalDate}
					/ 출발 시간: ${flightScheduleToCome.departmentTime}
					/ 도착 시간: ${flightScheduleToCome.arrivalTime}
					/ 비행 시간: ${flightScheduleToCome.flightTime}
					/ 좌석 금액: ${flightScheduleToCome.economyClassFare}
					/ 잔여 좌석: ${flightScheduleToCome.economyClassRemain}
			</c:forEach>
			<p><input type="submit" value="선택"></p>
		</form>
	</c:otherwise>
</c:choose>

</body>
</html>