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
							<h2>mypage</h2>
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
						<li style="width: 30%; padding: 5%;" class="submenu">
							<div>
								<ul>
									<li><a href="<c:url value='/member/mp'/>">회원정보 조회</a></li>
									<li><a href="<c:url value='/member/reservationList'/>">예약
											내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원정보
											수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호
											수정</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 70%; padding: 5%;">
							<div class="content"></div>
							<section class="viewmypage">
								<div class="col-lg-12">
									<h2>회원 정보 조회</h2>
									<hr>
									<label for="reservationId"></label>
									<div class="view">
										<h5 style="line-height: 2.5em;">예약번호</h5>
										<h3>${tickect.reservationId}</h3>
									</div>
									<hr>
									<label for="name"></label>
									<div class="view">
										<h5 style="line-height: 2.5em;">이름(한글)</h5>
										<h3>${member.name}</h3>
									</div>
									<hr>
									<label for="FirstName"></label>
									<div class="view">
										<h5 style="line-height: 2.5em;">이름(영문, FristName)</h5>
										<h3>${member.firstName}</h3>
									</div>

									<hr>
									<label for="lastName"></label>
									<div class="view">
										<h5 style="line-height: 2.5em;">이름(영문, LastName)</h5>
										<h3>${member.lastName}</h3>
									</div>
									<hr>
									<label for="phoneNumber"></label>
									<div class="sign">
										<h5 style="line-height: 1.7em;">휴대전화</h5>
										<h3>${member.phoneNumber}</h3>
									</div>
									<hr>
									<label for="birthday"></label>
									<div class="sign">
										<h5>생년월일(YY/MM/DD)</h5>
										<h3>${member.birthday}</h3>
									</div>
									
									<hr>
									<label for="seatType"></label>
									<div class="sign">
										<h5>좌석 등급</h5>
										<h3>${tickect.seatType}</h3>
									</div>
									<hr>
									<label for="ticketType"></label>
									<div class="sign">
										<h5>티켓 타입</h5>
										<h3>${tickect.ticketType}</h3>
									</div>
									<hr>
									<label for="fareToGo"></label>
									<div class="sign">
										<h5>출발 항공기 요금</h5>
										<h3>${tickect.fareToGo}</h3>
									</div>
									<hr>
									<label for="fareToCome"></label>
									<div class="sign">
										<h5>도착 항공기 요금</h5>
										<h3>${tickect.fareToCome}</h3>
									</div>
									<hr>
									<label for="totalPrice"></label>
									<div class="sign">
										<h5>총합 요금</h5>
										<h3>${tickect.totalPrice}</h3>
									</div>
									<hr>
									<label for="reservationStatus"></label>
									<div class="sign">
										<h5>예약 상태</h5>
										<h3>${tickect.reservationStatus}</h3>
									</div>
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
</body>
</html>