<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- style CSS -->
<link rel="stylesheet" href="resources/css/style.css">
<jsp:include page="/WEB-INF/views/header.jsp" />
</head>
<body>

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
									<li><a href="<c:url value='/relist'/>">에약 내역</a></li>
									<li><a href="<c:url value='/meupdate'/>">회원 정보 수정</a></li>
									<li><a href="<c:url value='/pwupdate'/>">비밀번호 수정</a></li>
									<li><a href="<c:url value='/colist'/>">동승자 정보</a></li>
									<li><a href="<c:url value='/medelete'/>">회원 탈퇴</a></li>
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
											<br> <label for="name"></label>
											<div class="sign">
												<h5 style="line-height: 2.5em;">
													이름(한글)<span style="color: red;">*</span>
												</h5>
												<input type="text" name="name" id="name"
													value="${member.name}" class="re" required>
											</div>
											<label for="firstName"></label>
											<div class="sign">
												<h5 style="line-height: 2.5em;">
													이름(영문, FirstName)<span style="color: red;">*</span>
												</h5>
												<input type="text" name="firstName" id="firstName"
													value="${member.firstName}" class="re" required>
											</div>
											<label for="lastName"></label>
											<div class="sign">
												<h5 style="line-height: 2.5em;">
													이름(영문, LastName)<span style="color: red;">*</span>
												</h5>
												<input type="text" name="lastName" id="lastName"
													value="${member.lastName}" class="re" required>
											</div>
											<hr>
											<label for="phoneNumber"></label>
											<div class="sign">
												<h5 style="line-height: 1.7em;">
													휴대전화<span style="color: red;">*</span>
												</h5>
												<input type="text" name="phoneNumber" id="phoneNumber"
													value="${member.phoneNumber}" class="re" id="mobile"
													required>
											</div>
											<hr>
											<label for="birthday"></label>
											<div class="sign">
												<h5>
													생년월일<span style="color: red;">*</span>
												</h5>
												<input type="date" name="birthday" id="birthday"
													value="${member.birthday}" class="re" required>
											</div>
											<hr>
											<label for="address"></label>
											<div class="sign">
												<h5 style="line-height: 1.7em;">
													주소<span style="color: red;">*</span>
												</h5>
												<input type="text" name="address" id="address"
													value="${member.address}" class="re" required>
											</div>
											<hr>
											<label for="email"></label>
											<div class="sign">
												<h5>
													이메일<span style="color: red;">*</span>
												</h5>
												<input type="email" name="email" id="email"
													value="${member.email}" class="re" required>
											</div>
											<hr>
											<label for="gender"></label>
											<div class="sign">
												<h5 style="line-height: 1.7em;">
													성별<span style="color: red;">*</span>
												</h5>
												<input type="radio" name="gender" id="M"
													value="${member.gender}" class="re" required>남자 <input
													type="radio" name="gender" id="W" value="${member.gender}"
													class="re" required>여자
											</div>
											<hr>
											<label for="passportNumber"></label>
											<div class="sign">
												<h5 style="line-height: 1.7em;">
													여권번호<span style="color: red;">*</span>
												</h5>
												<input type="text" name="passportNumber" id="passportNumber"
													value="${member.passportNumber}" class="re" required>
											</div>
											<br> <label for="passportExpiryDate"></label>
											<div class="sign">
												<h5 style="line-height: 1.7em;">
													여권만료일<span style="color: red;">*</span>
												</h5>
												<input type="date" name="passportExpiryDate"
													id="passportExpiryDate"
													value="${member.passportExpiryDate}" class="re" required>
											</div>
											<hr>
											<div class="signagree">
												<h6>
													이메일 수신에 동의하십니까? <input type="checkbox" name="agree"
														id="cb4"> <label for="cb4"></label> 동의함
												</h6>
												SNS 수신에 동의 하십니까? <input type="checkbox" name="agree"
													id="cb5"> <label for="cb5"></label> 동의함
											</div>
											<hr>
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
</body>


</html>