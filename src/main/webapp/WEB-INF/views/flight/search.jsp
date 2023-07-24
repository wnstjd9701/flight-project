<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>항공권 검색</h2>
							<div class="bar_search_panel";>
								<span class="search">왕복</span> <span class="search">도시
									${sessionScope.search.departmentNation} →
									${sessionScope.search.arrivalNation}</span> <span class="search">날짜${sessionScope.search.departmentDate}
									~ ${sessionScope.search.arrivalDate}</span> <span class="search">인원:
									${sessionScope.search.person}명</span>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<span class="search">좌석 등급: 이코노미</span>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<span class="search">좌석 등급: 비즈니스</span>
									</c:when>
									<c:otherwise>
										<span class="search">좌석 등급: 퍼스트</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container box_1170">
		<div class="section-top-border">

			<c:choose>
				<c:when test="${goListCount eq '0' || comeListCount eq '0'}">
		검색된 항공권이 없습니다.
	</c:when>
				<c:otherwise>
					<form action="<c:url value="/flight/ticket/select"/>" method="get">
						<input type="hidden" name="grade"
							value="${sessionScope.search.grade}"> <input
							type="hidden" name="person" value="${sessionScope.search.person}">
						<input type="hidden" name="requestCount" value="${requestCount}">

						<h3>가는편 항공권: ${goListCount}</h3>
						<hr>
						<div class="progress-table">
							<table>
								<tr class="progress-table">
									<th>선택</th>
									<th>항공사 이름</th>
									<th>비행기 기종</th>
									<th>항공사 이미지</th>
									<th>출발 도시</th>
									<th>도착 도시</th>
									<th>출발 날짜</th>
									<th>도착 날짜</th>
									<th>출발 시간</th>
									<th>도착 시간</th>
									<th>비행 시간</th>
									<th>잔여 좌석</th>
									<th>좌석 금액</th>
								</tr>
								<c:forEach var="flightScheduleToGo"
									items="${flightScheduleToGo}" varStatus="status">
									<tr class="table-content">
										<td><input type="checkbox" name="scheduleListIdToGo"
											value="${flightScheduleToGo.scheduleId}"></td>
										<td>${flightScheduleToGo.airlineName}</td>
										<td>${flightScheduleToGo.airplaneTypeName}</td>
										<td>${flightScheduleToGo.image}</td>
										<td>${flightScheduleToGo.departmentNation}</td>
										<td>${flightScheduleToGo.arrivalNation}</td>
										<td>${flightScheduleToGo.departmentDate}</td>
										<td>${flightScheduleToGo.arrivalDate}</td>
										<td>${flightScheduleToGo.departmentTime}</td>
										<td>${flightScheduleToGo.arrivalTime}</td>
										<td>${flightScheduleToGo.flightTimeDetail}</td>
										<c:choose>
											<c:when test="${sessionScope.search.grade eq '1'}">
												<td>${flightScheduleToGo.economyClassRemain}</td>
												<td>${flightScheduleToGo.economyClassFare}</td>
											</c:when>
											<c:when test="${sessionScope.search.grade eq '2'}">
												<td>${flightScheduleToGo.businessClassRemain}</td>
												<td>${flightScheduleToGo.businessClassFare}</td>
											</c:when>
											<c:otherwise>
												<td>${flightScheduleToGo.firstClassRemain}</td>
												<td>${flightScheduleToGo.firstClassFare}</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
						</div>

						<h3>오는편 항공권: ${comeListCount}</h3>
						<hr>
						<div class="progress-table">
							<table>
								<tr>
									<th>선택</th>
									<th>항공사 이름</th>
									<th>비행기 기종</th>
									<th>항공사 이미지</th>
									<th>출발 도시</th>
									<th>도착 도시</th>
									<th>출발 날짜</th>
									<th>도착 날짜</th>
									<th>출발 시간</th>
									<th>도착 시간</th>
									<th>비행 시간</th>
									<th>잔여 좌석</th>
									<th>좌석 금액</th>
								</tr>
								<c:forEach var="flightScheduleToCome"
									items="${flightScheduleToCome}" varStatus="status">
									<tr class="table-content">
										<td><input type="checkbox" name="scheduleListIdToCome"
											value="${flightScheduleToCome.scheduleId}"></td>
										<td>${flightScheduleToCome.airlineName}</td>
										<td>${flightScheduleToCome.airplaneTypeName}</td>
										<td>${flightScheduleToCome.image}</td>
										<td>${flightScheduleToCome.departmentNation}</td>
										<td>${flightScheduleToCome.arrivalNation}</td>
										<td>${flightScheduleToCome.departmentDate}</td>
										<td>${flightScheduleToCome.arrivalDate}</td>
										<td>${flightScheduleToCome.departmentTime}</td>
										<td>${flightScheduleToCome.arrivalTime}</td>
										<td>${flightScheduleToCome.flightTimeDetail}</td>
										<c:choose>
											<c:when test="${sessionScope.search.grade eq '1'}">
												<td>${flightScheduleToCome.economyClassRemain}</td>
												<td>${flightScheduleToCome.economyClassFare}</td>
											</c:when>
											<c:when test="${sessionScope.search.grade eq '2'}">
												<td>${flightScheduleToCome.businessClassRemain}</td>
												<td>${flightScheduleToCome.businessClassFare}</td>
											</c:when>
											<c:otherwise>
												<td>${flightScheduleToCome.firstClassRemain}</td>
												<td>${flightScheduleToCome.firstClassFare}</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
							<p>
								<c:if test="${goListCount ne '0' || comeListCount ne '0'}">
									<input type="submit" class="genric-btn info radius" value="선택">
								</c:if>
							</p>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />

	<style>
.search {
	color: #a2a2a2;
	font-family: "Open Sans", sans-serif;
	line-height: 28px;
	font-size: 20px;
	margin-bottom: 0px;
	font-weight: 400;
}

th {
	font-size: 18px;
	line-height: 1.2em;
	font-weight: 400;
}

td {
	color: #a2a2a2;
	font-family: "Open Sans", sans-serif;
	line-height: 28px;
	font-size: 16px;
	margin-bottom: 0px;
	font-weight: 400;
}

.table {
	float: left;
	margin-left: 300px;
	width: calc(100% - 300px);
	border-bottom: 1px solid #eee;
	background-color: #eee3;
	margin-bottom: 10%;
}

.table-header {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	width: 100%;
	background: #fff;
	padding-left: 4%
}

.table-row {
	cursor: pointer;
	display: relative;
	width: 100%;
	height: auto;
	position: relative;
	overflow: hidden;
	transition: all 0.3s ease-in-out;
	font-size: 15px;
	border-top: 1px solid #eee;
	padding-left: 4%;
}

.table-data, .header_item {
	padding: 15px 0px;
	text-align: left;
	width: 10%;
	align-items: center;
	float: left;
	word-break: keep-all;
}
</style>
</body>
</html>