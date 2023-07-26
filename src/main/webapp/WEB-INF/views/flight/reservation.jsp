<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<title>항공권 예약</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
							<h2>항공권 예약</h2>
							<div class="bar_search_panel">
								<p class="search">왕복</p>
								<p class="search">도시:  ${sessionScope.search.departmentNation}
									→ ${sessionScope.search.arrivalNation}</p>
								<p class="search">날짜: ${sessionScope.search.departmentDate} ~
									${sessionScope.search.arrivalDate}</p>
								<p class="search">인원: ${sessionScope.search.person}명</p>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<p class="search">좌석 등급: 이코노미</p>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<p class="search">좌석 등급: 비즈니스</p>
									</c:when>
									<c:otherwise>
										<p class="search">좌석 등급: 퍼스트</p>
									</c:otherwise>
								</c:choose>
							</div>
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
						<li
							style="width: 50%; margin: 3%; padding: 2%; background: #f9f9ff;"
							class="ToGO">
							<div>
								<h3>
									<img src="<c:url value="/img/tackoff.png" />"
										style="width: 10%; margin-right: 10px;"> 가는 편 항공권
								</h3>
								<hr>
								<div class="view">
									<h4>항공사 / 비행기 기종</h4>
									<p>
										<img
											src="<c:url value="/img/${sessionScope.selectScheduleToGo.image}"/>"
											style="width: 5%; margin-right: 10px;">
										${sessionScope.selectScheduleToGo.airlineName} /
										${sessionScope.selectScheduleToGo.airplaneTypeName}
									</p>
								</div>
								<hr>
								<div class="view">
									<h4>
										출발 도시 <img src="<c:url value="/img/right.png"/>"
											style="width: 5%; margin: 0px 10px;"> 도착도시
									</h4>
									<p>${sessionScope.selectScheduleToGo.departmentNation}<img
											src="<c:url value="/img/right.png"/>"
											style="width: 5%; margin: 0px 10px;">
										${sessionScope.selectScheduleToGo.arrivalNation}
									</p>
								</div>
								<hr>
								<div class="view">
									<h4>날짜 및 시간</h4>
									<p>${sessionScope.selectScheduleToGo.departmentDate}/
										${sessionScope.selectScheduleToGo.departmentTime} ~
										${sessionScope.selectScheduleToGo.arrivalTime}</p>
								</div>
								<hr>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<h4>좌석 등급 및 금액</h4>
										<p>이코노미 /
											${sessionScope.selectScheduleToGo.economyClassFare}원</p>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<h4>좌석 등급 및 금액</h4>
										<p>비즈니스 /
											${sessionScope.selectScheduleToGo.businessClassFare}원</p>
									</c:when>
									<c:otherwise>
										<h4>좌석 등급 및 금액</h4>
										<p>퍼스트 /
											${sessionScope.selectScheduleToGo.firstClassFare}원</p>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
						<li
							style="width: 50%; margin: 3%; padding: 2%; background: #f9f9ff;"
							class="ToCome">
							<div>
								<h3>
									<img src="<c:url value="/img/landing.png"/>"
										style="width: 10%; margin-right: 10px;"> 오는 편 항공권
								</h3>
								<hr>
								<div class="view">
									<h4>항공사 / 비행기 기종</h4>
									<p>
										<img
											src="<c:url value="/img/${sessionScope.selectScheduleToCome.image}"/>"
											style="width: 5%; margin-right: 10px;">
										${sessionScope.selectScheduleToCome.airlineName} /
										${sessionScope.selectScheduleToCome.airplaneTypeName}
									</p>
								</div>
								<hr>
								<div class="view">
									<h4>
										출발 도시 <img src="<c:url value="/img/right.png"/>"
											style="width: 5%; margin: 0px 10px;"> 도착도시
									</h4>
									<p>${sessionScope.selectScheduleToCome.departmentNation}<img
											src="<c:url value="/img/right.png"/>"
											style="width: 5%; margin: 0px 10px;">
										${sessionScope.selectScheduleToCome.arrivalNation}
									</p>
								</div>
								<hr>
								<div class="view">
									<h4>날짜 및 시간</h4>
									<p>${sessionScope.selectScheduleToCome.departmentDate}/
										${sessionScope.selectScheduleToCome.departmentTime} ~
										${sessionScope.selectScheduleToCome.arrivalTime}</p>
								</div>
								<hr>
								<c:choose>
									<c:when test="${sessionScope.search.grade eq '1' }">
										<h4>좌석 등급 및 금액</h4>
										<p>이코노미 /
											${sessionScope.selectScheduleToCome.economyClassFare}원</p>
									</c:when>
									<c:when test="${sessionScope.search.grade eq '2'}">
										<h4>좌석 등급 및 금액</h4>
										<p>비즈니스 /
											${sessionScope.selectScheduleToCome.businessClassFare}원</p>
									</c:when>
									<c:otherwise>
										<h3>좌석 등급 및 금액</h3>
										<p>퍼스트 /
											${sessionScope.selectScheduleToCome.firstClassFare}원</p>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
					</ul>
					<hr>
					<h3 style="color: red; text-align: right; margin-bottom: 10px;">총
						결제 금액: ${sessionScope.totalPrice}</h3>
				</div>
				<hr>
				<div class="container">
					<div class="row" style="justify-content: center;">
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
									<div class="nc_select" style="margin-bottom: 10px;">
										<h4>${i}번 탑승객 정보 입력</h4>
										<hr>

										<h5>이름:</h5>
										<input type="text" name="name" class="form-control">
										<h5>영문 이름:</h5>
										<input type="text" name="firstName" class="form-control">
										<h5>영문 성:</h5>
										<input type="text" name="lastName" class="form-control">
										<h5>전화 번호:</h5>
										<input type="text" name="phoneNumber" class="form-control">
										<hr>
										<h5>생일:</h5>
										<input type="date" name="birthday" id="birthday"
											class="form-control">
										<h5>여권 번호:</h5>
										<input type="text" name="passportNumber" class="form-control">
										<h5>여권 만료일:</h5>
										<input type="date" id="passportExpiryDate"
											name="passportExpiryDate" class="form-control">
										<!-- 생일은 오늘 이전 날짜만 선택 가능 / 여권 만료일은 오늘 이후만 가능 -->
										<script>
											var now_utc = Date.now()
											var timeOff = new Date()
													.getTimezoneOffset() * 60000;
											var today = new Date(now_utc
													- timeOff).toISOString()
													.split("T")[0];
											document.getElementById("birthday")
													.setAttribute("max", today);
											document.getElementById(
													"passportExpiryDate")
													.setAttribute("min", today);
										</script>
									</div>
									<hr>
								</c:forEach>
								<div style="text-align: right;">
									<input type="submit" value="탑승객 정보 입력"
										class="genric-btn info radius">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<style>
.form-control {
	display: inline-block;
	width: 16%;
	margin: 0px 10px;
}

.search {
	color: #a2a2a2;
	font-family: "Open Sans", sans-serif;
	line-height: 28px;
	font-size: 20px;
	font-weight: 400;
	padding: 10px;
}

.bar_search_panel {
	display: inline-flex;
}

h5 {
	display: contents;
}
</style>
</html>
