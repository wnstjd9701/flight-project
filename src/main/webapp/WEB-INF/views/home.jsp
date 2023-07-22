<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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

								<h1>Airplane</h1>
								<h3>Join!</h3>
								<a href="<c:url value='/member/login'/>" class="btn_1">Login</a>
								<a href="<c:url value='/member/insert'/>" class="btn_1">SignUp</a>
							</c:if>
							<c:if test="${not empty sessionScope.memberId}">
								<h1>Welcome!! ${memberId}</h1>
								<h3>Let’s Fly!</h3>
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
						<p class="nav-tag">Round Trip</p>
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
	<!-- Header part end-->

	<!--top place start-->
	<section class="top_place section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>Top Places to visit</h2>
						<p>Waters make fish every without firmament saw had. Morning
							air subdue. Our. Air very one. Whales grass is fish whales
							winged.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="resources/img/single_place_1.png" alt="">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<a href="#" class="place_btn">travel</a>
								<h3>Saintmartine Iceland</h3>
								<p>Technaf, Bangladesh</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <span>(210 review)</span>
								</div>
							</div>
							<div class="details_icon text-right">
								<i class="ti-share"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="resources/img/single_place_2.png" alt="">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<a href="#" class="place_btn">travel</a>
								<h3>Saintmartine Iceland</h3>
								<p>Technaf, Bangladesh</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <span>(210 review)</span>
								</div>
							</div>
							<div class="details_icon text-right">
								<i class="ti-share"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="resources/img/single_place_3.png" alt="">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<a href="#" class="place_btn">travel</a>
								<h3>Saintmartine Iceland</h3>
								<p>Technaf, Bangladesh</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <span>(210 review)</span>
								</div>
							</div>
							<div class="details_icon text-right">
								<i class="ti-share"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_place">
						<img src="resources/img/single_place_4.png" alt="">
						<div
							class="hover_Text d-flex align-items-end justify-content-between">
							<div class="hover_text_iner">
								<a href="#" class="place_btn">travel</a>
								<h3>Saintmartine Iceland</h3>
								<p>Technaf, Bangladesh</p>
								<div class="place_review">
									<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <a href="#"><i
										class="fas fa-star"></i></a> <span>(210 review)</span>
								</div>
							</div>
							<div class="details_icon text-right">
								<i class="ti-share"></i>
							</div>
						</div>
					</div>
				</div>
				<a href="#" class="btn_1 text-cnter">Discover more</a>
			</div>
		</div>
	</section>
	<!--top place end-->

	<!--top place start-->
	<section class="client_review section_padding">
		<div class="container">
			<div class="row ">
				<div class="col-xl-6">
					<div class="section_tittle">
						<h2>What they said</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="client_review_slider owl-carousel">
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
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
						<h2>We offered best services</h2>
						<p>Waters make fish every without firmament saw had. Morning
							air subdue. Our. Air very one. Whales grass is fish whales
							winged.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/services_1.png" alt="">
						<h3>
							<a href="#"> Transportation</a>
						</h3>
						<p>All transportation cost we bear</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/services_2.png" alt="">
						<h3>
							<a href="#"> Guidence</a>
						</h3>
						<p>We offer the best guidence for you</p>
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
	padding: 20px 0;
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

