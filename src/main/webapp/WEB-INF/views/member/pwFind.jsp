<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<section class="pwform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>비밀번호 찾기</h2>
							<form action="<c:url value='/login'/>" method="post">
								<input class="long" name="id" type="text" placeholder="아이디"><br>
								<input class="long" name="password" type="email" placeholder="이메일"><br>
								<a href="insert">찾기</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>