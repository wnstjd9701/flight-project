
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="breadcrumb breadcrumb_bg">

		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>login</h2>
							<p>로그인</p>
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

					<form action="<c:url value='/member/login'/>" method="post"
						style="border-shadow: 3px solid; width: 70%; margin: 0 auto; padding: 40px;">
						<div class="form-group">
							<h5>ID</h5>
							<label for="memberId"></label>
							<div class="sign">
								<input class="form-control" name="memberId" type="text"
									placeholder="UserId">
							</div>
							<label for="password"></label>
							<div class="sign">
								<h5>Password</h5>
								<input class="form-control" name="password" type="password"
									placeholder="Password">
							</div>
							<div style="display: flex; justify-content: space-between;">
								<div>
									<p>Remember Id</p>
									<div class="confirm-switch">
										<input type="checkbox" id="confirm-switch"></input> <label
											for="confirm-switch"></label>
									</div>
								</div>
								<div>
									<input type="submit" class="genric-btn success" value="Login">
								</div>
							</div>
							<br>
							<br>
							<div class="login-sub ">
								<a href="<c:url value='/member/insert'/>"
									class="genric-btn link">Sign Up</a> <a
									href="<c:url value='/member/findpwd'/>" class="genric-btn link">Find
									Password</a>

							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />

	<style>
.sign input {
	margin: 0 0 20px;
	padding: 10px 15px;
	border: 1px solid #ccc;
	color: #ccc;
}
</style>
</body>
</html>