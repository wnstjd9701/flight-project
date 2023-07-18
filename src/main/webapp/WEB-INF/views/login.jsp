<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp" />
</head>
<body>
	<%-- <form action="<c:url value="/login"/>" method="post">
		<input type="text" name="id"> 
		<input type="password" name="password"> 
		<input type="submit" value="로그인">
	</form>
	 --%>
	 <section class="loginform">
	 	<div class="container">
	 		<div></div>
	 	</div>
	 </section>
	<div class="loginpage-wrap">
		<div class="d-div">
			<h2>로그인</h2>
			<hr>
			<form action="<c:url value="/login"/>" method="post">
				<input class="long" id="id" type="text" placeholder="아이디"><br>
				<input class="long" id="pw" type="password" placeholder="비밀번호">
			</form>
			<br> <input type="checkbox" class="cb1">아이디 저장 <br>
			<a class="d-button" href="#" style="color: #fff;">로그인</a>

			<div class="login-sub">
				<ul>
					<li><a href="signup">회원가입</a></li>
					<li><a href="#">비밀번호 찾기</a></li>
				</ul>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>