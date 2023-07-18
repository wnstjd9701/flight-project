<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
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
