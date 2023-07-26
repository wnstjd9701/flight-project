<%@ page contentType="text/html; charset=utf-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/board" />
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticCssFile.jsp" />
<title>여행떠나조</title>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="pg-opt">
			<div class="row">
				<div class="col-md-6 pc">
					<h2>
						<fmt:message key="CONTENT" />
					</h2>
				</div>
			</div>
		</div>

		<!-- Q&A 형식으로 답변 표시를 위한 부분 -->
		<h3></h3>
		<div class="question">
			<p>
				<strong>${board.title}</strong> (${board.createdAt})
			</p>
			<p>${board.content}</p>
		</div>

        <!-- 답변 표시 -->
        <h3>댓글</h3>
        <c:forEach var="reply" items="${replyList}" varStatus="status">
            <c:if test="${not empty reply}">
                <div class="reply">
                    <p>
                        <strong>${reply.memberId}</strong>
<%--                         <c:if test="${member.isAdmin == 1}">
                            <!-- 댓글 수정 버튼 -->
                            <a href="/board/reply/${reply.id}/edit">수정</a>
                            <!-- 댓글 삭제 버튼 -->
                            <a href="/board/reply/${reply.id}/delete">삭제</a>
                        </c:if> --%>
                    </p>
                    <p>${reply.replyContent}</p>
                </div>
            </c:if>
        </c:forEach>

        <!-- 답변 작성 폼 -->
        <c:if test="${member.isAdmin == 1}">
            <form action="/board/reply" method="post">
                <input type="hidden" name="boardId" value="${board.boardId}" />
                <label for="writer"><fmt:message key="WRITER" />: </label>
                <input type="text" readonly="readonly" name="memberId"
                    value="${member.memberId}" />
                <br />
                <label for="content"></label>
                <textarea name="replyContent" rows="3" cols="40"></textarea>
                <br />
                <input type="submit" />
            </form>
        </c:if>
        <c:if test="${member.isAdmin != 1}">
            <p>관리자 권한이 필요합니다.</p>
        </c:if>
    </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
