<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<style>
</style>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>Signup</h2>
							<p>회원가입</p>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="insertform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="sign">
						<c:url var="insertURL" value='/member/insert' />
						<form:form action="${insertURL}" method="post" id="insertMember"
							modelAttribute="member">
							
							<br>
							<div class="form-group">
								<label for="memberId"></label>
								<div class="sign">
									<h5>
										아이디<span style="color: red;">*</span>
									</h5>
									<input type="text" value="${member.memberId}" name="memberId"
										id="memberId"
										${empty member.memberId? "" : "readonly='readonly'" }
										class="form-control" required="required"> <span
										id="ispan"></span>
									<form:errors path="memberId" class="error" />


								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="password"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										비밀번호<span style="color: red;">*</span>
									</h5>
									<form:input type="password" path="password" id="password"
										class="form-control" required="required" />
									<form:errors path="password" class="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="password2"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;" plceholder>
										비밀번호<span style="color: red;">*</span>
									</h5>
									<form:input type="password" path="password2" id="password2"
										class="form-control" required="required" />
									<form:errors path="password2" class="error" />
									<span id="passwordConfirm" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="name"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										이름(한글)<span style="color: red;">*</span>
									</h5>
									<form:input type="text" path="name" id="name"
										class="form-control" required="required" />
									<form:errors path="name" class="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="firstName"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										이름(영문, FirstName)<span style="color: red;">*</span>
									</h5>
									<form:input type="text" path="firstName" id="firstName"
										class="form-control" required="required" />
									<form:errors path="firstName" class="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="lastName"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										이름(영문, LastName)<span style="color: red;">*</span>
									</h5>
									<form:input type="text" path="lastName" id="lastName"
										class="form-control" required="required" />
									<form:errors path="lastName" class="error" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="phoneNumber"></label>
								<div class="sign">
									<h5 style="line-height: 1.7em;">
										휴대전화(xxx-xxxx-xxxx)<span style="color: red;">*</span>
									</h5>
									<form:input type="text" path="phoneNumber" id="phoneNumber"
										class="form-control" required="required" />
									<form:errors path="phoneNumber" class="error" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="birthday"></label>
								<div class="sign">
									<h5>
										생년월일(YY/MM/DD)<span style="color: red;">*</span>
									</h5>
									<form:input type="date" path="birthday" id="birthday"
										class="form-control" required="required" />
									<form:errors path="birthday" class="error" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="address"></label>
								<div class="sign">
									<h5 style="line-height: 1.7em;">
										주소<span style="color: red;">*</span>
									</h5>
									<form:input type="text" path="address" id="address"
										class="form-control" required="required" />
									<form:errors path="address" class="error" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="email"></label>
								<div class="sign">
									<h5>
										이메일<span style="color: red;">*</span>
									</h5>
									<form:input type="email" path="email" id="email"
										class="form-control" required="required" />
									<form:errors path="email" class="error" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="gender"></label>
								<div class="sign">
									<h5 style="line-height: 1.7em;">
										성별(남/여)<span style="color: red;">*</span>
									</h5>
									<input type="radio" name="gender" id="male" value="남">
									<label for="male">남</label> <input type="radio" name="gender"
										id="female" value="여"> <label for="female">여</label>
								</div>
							</div>
							<hr>
							<div class="signagree">
								<h6>
									이메일 수신에 동의하십니까? <input type="checkbox" name="agree" id="cb4">
									<label for="cb4"></label> 동의함
								</h6>
							</div>
							<hr>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-8">
									<input type="submit" class="btn btn-info" value="SAVE">
									<input type="reset" class="btn btn-info" value="CANCEL">
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::industries end::-->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />
</body>
<script type="text/javascript">
	var pwd1 = document.querySelector("#password");
	var pwd2 = document.querySelector("#password2");
	var pwdConfirm = document.querySelector("#passwordConfirm");
	pwd2.onkeyup = function(event) {
		if (pwd1.value !== pwd2.value) {
			pwdConfirm.innerText = "❗비밀번호가 일치하지 않습니다❗";
		} else {
			pwdConfirm.innerText = "check✅";
		}
	}

	$(document).ready(function() {
		$('#memberId').keyup(function() {
			var memberId = $(this).val(); //memberId값이 "memberId"인 입력란의 값을 저장
			$.ajax({
				url : '/myapp/member/idcheck', //Controller에서 요청 받을 주소
				/* type:'post', //POST 방식으로 전달 */
				data : {
					'memberId' : memberId
				},
				success : function(result) {
					if (result == 'true') {
						$('#ispan').text('사용 가능한 아이디입니다.');
					} else {
						$('#ispan').text('이미 존재하는 아이디입니다.');
					}
				}
			});
		});
	});
</script>

</html>