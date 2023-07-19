<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp"/>
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
						<li style="width: 30%; padding: 5%;">
							<div class="sub menu">
								<ul>
									<li><a href="<c:url value='/member/reservationList'/>">에약 내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원 정보 수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호 수정</a></li>
									<li><a href="<c:url value='/member/passengerList'/>">동승자 정보</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 70%; padding: 5%;">
							<div class="content">
								<section class="pwupdate">
									<div class="col-lg-12">
										<h2>비밀번호 변경</h2>
										<hr>
										<form action="<c:url value='/member/pwupdate'/>" method="post">
											<input class="long" name="id" type="text" placeholder="아이디"><br>
											<input class="long" name="password" type="password"
												placeholder="비밀번호"> <br> <input type="checkbox"
												class="cb1">아이디 저장 <br> <input type="submit"
												value="로그인"><br>

											<div class="login-sub">
												<ul>
													<li><a href="member/insertform">회원가입</a></li>
													<li><a href="pwFind">비밀번호 찾기</a></li>
												</ul>
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
</body>
</html>