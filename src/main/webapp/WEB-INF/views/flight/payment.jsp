<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>항공권 결제</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
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
							<h2>탑승객 정보</h2>
							<div class="bar_search_panel">
								<p class="search">왕복</p>
								<p class="search">도시 ${sessionScope.search.departmentNation}
									→ ${sessionScope.search.arrivalNation}</p>
								<p class="search">날짜${sessionScope.search.departmentDate} ~
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
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<c:forEach var="passenger" items="${sessionScope.passengerList}"
					varStatus="status">
					<div style="display: flex;">
						<label for="memberId"></label>
						<div class="view">
							<h5 style="line-height: 2.5em;">예약자 정보</h5>
							<h3>${sessionScope.memberId}</h3>
						</div>
						<hr>
						<label for="scheduleIdToGo"></label>
						<div class="view">
							<h5 style="line-height: 2.5em;">가는 항공편 아이디</h5>
							<h3>${passenger.scheduleIdToGo}</h3>
						</div>
						<hr>
						<label for="scheduleIdToCome"></label>
						<div class="view">
							<h5 style="line-height: 2.5em;">오는 항공편 아이디</h5>
							<h3>${passenger.scheduleIdToCome}</h3>
						</div>
						<hr>
						<label for="reservationId"></label>
						<div class="view">
							<h5 style="line-height: 2.5em;">예약 번호</h5>
							<h3>${passenger.reservationId}</h3>
						</div>
					</div>
					<hr>

					<label for="name"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">
							<c:out value="${status.count}" />
							번 탑승객 이름
						</h5>
						<h3>${passenger.name}</h3>
					</div>
					<hr>
					<label for="FirstName"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">영문 이름</h5>
						<h3>${passenger.firstName}</h3>
					</div>
					<hr>
					<label for="lastName"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">영문 성</h5>
						<h3>${passenger.lastName}</h3>
					</div>
					<hr>
					<label for="phoneNumber"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">핸드폰 번호</h5>
						<h3>${passenger.phoneNumber}</h3>
					</div>
					<hr>
					<label for="birthday"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">생일</h5>
						<h3>${passenger.birthday}</h3>
					</div>
					<hr>
					<label for="passportNumber"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">여권 번호</h5>
						<h3>${passenger.passportNumber}</h3>
					</div>
					<hr>
					<label for="passportExpiryDate"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">여권 만료일</h5>
						<h3>${passenger.passportExpiryDate}</h3>
					</div>
					<hr>
					<label for="seatType"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">좌석 등급</h5>
						<c:choose>
							<c:when test="${passenger.seatType eq '1' }">
								<h3>이코노미</h3>
							</c:when>
							<c:when test="${passenger.seatType eq '2'}">
								<h3>비즈니스</h3>
							</c:when>
							<c:otherwise>
									<h3>퍼스트</h3>
							</c:otherwise>
						</c:choose>
					</div>
					<hr>
					<label for="fareToGo"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">가는편 항공권 요금</h5>
						<h3>${passenger.fareToGo}</h3>
					</div>
					<hr>
					<label for="fareToCome"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">오는편 항공권 요금</h5>
						<h3>${passenger.fareToCome}</h3>
					</div>
					<hr>
					<label for="totalPrice"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">총 결제 금액:</h5>
						<h3>${passenger.totalPrice}</h3>
					</div>
					<hr>
					<label for="reservationStatus"></label>
					<div class="view">
						<h5 style="line-height: 2.5em;">예약 상태</h5>
						<h3>${passenger.reservationStatus}</h3>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<input type="" onclick="requestPay()" value="결제하기"
		class="genric-btn info radius">
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />


	<script type="text/javascript">
		function requestPay() {
			$.ajax({
				url : "/flight/seat/check",
				type : "GET",
				dataType : "json",
				success : function(response) {
					console.log(response);
					iamPort();
				},
				error : function(error) {
					console.log(JSON.stringify(error));
					//window.location.href="/";
				}
			});
		}

		function iamPort() {
			var IMP = window.IMP;
			var impNumber = "${sessionScope.impNumber}";
			var merchantUid = "${sessionScope.reservationId}";
			var purchaseDetails = "${sessionScope.purchaseDetails}";
			var amount = "${sessionScope.totalPrice}";
			var memberEmail = "${sessionScope.memberEmail}";
			var memberName = "${sessionScope.memberName}";
			var memberPhoneNumber = "${sessionScope.memberPhoneNumber}";

			console.log("구매 번호: " + merchantUid);
			console.log("가격: " + amount);
			console.log("사용자 정보: " + memberEmail + "/" + memberName + "/"
					+ memberPhoneNumber);

			IMP.init(impNumber);
			IMP.request_pay({ // param
				pg : "html5_inicis.INIBillTst",
				pay_method : "card",
				merchant_uid : merchantUid,
				name : purchaseDetails,
				amount : amount,
				buyer_email : memberEmail,
				buyer_name : memberName,
				buyer_tel : memberPhoneNumber,
			}, function(rsp) { // callback
				if (rsp.success) {
					// 결제 성공 시 로직
					alert(rsp.success);
					$.ajax({
						method : 'GET',
						url : '/flight/ticket/paymentCompleted',
						success : function(data) {
							alert("좌석이 성공적으로 예약되었습니다.");
							console.log(data);
							window.location.href = "/"; // 여기에 누나 마이페이지 예약조회 url 넣으면 됨 ㅇㅋㅇㅋ ㅇㅋㅋ
						},
						error : function(err) {
							alert(err);
							window.location.href = "/";
						}
					})
				} else {
					console.log(rsp);
					alert(rsp.error_msg);
					window.location.href = "/flight/payment";
				}
			});
		}
	</script>
	<style>
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
</style>
</body>
</html>