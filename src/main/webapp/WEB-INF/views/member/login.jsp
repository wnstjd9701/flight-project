<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<section class="loginform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>로그인</h2>
							<hr>
							<form action="<c:url value='/member/login'/>" method="post">
								<input class="long" name="id" type="text" placeholder="아이디"><br>
								<input class="long" name="password" type="password" placeholder="비밀번호">
							
							<br> <input type="checkbox" class="cb1">아이디 저장 <br>
							<input type="submit" value="로그인"><br>

							<div class="login-sub">
								<ul>
									<li><a href="insert">회원가입</a></li>
									<li><a href="pwFind">비밀번호 찾기</a></li>
								</ul>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
=======
<jsp:include page="/WEB-INF/views/header.jsp" />
</head>
<body>
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
</body>
</html>