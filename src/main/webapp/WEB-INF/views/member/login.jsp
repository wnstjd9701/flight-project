<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp" />
</head>
<body>
<<<<<<< HEAD:src/main/webapp/WEB-INF/views/member/login.jsp
<form action="<c:url value="/member/login"/>" method="post">
	<input type="text" name="memberId">
	<input type="password" name="password">
	<input type="submit" value="로그인">
</form>
=======
	<%-- <form action="<c:url value="/login"/>" method="post">
		<input type="text" name="id"> <input type="password"
			name="password"> <input type="submit" value="로그인">
	</form>
	 --%>
	<div class="loginpage-wrap">
			<div class="section-left">

				<div class="d-div" style="width: 504px; margin: 0 auto;">
					<h2 style="font-size: 30px; margin: 0 auto;">로그인</h2>
					<hr class="hr1">
					<input class="long" id="id" type="text" placeholder="아이디"><br>
					<input class="long" id="pw" type="password" placeholder="비밀번호">
					<br> <input type="checkbox" class="cb1">아이디 저장 <br>
					<a class="d-button" href="#" style="color: #fff;">로그인</a>

					<div class="login-sub">
						<ul>
							<li><a href="signup">회원가입&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
							<li><a href="#">비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
				<div class="icon" style="text-align: center;">
					<a class="d-button">네이버 로그인</a> <a class="d-button"
						style="margin-right: 0px;">페이스북 로그인</a> <a class="d-button">카카오톡
						로그인</a> <a class="d-button" style="margin-right: 0px;">구글 로그인</a>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
	
>>>>>>> eab5c1367dc5feb1fade2a372585d1f88cfdbb2b:src/main/webapp/WEB-INF/views/login.jsp
</body>
</html>