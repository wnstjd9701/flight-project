<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/header.jsp" />
</head>
<body>
	<div class="sign-div" style="padding: 20px;">
		<div class="sign">
			<h2 style="padding: 20px; font-size: 30px;">회원가입</h2>

			<hr class="hr1">
			<br>
			<h3>기본정보</h3>
			<hr class="hr1">
			<div class="sign-text">
				<h5>
					아이디<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">
				<input type="text" class="ia" required> (영문 소문자/숫자 , 4~16자)
			</div>
			<hr class="hr2">
			<div class="sign-text">
				<h5 style="line-height: 2.5em;">
					비밀번호<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">
				<input type="password" class="ia" required>(영문 대소문자/숫자/특수문자
				중 2가지 이상 조합, 10자~16자)
			</div>
			<hr class="hr2">
			<div class="sign-text">
				<h5 style="line-height: 2.5em;">
					비밀번호 확인<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">
				<input type="password" class="ia" required>
			</div>
			<hr class="hr2">
			<div class="sign-text">
				<h5 style="line-height: 2.5em;">
					이름<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">

				<input type="text" class="ia" required>
			</div>
			<hr class="hr2">
			<div class="sign-text">
				<h5 style="line-height: 8.5em;">
					주소<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">
				<input type="text" class="ib" required>&nbsp;-&nbsp;<input
					type="text" class="ib" required> <a class="zipcode-button">우편번호</a>
				<br> <input type="text" class="ia"
					style="margin-top: 10px; width: 300px;" required> 기본주소 <br>
				<input type="text" class="ia"
					style="margin-top: 10px; width: 300px;"> 상세주소
			</div>
			<hr class="hr2">
			<div class="sign-text">
				<h5 style="line-height: 1.7em;">일반전화</h5>
			</div>
			<div class="sign-input">
				<select>
					<option>02</option>
					<option>070</option>
				</select> &nbsp;-&nbsp; <input type="text" class="ib" id="phone">
				&nbsp;-&nbsp; <input type="text" class="ib" id="phone">
			</div>
			<hr class="hr2">
			<div class="sign-text">
				<h5 style="line-height: 1.7em;">
					휴대전화<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">
				<select>
					<option>010</option>
					<option>011</option>
					<option>016</option>
				</select> &nbsp;-&nbsp; <input type="text" class="ib" id="mobile" required>
				&nbsp;-&nbsp; <input type="text" class="ib" id="mobile" required>
			</div>
			<hr class="hr2">
			<h3 style="line-height: 2em;">추가정보</h3>
			<hr class="hr1" style="margin: 10px auto 10px;">
			<br>
			<div class="sign-text">
				<h5>
					생년월일<span style="color: red;">*</span>
				</h5>
			</div>
			<div class="sign-input">
				<input type="text" class="ib" required>&nbsp;년&nbsp; <input
					type="text" class="ib" required>&nbsp;월&nbsp; <input
					type="text" class="ib" required>&nbsp;일&nbsp; <input
					type="radio" name="radio">
				<h5 style="padding: 0px; margin-right: 20px;">양력</h5>
				<input type="radio" checked name="radio">
				<h5 style="padding: 0px;">음력</h5>
			</div>
			<hr class="hr2">
		</div>
	</div>


	<div class="sign-div">
		<div class="agree">
			<h3 style="line-height: 2em;">약관동의</h3>
			<hr class="hr1" style="margin: 10px auto 10px;">
			<br>
			<div>
				<h5>
					<input type="checkbox" name="agree_all" id="cb1"> <label
						for="cb1"></label> 이용약관 및 개인정보수집 및 이용 및 이벤트 정보 수신(선택)에 모두 동의합니다.
				</h5>
			</div>
			<div class="agree-con">
				<h5>[필수]이용약관 동의</h5>
				<div class="agree-con-t">
					<h6>
						<span style="line-height: 4em;"> 제1조(목적)</span><br> 이 약관은
						주식회사 센티크(전자상거래 사업자)가 운영하는 메이크힐 온라인 쇼핑몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련
						서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로
						합니다.<br> <br> ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지
						않는 한 이 약관을 준용합니다.」 <br> <br> 여러분은 본 약관을 읽고 동의하신 후 회원 가입을
						신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하
						‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로
						관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게
						이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해
						주세요.
					</h6>
				</div>
				<h6>
					이용약관에 동의하십니까? <input type="checkbox" name="agree" id="cb2">
					<label for="cb2"></label> 동의함
				</h6>
			</div>
			<hr>
			<div class="agree-con">
				<h5>[필수]개인정보 수집 및 이용 동의</h5>
				<div class="agree-con-t">
					<h6>
						<span style="line-height: 4em;"> 제1조(목적)</span><br> ** 본 양식은
						쇼핑몰 운영에 도움을 드리고자 샘플로 제공되는 서식으로 쇼핑몰 운영형태에 따른 수정이 필요합니다. 쇼핑몰에 적용하시기
						전, 쇼핑몰 운영 사항 등을 확인하시고 적절한 내용을 반영하여 사용하시기 바랍니다. **<br> <br>
						1. 개인정보 수집목적 및 이용목적 가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 ,
						구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스 <br> <br>
						2. 수집한 개인정보의 이용 네이버 및 네이버 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및
						향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. - 회원 가입 의사의 확인, 연령 확인
						및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여
						개인정보를 이용합니다.<br> <br> 여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수
						있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을
						부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해
						설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수
						있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.
					</h6>
				</div>
				<h6>
					개인정보 수집 및 이용에 동의하십니까? <input type="checkbox" name="agree" id="cb3">
					<label for="cb3"></label> 동의함
				</h6>
			</div>
			<hr>
			<div class="agree-con">
				<h5>[필수]이벤트 정보 수신 및 알람 동의</h5>
				<div class="agree-con-t">
					<h6>
						<span style="line-height: 4em;"> 이벤트</span><br> 할인쿠폰 및 혜택,
						이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS와 이메일로 받아보실 수 있습니다. 단, 주문/거래
						정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다. 선택 약관에 동의하지 않으셔도 회원가입은
						가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.<br> <br>
						※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」 <br>
						<br> 여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 네이버는 이에 대한 승낙을
						통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 네이버
						서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.
						회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은
						계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해 주세요.
					</h6>
				</div>
				<h6>
					이메일 수신에 동의하십니까? <input type="checkbox" name="agree" id="cb4">
					<label for="cb4"></label> 동의함
				</h6>
				SNS 수신에 동의 하십니까? <input type="checkbox" name="agree" id="cb5">
				<label for="cb5"></label> 동의함
			</div>
		</div>
	</div>
	<div class="sign-div">
		<div class="sign-button">
			<a class="d-button" id="signupBtn">회원가입</a> <a class="d-button"
				id="cancelBtn">가입취소</a>
		</div>
	</div>
</body>
</html>