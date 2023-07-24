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

	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2 style="width: 100%; padding: 20px;">항공권 예약</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function requestPay() {
			var IMP = window.IMP;
			var impNumber = "";
			impNumber = $('#impNumber').val();
			console.log(impNumber);
			IMP.init(impNumber); // 예: imp00000000
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({ // param
				pg : "html5_inicis.INIBillTst",
				pay_method : "card",
				merchant_uid : "ORD20180131-0000003", // 반드시 다른 번호를 줘야함
				name : "노르웨이 회전 의자",
				amount : 64900,
				buyer_email : "gildong@gmail.com",
				buyer_name : "홍길동",
				buyer_tel : "010-4242-4242",
				buyer_addr : "서울특별시 강남구 신사동",
				buyer_postcode : "01181",
			}, function(rsp) { // callback
				if (rsp.success) {
					// 결제 성공 시 로직
					console.log(rsp);
					window.location.href = "/home";
				} else {
					// 결제 실패 시 로직
					console.log(rsp);
					alert(rsp.error_msg);
					window.location.href = "/home";
				}
			});
		}
	</script>
	<section>
		<div class="container">
			<div class="row">
				<%-- <p>예약확인</p>
<input type="text" id="impNumber" name="impNumber" value="${sessionScope.impNumber}"> --%>
				<div style="width: 100%;">
					<ul style="display: flex;">
						<li style="width: 50%; padding: 5%;" class="ToGO">
							<div>
								<h3>가는 편 항공권</h3>
								<hr>
								<div class="view">
									<h4>항공사 이름 / 비행기 기종</h4>
									<p>${sessionScope.selectScheduleToGo.airlineName}/
										${sessionScope.selectScheduleToGo.airplaneTypeName}</p>
								</div>
								<hr>
								<div class="view">
									<h4>출발 도시 / 도착도시</h4>
									<p>${sessionScope.selectScheduleToGo.departmentNation}/
										${sessionScope.selectScheduleToGo.arrivalNation}</p>
								</div>
								<hr>
								<div class="view">
									<h4>출발 날짜 및 시간 / 도착 날짜 및 시간</h4>
									<p>${sessionScope.selectScheduleToGo.departmentDate},
										${sessionScope.selectScheduleToGo.departmentTime} /
										${sessionScope.selectScheduleToGo.arrivalDate},
										${sessionScope.selectScheduleToGo.arrivalTime}</p>
								</div>
								<hr>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<h4>좌석 등급 및 금액</h4>
										<p>이코노미 /
											${sessionScope.selectScheduleToGo.economyClassFare}</p>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<h4>좌석 등급 및 금액</h4>
										<p>비즈니스 /
											${sessionScope.selectScheduleToGo.businessClassFare}</p>
									</c:when>
									<c:otherwise>
										<h4>좌석 등급 및 금액</h4>
										<p>퍼스트 / ${sessionScope.selectScheduleToGo.firstClassFare}</p>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
						<li style="width: 50%; padding: 5%;" class="ToCome">
							<div>
								<h3>오는 편 항공권</h3>
								<hr>
								<div class="view">
									<h4>항공사 이름 / 비행기 기종</h4>
									<p>${sessionScope.selectScheduleToCome.airlineName}/
										${sessionScope.selectScheduleToCome.airplaneTypeName}</p>
								</div>
								<hr>
								<div class="view">
									<h4>출발 도시 / 도착도시</h4>
									<p>${sessionScope.selectScheduleToCome.departmentNation}/
										${sessionScope.selectScheduleToCome.arrivalNation}</p>
								</div>
								<hr>
								<div class="view">
									<h4>출발 날짜 및 시간 / 도착 날짜 및 시간</h4>
									<p>${sessionScope.selectScheduleToCome.departmentDate},
										${sessionScope.selectScheduleToCome.departmentTime} /
										${sessionScope.selectScheduleToCome.arrivalDate},
										${sessionScope.selectScheduleToCome.arrivalTime}</p>
								</div>
								<hr>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<h4>좌석 등급 및 금액</h4>
										<p>이코노미 /
											${sessionScope.selectScheduleToCome.economyClassFare}</p>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<h4>좌석 등급 및 금액</h4>
										<p>비즈니스 /
											${sessionScope.selectScheduleToCome.businessClassFare}</p>
									</c:when>
									<c:otherwise>
										<h3>좌석 등급 및 금액</h3>
										<p>퍼스트 /
											${sessionScope.selectScheduleToCome.firstClassFare}</p>
									</c:otherwise>
								</c:choose>
								<hr>
								<h3 style="color: red;">총 결제 금액: ${sessionScope.totalPrice}</h3>
							</div>
						</li>
					</ul>
				</div>
				<h3>인원수: ${sessionScope.search.person}</h3>
				<hr>
				<div class="container">
					<div class="row" style="justify-content: space-around;">
						<div>
							<hr>
							<form action="<c:url value="/flight/ticket/insert"/>"
								method="post" id="insertMember">
								<input type="hidden" name="person"
									value="${sessionScope.search.person}">
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<input type="hidden" name="fareToGo"
											value="${sessionScope.selectScheduleToGo.economyClassFare}">
										<input type="hidden" name="fareToCome"
											value="${sessionScope.selectScheduleToCome.economyClassFare}">
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<input type="hidden" name="fareToGo"
											value="${sessionScope.selectScheduleToGo.businessClassFare}">
										<input type="hidden" name="fareToCome"
											value="${sessionScope.selectScheduleToCome.businessClassFare}">
									</c:when>
									<c:otherwise>
										<input type="hidden" name="fareToGo"
											value="${sessionScope.selectScheduleToGo.firstClassFare}">
										<input type="hidden" name="fareToCome"
											value="${sessionScope.selectScheduleToCome.firstClassFare}">
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="1" end="${sessionScope.search.person}">
									<div class="nc_select">
									<p>탑승객 ${i} </p>
									<hr>
										이름: <input type="text" name="name" class="form-control">
										영문 이름: <input type="text" name="firstName"
											class="form-control"> 영문 성: <input type="text"
											name="lastName" class="form-control">
										<hr>
										전화 번호: <input type="text" name="phoneNumber"
											class="form-control"> 생일: <input type="date"
											name="birthday" class="form-control">
										<hr>
										여권 번호: <input type="text" name="passportNumber"
											class="form-control"> 여권 만료일: <input type="date"
											name="passportExpiryDate" class="form-control">
									</div>
									<hr>
								</c:forEach>
								<input type="submit" value="탑승객 정보 입력" class="genric-btn info radius">
							</form>
						</div>
					</div>
					class="genric-btn info radius"
				</div>
			</div>
		</div>
	</section>

	<style>
.form-control {
	display: inline-block;
}
</style>
</body>

</html>
