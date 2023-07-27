<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<title>여행떠나조</title>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>마이페이지</h2>
							<p>예약 내역 확인 및 회원 정보 수정</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="mpsection">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul style="display: flex;">
						<li style="width: 25%; padding: 5%;" class="submenu">
							<div>
								<ul>
									<li><a href="<c:url value='/member/mp'/>">회원 정보 조회</a></li>
									<li><a href="<c:url value='/member/reservationlist'/>">예약
											내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원 정보
											수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호
											변경</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 75%; padding: 5%;">
							<div class="content"></div>
							<section class="viewmypage">
								<div class="col-lg-12">
									<h2>예약 내역 조회</h2>
									<hr>
									<form action="<c:url value='/member/reservationlist'/>"
										method="get">
										<label for="memberId"></label>
										<div class="view">
											<h4 style="line-height: 2.5em;">ID: ${memberId}</h4>
										</div>
										<table>
											<thead style="background: #f9f9ff;">
												<tr>
													<th>예약번호</th>
													<th>이름</th>
													<th>나라</th>
													<th>날짜</th>
													<th>시간</th>
													<!-- <th>휴대폰 번호</th> -->
													<th>좌석 타입</th>
													<!-- <th>티켓 타입</th> -->
													<th>예약상태</th>
													<th>총합 <br>요금</th>
												</tr>
											</thead>

											<c:forEach var="member" items="${memberList}"
												varStatus="status">
										<%-- 		<c:if
													test="${member.reservationStatus.equalsIgnoreCase('예약 완료')}"> --%>

													<tbody>
														<tr>
															<td>${member.reservationId}</td>
															<td>${member.name}</td>
															<td>${member.departmentNation}->
																${member.arrivalNation}</td>
															<td>${member.departmentDate}</td>
															<td>${member.departmentTime}~<br>
																${member.arrivalTime}
															</td>
															<%-- <td>${member.phoneNumber}</td> --%>
															<td><c:choose>
																	<c:when test="${passenger.seatType eq '1' }">
																	이코노미 클래스
																</c:when>
																	<c:when test="${passenger.seatType eq '2'}">
																	비즈니스 클래스
																</c:when>
																	<c:otherwise>
																	퍼스트 클래스
																</c:otherwise>
																</c:choose></td>
															<%-- <td>${member.ticketType}</td> --%>
															<td>${member.reservationStatus}</td>
															<td>${member.totalPrice}</td>
														</tr>
													</tbody>
									
											</c:forEach>
										</table>
									</form>
								</div>
							</section>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />

</body>
<style>
.submenu {
	color: #415094;
}

.submenu li {
	margin-top: 5px;
	padding: 20px;
	font-size: 15px;
	font-size: 18px;
	padding: 20px;
}

.submenu li:hover {
	background: #f9f9ff;
}

li a {
	display: block;
	color: #0c3e72;
	transition: none;
}

li a:hover {
	color: #007bff;
}
</style>
</html>