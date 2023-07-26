
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
							<h2>로그인</h2>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="loginform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<script>	
	$(document).ready(function(){
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#memberId").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#memberId").val() != ""){ 
	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#memberId").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });

	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
     
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
                console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>
					<form action="<c:url value='/member/login'/>" method="post"
						style="border-shadow: 3px solid; width: 70%; margin: 0 auto; padding: 40px;">
						<div class="form-group">
							<h5>아이디</h5>
							<label for="memberId"></label>
							<div class="sign">
								<input class="form-control" name="memberId" type="text"
									placeholder="아이디를 입력하세요.">
							</div>
							<label for="password"></label>
							<div class="sign">
								<h5>비밀번호</h5>
								<input class="form-control" name="password" type="password"
									placeholder="비밀번호를 입력하세요.">
							</div>
							<div style="display: flex; justify-content: space-between;">
								<div>
									<p>아이디 저장</p>
									<div class="confirm-switch">
										<input type="checkbox" id="confirm-switch"></input> <label
											for="confirm-switch"></label>
									</div>
								</div>
								<div>
									<input type="submit" class="genric-btn success" value="로그인">
								</div>
							</div>
							<br> <br>
							<div class="login-sub ">
								<a href="<c:url value='/member/insert'/>"
									class="genric-btn success-border radius">회원가입</a> <a
									href="<c:url value='/member/findpwd'/>"
									class="genric-btn success-border radius">비밀번호 찾기</a>

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />


</body>
	<style>
.sign input {
	margin: 0 0 20px;
	padding: 10px 15px;
	border: 1px solid #ccc;
	color: #ccc;
}

.form-control {
	width: 100%;
}
</style>
</html>