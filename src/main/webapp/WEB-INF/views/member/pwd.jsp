<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<style type="text/css">
.mybtn{
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="pwform">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>비밀번호 찾기</h2>
							<form action="<c:url value='/member/findpwd'/>" method="post"
								id="findPasswordForm" class="form-horizontal">
								<div class="w3-content w3-container w3-margin-top">
									<div class="w3-container w3-card-4 w3-auto">
										<div class="w3-center w3-large w3-margin-top">
										</div>
										<div>
											<p>
												<label>아이디</label> <input class="w3-input" type="text"
													id="memberId" name="memberId"
													placeholder="회원가입한 아이디를 입력하세요" required>
											</p>
											<p>
												<label>이메일</label> <input class="w3-input" type="text"
													id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요"
													required>
											</p>
											<p class="w3-center">
												<button type="button" id="findBtn"
													class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
												<button type="button" onclick="history.go(-1);"
													class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">로그인으로</button>
											</p>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#findBtn").click(function() {
				$.ajax({
					url : "/myapp/member/findpwd",
					type : "POST",
					data : {
						memberId : $("#memberId").val(),
						email : $("#email").val()
					},
					success : function(result) {
						alert(result);
					},
					error : function(err) {
						console.log(err);
					}
				})
			});
		})
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<jsp:include page="/WEB-INF/views/include/staticScriptFile.jsp" />
</body>
</html>