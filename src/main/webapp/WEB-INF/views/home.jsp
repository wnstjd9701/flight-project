<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<title>여행떠나조</title>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-10">
					<div class="banner_text text-center">
						<div class="banner_text_iner">
							<c:if test="${empty sessionScope.memberId}">

								<h1>
									새로운 여행을<br>찾아보세요.
								</h1>
								<h3>같이 찾아볼까요?</h3>
								<a href="<c:url value='/member/login'/>" class="btn_1">로그인</a>
								<a href="<c:url value='/member/insert'/>" class="btn_1">회원가입</a>
							</c:if>
							<c:if test="${not empty sessionScope.memberId}">
								<h1>
									환영합니다! <br> ${memberId}님
								</h1>
								<h3>같이 떠나볼까요!</h3>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part start-->

	<!-- booking part start-->
	<section class="booking_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="booking_menu">
						<p class="nav-tag">
							<img src="<c:url value="/img/airplaneicon.png"/>" style="width:3%;"> 왕복
						</p>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="booking_content">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" role="tabpanel">
								<div class="booking_form">
									<form action='<c:url value="/flight/ticket/search"/>'
										method="get">
										<input type="hidden" name="page" value="1">
										<div class="form-row">
											<div class="form_colum">
												<select class="nc_select" name="nation">
													<option selected>도착 공항</option>
													<option value="ICN">서울(ICN)</option>
													<option value="TOK">도쿄(TOK)</option>
													<option value="OSA">오사카(OSA)</option>
													<option value="HKG">홍콩(HKG)</option>
													<option value="BKK">방콕(BKK)</option>
													<option value="SIN">싱가포르(SIN)</option>
													<option value="BJS">베이징(BJS)</option>
													<option value="LON">런던(LON)</option>
													<option value="PAR">파리(PAR)</option>
													<option value="ROM">로마(ROM)</option>
													<option value="FRA">프랑크푸르트(FRA)</option>
													<option value="NYC">뉴욕(NYC)</option>
													<option value="LAX">로스엔젤레스(LAX)</option>
													<option value="SFO">샌프란시스코(SFO)</option>
												</select>
											</div>
											<div class="form_colum">
												<input name="departmentDate" type="date" class="nc_input"
													id="department_date" data-placeholder="출발 날짜"
													pattern="YYYYMMdd" required>
											</div>
											<div class="form_colum">
												<input name="arrivalDate" type="date" class="nc_input"
													id="arrival_date" data-placeholder="도착 날짜"
													pattern="YYYYMMdd" required>
											</div>
											<!-- 현재 날짜 이전은 선택 불가능  -->
											<script>
												var now_utc = Date.now()
												var timeOff = new Date()
														.getTimezoneOffset() * 60000;
												var today = new Date(now_utc
														- timeOff)
														.toISOString().split(
																"T")[0];
												document.getElementById(
														"department_date")
														.setAttribute("min",
																today);
												document.getElementById(
														"arrival_date")
														.setAttribute("min",
																today);
											</script>
											<div class="form_colum">
												<input class="nc_input" type="number" name="person"
													id="person" placeholder="인원" required>

											</div>
											<div class="form_colum">
												<select class="nc_select" name="grade">
													<option selected>좌석 등급</option>
													<option value="1">일반석</option>
													<option value="2">비즈니스석</option>
													<option value="3">일등석</option>
												</select>
											</div>
											<div class="form_colum" style="width: 100%;">
												<div class="form_btn">
													<input type="submit" class="genric-btn info" value="검색">
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
	<!-- Header part end-->

	<!--top place start-->
	<section class="top_place section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>해외 인기 도시</h2>
						<p>이번 여름 휴가는 소중한 사람들과 특별한 곳으로 떠나볼까요?</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="<c:url value="/img/single_place_1.jpg"/>">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<h3>방콕</h3>
								<p>BangKok(Thailand)</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="<c:url value="/img/single_place_2.jpg"/>">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<h3>싱가포르</h3>
								<p>Singapore</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="<c:url value="/img/single_place_3.jpg"/>">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<h3>프랑크푸르트</h3>
								<p>Frankfurt(Germany)</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="<c:url value="/img/single_place_4.jpg"/>">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<h3>파리</h3>
								<p>Paris(France)</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--top place end-->



	<!--::industries start::-->
	<section class="best_services section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>최고의 서비스를 제공하기 위해서 노력하겠습니다.</h2>
						<p>Flight Easy와 함께 항공권 예매 빠르고 간편하게 하세요.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="<c:url value="/img/services_1.png"/>">
						<h3>
							<a href="#">항공권 예매</a>
						</h3>
						<p>원하는 항공권을 간편하고 빠르게 찾아<br>예약할 수 있도록 도와드리고 있습니다.</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="<c:url value="/img/services_2.png"/>">
						<h3>
							<a href="#">고객센터</a>
						</h3>
						<p>Flight Easy는 고객님의 개별 예약 번호를 <br> 통해 빠른상담을 도와드리고 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::industries end::-->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />

	<style>
.btn_1 {
	margin: 2%;
}

.nav-tag {
	border-bottom: 3px solid #2493e0 !important;
	color: #0c3e72;;
	text-align: center;
	padding: 20px 0;
}

input[type='date']::before {
	content: attr(data-placeholder);
	width: 100%;
}

input[type='date']:focus::before, input[type='date']:valid::before {
	display: none;
}

.genric-btn.info {
	float: right;
	margin-top: 40px;
	width: 100%;
}

.form-row {
	justify-content: center;
}
</style>
</body>

</html>

