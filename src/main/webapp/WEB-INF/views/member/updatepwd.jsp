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
							<h2>mypage</h2>
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
						<li style="width: 30%; padding: 5%;" class="submenu">
							<div>
								<ul>
									<li><a href="<c:url value='/member/mp'/>">회원 정보 조회</a></li>
									<li><a href="<c:url value='/member/reservationlist'/>">예약 내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원 정보 수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호 변경</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 70%; padding: 5%;">
							<div class="content">
								<section class="updatepwd">
									<div class="col-lg-12">
										<h2>비밀번호 변경</h2>
										<hr>
										<br>
										<form action="<c:url value='/member/updatepwd'/>"
											method="post">
											<div class="form-group">
												<h5>현재 비밀번호</h5> <input
													type="password" id="originPassword" name="originPassword"
													class="form-control" required>
											</div>
											<div class="form-group">
												<h5>새로운 비밀번호</h5> <input
													type="password" id="updatePassword" name="updatePassword"
													class="form-control"
													pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
												<small class="form-text text-muted"> (영문
													대소문자/숫자/특수문자 조합, 6자 이상) </small>
											</div>
											<button type="submit" class="genric-btn success">비밀번호 변경</button>
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
<script type="text/javascript">
	$(document).ready(function() {
	//비밀번호 변경 체크
	$('#updatepwd').submit(
			function(){
				if($('#originpassword').val()==''){
					alert('현재 비밀번호를 입력하세요');
					$('#originPassword').focus();
					return false;
				}
				if($('#updatepassword').val()==''){
					alert('변경할 비밀번호를 입력하세요');
					$('#updatepassword').focus();
					return false;
				}
		});
	});
</script>
</html>