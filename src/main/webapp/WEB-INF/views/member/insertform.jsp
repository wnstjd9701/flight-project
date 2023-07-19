<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<html>
<body>
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2>INSERT_USER_INFO</h2>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb">
                    <li>MEMBER</li>
                    <li class="active"><message key="INSERT_USER_INFO"/></li>
                </ol>
            </div>
        </div>
    </div>
	<div class="content">
	<form action="<c:url value='/member/insert'/>" method="post" id="joinForm" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="memberId">MEMBER_ID</label>
      <div class="col-sm-4">
        <input type="text" name="memberId" id="memberId" value="${member['memberId']}" ${empty member.memberId? "" : "readonly"}class="form-control">
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="password">MEMBER_PW</label>
      <div class="col-sm-4">
        <input type="password" name="password" id="password" value="${member.password}" class="form-control">
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="name">MEMBER_NAME</label>
      <div class="col-sm-4">
        <input type="text" name="name" id="name" value="${member.name}" class="form-control" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="firstName">MEMBER_FIRST_NAME</label>
      <div class="col-sm-4">
        <input type="text" name="firstName" id="firstName" value="${member.firstName}" class="form-control" >
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="lastName">MEMBER_LAST_NAME</label>
      <div class="col-sm-4">
        <input type="text" name="lastName" id="lastName" value="${member.lastName}" class="form-control" required>
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="phoneNumber">MEMBER_PHONE_NUMBER</label>
      <div class="col-sm-6">
        <input type="text" name="phoneNumber" id="phoneNumber" value="${member.phoneNumber}" class="form-control" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="birthday">MEMBER_BIRTHDAY</label>
      <div class="col-sm-6">
        <input type="date" name="birthday" id="birthday" value="${member.birthday}" class="form-control" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="address">MEMBER_ADDRESS</label>
      <div class="col-sm-6">
        <input type="text" name="address" id="address" value="${member.address}" class="form-control" required>
      </div>
    </div>
	<div class="form-group">
      <label class="control-label col-sm-2" for="email">MEMBER_EMAIL</label>
      <div class="col-sm-8">
        <input type="email" name="email" id="email" value="${member.email}" class="form-control" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="gender">MEMBER_GENDER</label>
      <div class="col-sm-8">
        <input type="text" name="gender" id="gender" value="${member.gender}" class="form-control" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="passportNumber">MEMBER_PASSPORT_NUMBER</label>
      <div class="col-sm-8">
        <input type="text" name="passportNumber" id="passportNumber" value="${member.passportNumber}" class="form-control" required>
      </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="passportExpiryDate">MEMBER_PASSPORT_EXPIRY_DATE</label>
      <div class="col-sm-6">
        <input type="date" name="passportExpiryDate" id="passportExpiryDate" value="${member.passportExpiryDate}" class="form-control" required>
      </div>
    </div>
    
    <div class="form-group">
    	<div class="col-sm-offset-2 col-sm-8">
		<input type="submit" class="btn btn-info" value="SAVE">
		<input type="reset" class="btn btn-info" value="CANCEL">
		</div>
	</div>
	</form>
	</div>
</div>
</body>
<script type="text/javascript">
</script>
</html>