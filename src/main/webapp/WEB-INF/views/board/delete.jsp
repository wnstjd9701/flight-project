<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html> 
<html>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp"/>
<title>여행떠나조</title>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div class="container">
	<div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2><fmt:message key="DELETE_ARTICLE"/></h2>
            </div>
            <div class="col-md-6">
                <ol class="breadcrumb">
                    <li><fmt:message key="BOARD"/></li>
                    <li class="active"><fmt:message key="DELETE_ARTICLE"/></li>
                </ol>
            </div>
        </div>
    </div>
	<div class="content">
		<form action='<c:url value="/board/delete"/>' class="form-inline" method="post">
		<input type="hidden" name="boardId" value="${boardId}">
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>