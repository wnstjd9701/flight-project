<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<title>여행떠나조</title>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="pg-opt" style="margin-top: 5%;"	>
			<div class="row">
				<div class="col-md-6 pc">
					<h2>
						<fmt:message key="WRITE_NEW_ARTICLE"/>
					</h2>
				</div>

			</div>
		</div>
		<div class="content" style="margin-top: 3%;">
			<form action="<c:url value='/board/write'/>" method="post" enctype="multipart/form-data" class="form-horizontal">
				<c:if test="${!empty categoryList}">
					<div class="form-group">
						<label class="control-label col-sm-2" for="name"  style="margin:0;">
						<h3><fmt:message key="CATEGORY" /></label></h3>
						<div class="col-sm-4" style="margin:0; padding:0;" >
							<select name="categoryId" id="categoryId"
								class="form-control" required >
								<c:forEach var="category" items="${categoryList}">
									<option value="${category.categoryId}"
										${category.categoryId eq requestScope.categoryId ? "selected" : ""}>${category.boardCategoryName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:if>
				<div class="form-group">

					<div class="col-sm-2">
						<input type="hidden" name="memberId" id="memberId"
							value="${sessionScope.memberId}"
							${!empty sessionScope.memberId ? "readonly" : "" }
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<h4><label class="control-label col-sm-2" for="title"><fmt:message
							key="SUBJECT" /></label></h4>
					<div class="col-sm-8">
						<input type="text" name="title" id="title" class="form-control"
							required>
					</div>
				</div>
				<div class="form-group">
					<h4><label class="control-label col-sm-2" for="content"><fmt:message
							key="CONTENT" /></label></h4>
					<div class="col-sm-8">
						<textarea name="content" rows="10" cols="100" class="form-control"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<input type="hidden" name="boardId" value="${board.boardId}">
						<input type="submit" id="i_submit" class="genric-btn info"
							value="<fmt:message key="SAVE"/>"> <input type="reset"
							class="genric-btn info" value="<fmt:message key="CANCEL"/>">
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>