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
							<h2>마이페이지</h2>
							<p>예약 내역 확인 및 회원 정보 수정</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="mpsection">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul style="display: flex;">
						<li style="width: 15%; padding-top: 3%;" class="submenu">
							<div>
								<ul>
									<li><a href="<c:url value='/member/mp'/>">회원 정보 조회</a></li>
									<li><a href="<c:url value='/member/reservationlist'/>">예약 내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원 정보 수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호 수정</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 75%; padding: 5%;">
							<div class="content">
								<section class="updatepw">
									<div class="col-lg-12">
										<h2>회원 탈퇴</h2>
										<hr>
										<br>

										<form action="<c:url value='/member/mp/delete'/>" method="post">
											<div class="form-group">
												<h5>비밀번호</h5>
												<input type="password" name="password" class="form-control"> 
												<input
													name="memberId" type="hidden" 
													value="${member.memberId}"><hr> 
													<input type="submit" class="genric-btn success" value="회원탈퇴">
												<input type="reset" class="genric-btn success"
													value="취소">
											</div>
										</form>
									</div>
								</section>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />
	<style>
.submenu {
	color: #415094;
}

.submenu li {
	margin-top: 5px;
	padding: 20px;
	font-size: 15px;
	font-size: 18px;
	padding: 20px;
}

.submenu li:hover {
	background: #f9f9ff;
}

li a {
	display: block;
	color: #0c3e72;
	transition: none;
}

li a:hover {
	color: #007bff;
}
</style>
</body>
</html>