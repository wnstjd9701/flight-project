<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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
							<h2>마이페이지</h2>
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
									<li><a href="<c:url value='/member/mp'/>">회원 정보 조회</a></li>
									<li><a href="<c:url value='/member/reservationlist'/>">예약
											내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원 정보
											수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호
											변경</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 70%; padding: 5%;">
							<div class="content">
								<section class="insertform">
									<div class="col-lg-12">
										<form action="<c:url value='/member/mp/update'/>"
											method="post">
											<h2>회원 정보 수정</h2>
											<hr>
											<div class="form-group">
												<label for="memberID"></label>
												<div class="sign">
													<h5 style="line-height: 2.5em;">
														ID<span style="color: red;">*</span>
													</h5>
													<input type="text" name="memberId" id="memberId"
														value="${member.memberId}" class="form-control"
														readonly="readonly" />
												</div>
											</div>
											<div class="form-group" style="height: 0px; margin: 0px;">
												<label for="password"></label>
												<div class="sign">
													<h5 style="line-height: 2.5em;"></h5>
													<input type="hidden" name="password" id="password"
														value="${member.password}" class="form-control" required />
												</div>
											</div>
											<div class="form-group">
												<label for="name"></label>
												<div class="sign">
													<h5 style="line-height: 2.5em;">
														이름(한글)<span style="color: red;">*</span>
													</h5>
													<input type="text" name="name" id="name"
														value="${member.name}" class="form-control" required />
												</div>
											</div>
											<div class="form-group">
												<label for="firstName"></label>
												<div class="sign">
													<h5 style="line-height: 2.5em;">
														이름(영문, FirstName)<span style="color: red;">*</span>
													</h5>
													<input type="text" name="firstName" id="firstName"
														value="${member.firstName}" class="form-control" required />
												</div>
											</div>
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
													<input type="hidden" id="sample6_postcode"
														placeholder="우편번호" name="postno"> <input
														type="button" onclick="sample6_execDaumPostcode()"
														value="우편번호 찾기"><br> <input type="text"
														id="sample6_address" placeholder="주소" name="address"
														value="${member.address}" class="form-control-2"><br>
													<input type="text" id="sample6_detailAddress"
														placeholder="상세주소" name="address" class="form-control-2">
													<input type="text" id="sample6_extraAddress"
														placeholder="참고항목" class="form-control-2">
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
											<br>
											<div class="form-group">

												<input type="submit" class="genric-btn success" value="수정하기">
												<input type="reset" class="genric-btn success" value="취소">
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

.form-control {
	width: 100%;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var address = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							address = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							address = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("sample6_postcode").value = data.zonecode;
						document.getElementById("sample6_address").value = address;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>