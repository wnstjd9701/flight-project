<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp" />
</head>
<body>
	<section class="insertform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="sign">
						<form action="<c:url value='/member/insert'/>">
							<h2>회원가입</h2>
							<hr>
							<br>
							<div class="form-group">
								<label for="memberId"></label>
								<div class="sign">
									<h5>
										아이디<span style="color: red;">*</span>
									</h5>
									<input type="text" name="memberId" id="memberId"
										value="${member['memberId']}"
										${empty member.memberId ? "" : "readonly"}
										class="form-control" required>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="password"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										비밀번호<span style="color: red;">*</span>
									</h5>
									<input type="password" name="password" id="password"
										value="${member.password}" class="form-control"
										pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>(영문
									대소문자/숫자/특수문자 조합, 6자이상)
								</div>
							</div>
							<div class="form-group">
								<label for="password2"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										비밀번호 확인<span style="color: red;">*</span>
									</h5>
									<input type="password" name="password2" id="password2"
										class="form-control" required>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="name"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										이름(한글)<span style="color: red;">*</span>
									</h5>
									<input type="text" name="name" id="name" value="${member.name}"
										class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="firstName"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										이름(영문, FirstName)<span style="color: red;">*</span>
									</h5>
									<input type="text" name="firstName" id="firstName"
										value="${member.firstName}" class="form-control" required>
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
										value="${member.phoneNumber}" class="form-control" id="mobile"
										required>
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
								<label for="passportNumber"></label>
								<div class="sign">
									<h5 style="line-height: 1.7em;">
										여권번호<span style="color: red;">*</span>
									</h5>
									<input type="text" name="passportNumber" id="passportNumber"
										value="${member.passportNumber}" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="passportExpiryDate"></label>
								<div class="sign">
									<h5 style="line-height: 1.7em;">
										여권만료일(YY/MM/DD)<span style="color: red;">*</span>
									</h5>
									<input type="date" name="passportExpiryDate"
										id="passportExpiryDate" value="${member.passportExpiryDate}"
										class="form-control" required>
								</div>
							</div>
							<hr>
							<div class="signagree">
								<h6>
									이메일 수신에 동의하십니까? <input type="checkbox" name="agree" id="cb4">
									<label for="cb4"></label> 동의함
								</h6>
								SNS 수신에 동의 하십니까? <input type="checkbox" name="agree" id="cb5">
								<label for="cb5"></label> 동의함
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
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	var pw1 = document.querySelector("#password");
	var pw2 = document.querySelector("#password2");
	var pwConfirm = document.querySelector("#passwordConfirm");
	pw2.onkeyup = function(event) {
		if (pw1.value !== pw2.value) {
			pwConfirm.innerText = "비밀번호가 일치하지 않습니다.";
		} else {
			pwConfirm.innerText = "";
		}
	}
</script>
</html>