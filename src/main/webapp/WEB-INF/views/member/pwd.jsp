<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<title>여행떠나조</title>
<style type="text/css">
.mybtn {
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}

.mybtn:hover .mybtn:focus {
	background: white;
	color: #212529;
	text-decoration: none;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="breadcrumb breadcrumb_bg">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>비밀번호 찾기</h2>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="pwform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="<c:url value='/member/findpwd'/>" method="post"
						style="border-shadow: 3px solid; width: 70%; margin: 0 auto; padding: 40px;">
						<div class="form-group">
							<label for="memberId"></label>
							<div class="sign">
								<h5>아이디</h5>
								<input class="form-control" name="memberId" type="text" id="memberId"
									placeholder="회원가입한 아이디를 입력하세요" required>
							</div>
							<label for="password"></label>
							<div class="sign">
								<h5>이메일</h5>
								<input class="form-control" name="email" type="text" id="email"
									placeholder="회원가입한 이메일주소를 입력하세요" required>
							</div>
							<br>
							<div class="login-sub ">
								<button type="button" id="findBtn" class="genric-btn success">찾기</button>
								<button type="button" onclick="history.go(-1);"
									class="genric-btn success">로그인으로</button>


							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#findBtn").click(function() {
				$.ajax({
					url : "/member/findpwd",
					type : "POST",
					data : {
						memberId : $("#memberId").val(),
						email : $("#email").val()
					},
					success : function(result) {
						alert(result);
					},
					error : function(err) {
						console.log(err);
					}
				})
			});
		})
	</script>
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
.sign input { margin: 0 0 20px; padding: 10px 15px; border: 1px solid
#ccc; color: #ccc; } .form-control { width: 100%; }
</style>
</html>