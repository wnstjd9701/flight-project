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
									<li><a href="<c:url value='/member/reservationList'/>">에약내역</a></li>
									<li><a href="<c:url value='/member/mp/update'/>">회원
											정보수정</a></li>
									<li><a href="<c:url value='/member/updatepwd'/>">비밀번호수정</a></li>
									<li><a href="<c:url value='/member/passengerList'/>">동승자정보</a></li>
									<li><a href="<c:url value='/member/mp/delete'/>">회원 탈퇴</a></li>
								</ul>
							</div>
						</li>
						<li style="width: 70%; padding: 5%;">
							<div class="content">
								<section class="updatepw">
									<div class="col-lg-12">
										<h2>비밀번호 변경</h2>
										<hr>
										<form action="<c:url value='/member/updatepw'/>" method="get">
											<div class="form-group">
												<h5>기존 비밀번호</h5>
												<input name="password" type="password" class="form-control"
													placeholder="비밀번호확인" value="${member.password}"><br>
											</div>
										</form>
										<form action="<c:url value='/member/updatepw'/>" method="post">
											<h5>변경할 비밀번호</h5>
											<input type="password" name="password" id="password"
												value="${member.password}" class="form-control"
												pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>(영문
											대소문자/숫자/특수문자 조합, 6자이상)

											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-8">
													<input type="submit" class="btn btn-info" value="SAVE">
													<input type="reset" class="btn btn-info" value="CANCEL">
												</div>
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