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
									<li><a href="<c:url value='/insert'/>">회원가입</a></li>
									<li><a href="<c:url value='/pwFind'/>">비밀번호 찾기</a></li>
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
</body>
</html>