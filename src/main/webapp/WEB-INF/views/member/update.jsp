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
						<li style="width: 30%; padding: 5%;">
							<div class="sub menu">
								<ul>
									<li><a href="<c:url value='/member/reservationList'/>">에약
											내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원 정보
											수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호
											수정</a></li>
									<li><a href="<c:url value='/member/passengerList'/>">동승자
											정보</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 70%; padding: 5%;">
							<div class="content">
								<section class="insertform">
									<div class="col-lg-12">
										<form action="<c:url value='/member/update'/>">
											<h2>회원 정보 수정</h2>
											<hr>
											<br>
											<div class="form-group">
												<label for="lastName"></label>
												<div class="sign">
													<h5 style="line-height: 2.5em;">
														이름(영문, LastName)<span style="color: red;">*</span>
													</h5>
													<input type="text" name="lastName" id="lastName"
														value="${member.lastName}" class="form-control" required>
												</div>
											</div>
											<hr>
											<div class="form-group">
												<label for="phoneNumber"></label>
												<div class="sign">
													<h5 style="line-height: 1.7em;">
														휴대전화(xxx-xxxx-xxxx)<span style="color: red;">*</span>
													</h5>
													<input type="text" name="phoneNumber" id="phoneNumber"
														value="${member.phoneNumber}" class="form-control"
														id="mobile" required>
												</div>
											</div>
											<hr>
											<div class="form-group">
												<label for="birthday"></label>
												<div class="sign">
													<h5>
														생년월일(YY/MM/DD)<span style="color: red;">*</span>
													</h5>
													<input type="date" name="birthday" id="birthday"
														value="${member.birthday}" class="form-control" required>
												</div>
											</div>
											<hr>
											<div class="form-group">
												<label for="address"></label>
												<div class="sign">
													<h5 style="line-height: 1.7em;">
														주소<span style="color: red;">*</span>
													</h5>
													<input type="text" name="address" id="address"
														value="${member.address}" class="form-control" required>
												</div>
											</div>
											<hr>
											<div class="form-group">
												<label for="email"></label>
												<div class="sign">
													<h5>
														이메일<span style="color: red;">*</span>
													</h5>
													<input type="email" name="email" id="email"
														value="${member.email}" class="form-control" required>
												</div>
											</div>
											<hr>
											<div class="form-group">
												<label for="gender"></label>
												<div class="sign">
													<h5 style="line-height: 1.7em;">
														성별(남/여)<span style="color: red;">*</span>
													</h5>
													<input type="text" name="gender" id="gender"
														value="${member.gender}" class="form-control" required>
												</div>
											</div>
											<hr>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-8">
													<input type="submit" class="btn btn-info" value="SAVE">
													<input type="reset" class="btn btn-info" value="CANCEL">
												</div>
											</div>
										</form>
									</div>
								</section>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />
</body>


</html>