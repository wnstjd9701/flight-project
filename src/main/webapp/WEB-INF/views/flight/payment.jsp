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
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>탑승객 정보 확인 및 결제</h2>
							<div class="bar_search_panel">
								<p class="search">왕복</p>
								<p class="search">도시:
									${sessionScope.search.departmentNation} →
									${sessionScope.search.arrivalNation}</p>
								<p class="search">날짜: ${sessionScope.search.departmentDate}
									~ ${sessionScope.search.arrivalDate}</p>
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
			<div class="col-lg-12" style="margin-top: 3%;">
				<h5>예약자 아이디</h5>
				<h3>${sessionScope.memberId}</h3>
				<hr>
				<c:forEach var="passenger" items="${sessionScope.passengerList}"
					varStatus="status">
					<table>
						<tr>
							<th>예약 번호</th>
							<th>탑승객 번호</th>
							<th class="text-right">예약 상태</th>
						</tr>
						<tr>
							<td>
								<h4>${passenger.reservationId}</h4>
							</td>
							<td>
								<h4>
									<c:out value="${status.count}" />
								</h4>
							</td>
							<td>
								<h4 class="text-right">${passenger.reservationStatus}</h4>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<th>영문 이름</th>
							<th>영문 성</th>
						</tr>
						<tr>
							<td><h4>${passenger.name}</h4></td>
							<td><h4>${passenger.firstName}</h4></td>
							<td><h4>${passenger.lastName}</h4></td>
						</tr>
						<tr>
							<th>핸드폰 번호</th>
							<th>생일</th>
						</tr>
						<tr>
							<td><h4>${passenger.phoneNumber}</h4></td>
							<td><h4>${passenger.birthday}</h4></td>
						</tr>
						<tr>
							<th>여권 번호</th>
							<th>여권 만료일</th>
						</tr>
						<tr>
							<td><h4>${passenger.passportNumber}</h4></td>
							<td><h4>${passenger.passportExpiryDate}</h4></td>
							</t4>
						<tr>
							<th>좌석 등급</th>
							<th colspan="2" class="text-right">총 결제 금액</th>

						</tr>
						<tr>
							<td><c:choose>
									<c:when test="${passenger.seatType eq '1' }">
										<h4>이코노미</h4>
									</c:when>
									<c:when test="${passenger.seatType eq '2'}">
										<h4>비즈니스</h4>
									</c:when>
									<c:otherwise>
										<h4>퍼스트</h4>
									</c:otherwise>
								</c:choose>
							<td colspan="2" class="text-right"><h4>${passenger.fareToGo}(가는요금) + 
									${passenger.fareToCome} (오는 요금) = ${passenger.totalPrice}
									</h3></td>
						</tr>
					</table>
				</c:forEach>
			</div>
		</div>
	</div>
	<input type="submit" onclick="requestPay()" value="결제하기"
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
					alert(error);
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
					if (merchantUid == null) {
						window.location.href = "/";
					}
					window.location.href = "/flight/payment";
				}
			});
		}
	</script>

</body>
<style>
table {
	overflow: hidden;
	width: 80%;
	table-layout: fixed;
	margin-bottom: 4%;
}

td, th {
	text-align: left;
	border: 1px solid #ddd;
	padding: 10px;
}

th {
	background-color: #f2f2f2;
}

.text-right {
	text-align: right;
}

h3 {
	font-size: 1.75em;
}

h5 {
	line-height: 2.5em;
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
</style>
</html>