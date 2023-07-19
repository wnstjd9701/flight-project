<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
<script>
</script>
<form action="/flight/companion" method="get">
					항공사 이름: ${sessionScope.flightScheduleToCome.airlineName}
					/ 비행기 기종: ${sessionScope.flightScheduleToCome.airplaneTypeName}
					/ 출발 도시: ${sessionScope.flightScheduleToCome.departmentNation}
					/ 도착 도시: ${sessionScope.flightScheduleToCome.arrivalNation}
					/ 출발 날짜: ${sessionScope.flightScheduleToCome.departmentDate}
					/ 도착 날짜: ${sessionScope.flightScheduleToCome.arrivalDate}
					/ 출발 시간: ${sessionScope.flightScheduleToCome.departmentTime}
					/ 도착 시간: ${sessionScope.flightScheduleToCome.arrivalTime}
					/ 비행 시간: ${sessionScope.flightScheduleToCome.flightTime}
					/ 좌석 금액: ${sessionScope.flightScheduleToCome.economyClassFare}
					<input type="submit" value="정보 가져오기">
</form>
					${companion}
</body>
</html>
