<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hi 
</h1>

<P>  The time on the server </P>
<c:if test="${not empty sessionScope.memberId}">
<p> MemberId: ${memberId} </p>
<p> Password: ${password} </p>
<form action="<c:url value="/member/logout"/>">
	<input type="submit" value="logout">
</form>
</c:if>
</body>
</html>
