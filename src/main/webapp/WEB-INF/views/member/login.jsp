<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value="/member/login"/>" method="post">
	<input type="text" name="memberId">
	<input type="password" name="password">
	<input type="submit" value="로그인">
	<input type="button" onclick="location.href='/myapp/member/findpwd'" class="btn btn-info" value="비밀번호 찾기">
</form>
</body>
</html>