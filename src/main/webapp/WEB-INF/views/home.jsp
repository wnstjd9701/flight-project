<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server </P>
<p> UserId: ${id} </p>
<p> Password: ${password} </p>
<form action="<c:url value="/logout"/>">
	<input type="submit" value="logout">
</form>
</body>
</html>
