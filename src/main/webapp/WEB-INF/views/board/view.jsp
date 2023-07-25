<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html> 
<html>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div class="container">
    <div class="pg-opt">
        <div class="row">
            <div class="col-md-6 pc">
                <h2><fmt:message key="CONTENT"/></h2>
            </div>
        </div>
    </div>
<%-- 	<div class="content">
	<table class="table table-bordered">
	<tr>
		<td width="20%"><fmt:message key="BOARD_ID"/></td>
		<td>${board.boardId}</td>
	</tr>
	<tr>
		<td width="20%"><fmt:message key="WRITER"/></td>
		<td>${board.memberId }</td>
	</tr>
	<tr>
		<td width="20%"><fmt:message key="WRITE_DATE"/></td>
		<td><fmt:formatDate value="${board.createdAt}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
		<td><fmt:message key="SUBJECT"/> </td>
		<td>${board.title}</td>
	</tr>
	<tr>
		<td><fmt:message key="CONTENT"/></td>
		<td class="board_content">${board.content}</td>
	</tr>
	</table> --%>

	<!-- Q&A 형식으로 답변 표시를 위한 부분 -->
	<h3><fmt:message key="QNA_SECTION"/></h3>
	<div class="question">
		<p><strong>${board.title}</strong> (${board.createdAt})</p>
		<p>${board.content}</p>
	</div> 

	<!-- 답변 표시 -->
	<c:if test="${not empty answer}">
		<h3><fmt:message key="ANSWER"/></h3>
		<div class="answer">
			<p><strong>${answer.writer}</strong> (${answer.createdAt})</p>
			<p>${answer.content}</p>
		</div>
	</c:if>

	<!-- 답변 작성 폼 -->
	<form action="/board/addAnswer" method="post">
		<input type="hidden" name="questionId" value="${board.boardId}" />
		<label for="writer"><fmt:message key="WRITER"/>: </label>
		<input type="text" name="writer" />
		<br/>
		<label for="content"><fmt:message key="ANSWER"/>: </label>
		<textarea name="content" rows="3" cols="40"></textarea>
		<br/>
		<input type="submit" value="<fmt:message key='ADD_ANSWER'/>" />
	</form>
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
