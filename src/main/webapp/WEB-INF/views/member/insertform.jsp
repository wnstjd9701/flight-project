<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<style>
</style>
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
					<div class="sign" style="width: 70%; margin: 0 auto;">
						<c:url var="insertURL" value='/member/insert' />
						<form:form action="${insertURL}" method="post" id="insertMember"
							modelAttribute="member">
							<div class="form-group">
								<br> <label for="memberId"></label>
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
									<p>(영문 대소문자/숫자/특수문자 조합, 6자이상)</p>
									<form:input type="password" path="password" id="password"
										class="form-control" required="required" />
									<form:errors path="password" class="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="password2"></label>
								<div class="sign">
									<h5 style="line-height: 2.5em;">
										비밀번호 확인<span style="color: red;">*</span>
									</h5>
									<form:input type="password" path="password2" id="password2"
										class="form-control" required="required" />
									<form:errors path="password2" class="error" />
									<span id="passwordConfirm"></span>
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
										<input type="hidden" id="sample6_postcode" placeholder="우편번호" name="postno"> 
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<input type="text" id="sample6_address" placeholder="주소" name="address"> 
										<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address"> 
										<input type="text" id="sample6_extraAddress" placeholder="참고항목">
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
							<div class="signagree" style="margin: 10px 0;">
								<h5 style="line-height: 1.7em;">이메일 수신에 동의하십니까?</h5>
								<div>
									<p>동의함</p>
									<div class="confirm-switch">
										<input type="checkbox" name="agree" id="cb4"> <label
											for="cb4"></label>
									</div>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<input type="submit" class="genric-btn success" value="저장">
								<input type="reset" class="genric-btn success" value="취소">
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
<style>
#ispan {
	margin-top: 2%;
	font-size: 15px;
	color: #0c3e72;
}

.genric-btn success {
	margin-right: 10%;
	text-align: center;
}

.form-control {
	width: 100%;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"/>
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