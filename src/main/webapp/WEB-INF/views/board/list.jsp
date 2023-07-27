<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp"/>
<title>여행떠나조</title>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div class="container">
	<div class="pg-opt">
	    <div class="row">

	    </div>
    </div>
<%-- 	${message} --%>
	<div class="content">
		<td align="right">
			<a href='<c:url value="/board/cat/1"/>'><button type="button" class="btn btn-info">항공</button></a>
			<a href='<c:url value="/board/cat/2"/>'><button type="button" class="btn btn-info">환불</button></a>
			<a href='<c:url value="/board/cat/3"/>'><button type="button" class="btn btn-info">회원</button></a>
		</td>
	    <table class="table table-hover table-bordered">
		<thead>
		<tr>
			<td>카테고리명</td>
			<td class="pc"><fmt:message key="WRITER"/></td>
			<td><fmt:message key="SUBJECT"/></td>
			<td class="pc"><fmt:message key="WRITE_DATE"/></td>
			<td class="pc"><fmt:message key="READ_COUNT"/></td>
		</tr>
		</thead>
		<c:forEach var="board" items="${boardList}">
			<td>${board.boardCategoryName}</td>
			
			<td class="pc">${board.memberId}</td>
			<td>
			<c:url var="viewLink" value="/board/${board.boardId}/${board.page}"/>
			<a href='${viewLink}'>${board.title}</a>
			</td>
			<td>${board.createdAt}</td>
			<td class="pc">${board.views}</td>
		</tr>
		</c:forEach>
		</table>
		<table class="table">
		<tr>
			<td align="left">
				<jk:paging categoryId="${categoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
			</td>
			<td align="right">
				<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button> </a>
			</td>
		</tr>
		</table>
<%-- 				<form action="<c:url value='/board/search/1'/>" method="get">
			<div class="pull-right" style="margin-bottom: 5px;">
			<div class="col-xs-9">
		        <input type="text" name="keyword" class="form-control">
		        <input type="submit" class="btn btn-warning" value="<fmt:message key="SEARCH"/>">
		    </div>
			</div>
		</form> --%>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>