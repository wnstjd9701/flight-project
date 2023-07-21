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
						<p class="nav-tag">왕복</p>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="booking_content">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="hotel" role="tabpanel"
								aria-labelledby="hotel-tab">
								<div class="booking_form">
									<form
										action='<c:url value="/flight/ticket/search/${nation}/${departmentDate}/${arrivalDate}"/>'
										method="get">
										<div class="form-row">
											<div class="form_colum">
												<select class="nc_select" name="nation">
													<option selected>도착 장소</option>
													<option value="ICN">서울</option>
													<option value="JP">도쿄</option>
													<option value="OSA">오사카</option>
													<option value="HKG">홍콩</option>
													<option value="BKK">방콕</option>
													<option value="SIN">싱가포르</option>
													<option value="BJS">베이징</option>
													<option value="LON">런던</option>
													<option value="PAR">파리</option>
													<option value="ROM">로마</option>
													<option value="FRA">프랑크푸르트</option>
													<option value="NYC">뉴욕</option>
													<option value="LAX">로스앤젤레스</option>
													<option value="SFO">샌프란시스코</option>
												</select>
											</div>
											<div class="form_colum">
												<input name="departmentDate" type="date" class="nc_input"
													placeholder="출발 날짜" pattern="YYYYMMdd">
											</div>
											<div class="form_colum">
												<input name="arrivalDate" type="date" class="nc_input"
													placeholder="오는 날짜" pattern="YYYYMMdd">
											</div>
											<div class="form_colum">
												<input class="nc_input" type="number" name="person"
													id="person" placeholder="인원수">

											</div>
											<div class="form_colum">
												<select class="nc_select" name="grade">
													<option selected>좌석등급</option>
													<option value="1">이코노미</option>
													<option value="2">비즈니스</option>
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
	<section class="event_part section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="event_slider owl-carousel">
						<div class="single_event_slider">
							<div class="row justify-content-end">
								<div class="col-lg-6 col-md-6">
									<div class="event_slider_content">
										<h5>Upcoming Event</h5>
										<h2>Maldeve - Asia</h2>
										<p>Waters make fish every without firmament saw had.
											Morning air subdue. Our. Air very one. Whales grass is fish
											whales winged.</p>
										<p>
											date: <span>12 Aug 2019</span>
										</p>
										<p>
											Cost: <span>Start from $820</span>
										</p>
										<p>
											Organizer: <span> Martine Agency</span>
										</p>
										<div class="rating">
											<span>Rating:</span>
											<div class="place_review">
												<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a>
											</div>
										</div>
										<a href="#" class="btn_1">Plan Details</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single_event_slider">
							<div class="row justify-content-end">
								<div class="ol-lg-6 col-md-6">
									<div class="event_slider_content">
										<h5>Upcoming Event</h5>
										<h2>Maldeve - Asia</h2>
										<p>Waters make fish every without firmament saw had.
											Morning air subdue. Our. Air very one. Whales grass is fish
											whales winged.</p>
										<p>
											date: <span>12 Aug 2019</span>
										</p>
										<p>
											Cost: <span>Start from $820</span>
										</p>
										<p>
											Organizer: <span> Martine Agency</span>
										</p>
										<div class="rating">
											<span>Rating:</span>
											<div class="place_review">
												<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a>
											</div>
										</div>
										<a href="#" class="btn_1">Plan Details</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single_event_slider">
							<div class="row justify-content-end">
								<div class="ol-lg-6 col-md-6">
									<div class="event_slider_content">
										<h5>Upcoming Event</h5>
										<h2>Maldeve - Asia</h2>
										<p>Waters make fish every without firmament saw had.
											Morning air subdue. Our. Air very one. Whales grass is fish
											whales winged.</p>
										<p>
											date: <span>12 Aug 2019</span>
										</p>
										<p>
											Cost: <span>Start from $820</span>
										</p>
										<p>
											Organizer: <span> Martine Agency</span>
										</p>
										<div class="rating">
											<span>Rating:</span>
											<div class="place_review">
												<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a>
											</div>
										</div>
										<a href="#" class="btn_1">Plan Details</a>
									</div>
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
	<section class="hotel_list section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>Top Hotel & Restaurants</h2>
						<p>Waters make fish every without firmament saw had. Morning
							air subdue. Our. Air very one. Whales grass is fish whales
							winged.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/ind/industries_1.png" alt="">
						<div class="hover_text">
							<div class="hotel_social_icon">
								<ul>
									<li><a href="#"><i class="ti-facebook"></i></a></li>
									<li><a href="#"><i class="ti-twitter-alt"></i></a></li>
									<li><a href="#"><i class="ti-linkedin"></i></a></li>
								</ul>
							</div>
							<div class="share_icon">
								<i class="ti-share"></i>
							</div>
						</div>
						<div class="hotel_text_iner">
							<h3>
								<a href="#"> Hotel Polonia</a>
							</h3>
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <span>(210 review)</span>
							</div>
							<p>London, United Kingdom</p>
							<h5>
								From <span>$500</span>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/ind/industries_2.png" alt="">
						<div class="hover_text">
							<div class="hotel_social_icon">
								<ul>
									<li><a href="#"><i class="ti-facebook"></i></a></li>
									<li><a href="#"><i class="ti-twitter-alt"></i></a></li>
									<li><a href="#"><i class="ti-linkedin"></i></a></li>
								</ul>
							</div>
							<div class="share_icon">
								<i class="ti-share"></i>
							</div>
						</div>
						<div class="hotel_text_iner">
							<h3>
								<a href="#"> Hotel Polonia</a>
							</h3>
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <span>(210 review)</span>
							</div>
							<p>London, United Kingdom</p>
							<h5>
								From <span>$500</span>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/ind/industries_3.png" alt="">
						<div class="hover_text">
							<div class="hover_text">
								<div class="hotel_social_icon">
									<ul>
										<li><a href="#"><i class="ti-facebook"></i></a></li>
										<li><a href="#"><i class="ti-twitter-alt"></i></a></li>
										<li><a href="#"><i class="ti-linkedin"></i></a></li>
									</ul>
								</div>
								<div class="share_icon">
									<i class="ti-share"></i>
								</div>
							</div>
						</div>
						<div class="hotel_text_iner">
							<h3>
								<a href="#"> Hotel Polonia</a>
							</h3>
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <span>(210 review)</span>
							</div>
							<p>London, United Kingdom</p>
							<h5>
								From <span>$500</span>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::industries end::-->

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
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/services_3.png" alt="">
						<h3>
							<a href="#"> Accomodation</a>
						</h3>
						<p>Luxarious and comfortable</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="resources/img/services_4.png" alt="">
						<h3>
							<a href="#"> Discover world</a>
						</h3>
						<p>Best tour plan for your next tour</p>
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

