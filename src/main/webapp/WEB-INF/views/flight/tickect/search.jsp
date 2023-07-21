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
							<br>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="booking_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="booking_menu">
						<p class="nav-tag">Round Trip</p>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="booking_content">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" role="tabpanel">
								<div class="booking_form">
									<form
										action='<c:url value="/flight/ticket/search/${nation}/${departmentDate}/${arrivalDate}"/>'
										method="get">
										<div class="form-row">
											<div class="form_colum">
												<select class="nc_select" name="nation">
													<option selected>Arrival Nation</option>
													<option value="ICN">seoul</option>
													<option value="TOK">Tokyo</option>
													<option value="OSA">Osaka</option>
													<option value="HKG">HongKong</option>
													<option value="BKK">BangKok</option>
													<option value="SIN">Singapore</option>
													<option value="BJS">Beijing</option>
													<option value="LON">London</option>
													<option value="PAR">Paris</option>
													<option value="ROM">Roma</option>
													<option value="FRA">Frankfurt</option>
													<option value="NYC">New York City</option>
													<option value="LAX">Los Angeles</option>
													<option value="SFO">San Francisco</option>
												</select>
											</div>
											<div class="form_colum">
												<input name="departmentDate" type="date" class="nc_input"
													data-placeholder="Department Date" pattern="YYYYMMdd"
													required>
											</div>
											<div class="form_colum">
												<input name="arrivalDate" type="date" class="nc_input"
													data-placeholder="Arrival Date" pattern="YYYYMMdd" required>
											</div>
											<div class="form_colum">
												<input class="nc_input" type="number" name="person"
													id="person" placeholder="Person" required>

											</div>
											<div class="form_colum">
												<select class="nc_select" name="grade">
													<option selected>Seat Grade</option>
													<option value="1">EconomyClass</option>
													<option value="2">BusinessClass</option>
													<option value="3">firstClass</option>
												</select>
											</div>
											<div class="form_colum" style="width: 100%;">
												<div class="form_btn">
													<input type="submit" class="genric-btn info" value="Search">
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="search_part">
		<div>
			
		</div>
	</section>
	<section>
	<p>검색 목록</p>
		<table>
			<thead>
				<tr>
					<th>항공사이름</th>
					<th>비행기 기종</th>
					<th>항공사 이미지</th>
					<th>출발도시</th>
					<th>도착도시</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>비행시간</th>
					<th>잔여 좌석</th>
					<th>금액</th>
				</tr>
			</thead>
			<c:forEach var="flight" items="${goList}">
				<tr>
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
				</tr>
			</c:forEach>
		</table>
	</section>
	<!-- Header part end-->
	<%-- 
<p>항공권 목록 개수: ${goListCount}</p>
<p>인원: ${sessionScope.person}</p>
<c:choose> 
	<c:when test="${sessionScope.grade eq '1' }">
		 좌석 등급: 이코노미
	</c:when> 
	<c:when test="${sessionScope.grade eq '2'}">
		좌석 등급: 비즈니스
	</c:when> 
	<c:otherwise>
		좌석 등급: 퍼스트
	</c:otherwise> 
	</c:choose> 
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
					/ 출발 시간: ${flightScheduleToGo.departmentTime}
					/ 도착 시간: ${flightScheduleToGo.arrivalTime}
					/ 비행 시간: ${flightScheduleToGo.flightTimeDetail}
					<c:choose> 
						<c:when test="${sessionScope.grade eq '1'}">
							/ 잔여 좌석: ${flightScheduleToGo.economyClassRemain}
							/ 좌석 금액: ${flightScheduleToGo.economyClassFare}
						</c:when> 
						<c:when test="${sessionScope.grade eq '2'}">
							/ 잔여 좌석: ${flightScheduleToGo.businessClassRemain}
							/ 좌석 금액: ${flightScheduleToGo.businessClassFare}
						</c:when> 
						<c:otherwise>
							/ 잔여 좌석: ${flightScheduleToGo.firstClassRemain}
							/ 좌석 금액: ${flightScheduleToGo.firstClassFare}
						</c:otherwise> 
					</c:choose> 
				</p>
			</c:forEach>
			<p>오는편 항공권: ${comeListCount}</p>
			<c:forEach var="flightScheduleToCome" items="${flightScheduleToCome}" varStatus="status">
				<p>
					<input type="checkbox" name="scheduleIdList" value="${flightScheduleToCome.scheduleId}">
					<c:out value="${status.count}"/>
					항공사 이름: ${flightScheduleToCome.airlineName}
					/ 비행기 기종: ${flightScheduleToCome.airplaneTypeName}
					/ 항공사 이미지: <img src="${flightScheduleToCome.image}" alt="${flightScheduleToCome.image}">
					/ 출발 도시: ${flightScheduleToCome.departmentNation}
					/ 도착 도시: ${flightScheduleToCome.arrivalNation}
					/ 출발 날짜: ${flightScheduleToCome.departmentDate}
					/ 도착 날짜: ${flightScheduleToCome.arrivalDate}
					/ 출발 시간: ${flightScheduleToCome.departmentTime}
					/ 도착 시간: ${flightScheduleToCome.arrivalTime}
					/ 비행 시간: ${flightScheduleToCome.flightTimeDetail}
					<c:choose> 
						<c:when test="${sessionScope.grade eq '1' }">
							/ 잔여 좌석: ${flightScheduleToCome.economyClassRemain}
							/ 좌석 금액: ${flightScheduleToCome.economyClassFare}
						</c:when> 
						<c:when test="${sessionScope.grade eq '2'}">
							/ 잔여 좌석: ${flightScheduleToCome.businessClassRemain}
							/ 좌석 금액: ${flightScheduleToCome.businessClassFare}
						</c:when> 
						<c:otherwise>
							/ 잔여 좌석: ${flightScheduleToCome.firstClassRemain}
							/ 좌석 금액: ${flightScheduleToCome.firstClassFare}
						</c:otherwise> 
					</c:choose> 
			</c:forEach>
			<p><input type="submit" value="선택"></p>
		</form>
	</c:otherwise>
</c:choose>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />
</body> --%>
</html>