<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<title>여행떠나조</title>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<%-- 	${message} --%>
	<div class="container">
		<div class="content">
			<div class="pg-opt" style="margin-top: 5%;">
				<div class="row">
					<div style="margin-bottom: 3%;">
						<td align="right"><a href='<c:url value="/board/cat/1"/>'><button
									type="button" class="genric-btn info">항공</button></a> <a
							href='<c:url value="/board/cat/2"/>'><button type="button"
									class="genric-btn info">환불</button></a> <a
							href='<c:url value="/board/cat/3"/>'><button type="button"
									class="genric-btn info">회원</button></a></td>
					</div>
					<table class="table table-hover table-bordered" >
						<thead>
							<tr>
								<td>카테고리명</td>
								<td class="pc"><fmt:message key="WRITER" /></td>
								<td><fmt:message key="SUBJECT" /></td>
								<td class="pc"><fmt:message key="WRITE_DATE" /></td>
								<td class="pc"><fmt:message key="READ_COUNT" /></td>
							</tr>
						</thead>
						<c:forEach var="board" items="${boardList}">
							<td>${board.boardCategoryName}</td>

							<td class="pc">${board.memberId}</td>
							<td><c:url var="viewLink" value="/board/${board.boardId}" />
								<a href='${viewLink}'>${board.title}</a></td>
							<td>${board.createdAt}</td>
							<td class="pc">${board.views}</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table">
						<tr>
							<td align="left"><jk:paging categoryId="${categoryId}"
									totalPageCount="${totalPageCount}" nowPage="${page}" /></td>
							<td align="right"><a
								href='<c:url value="/board/write/${categoryId}"/>'><button
										type="button" class="genric-btn info">
										<fmt:message key="WRITE_NEW_ARTICLE" />
									</button> </a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>