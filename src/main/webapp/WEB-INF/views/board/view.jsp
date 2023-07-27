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
<style>
body {
   font-family: Arial, sans-serif;
   line-height: 1.6;
}

.container {
/*    max-width: 800px; */
   margin: 0 auto;
   padding: 20px;
   border: 1px solid #ccc;
   border-radius: 5px;
}


.pg-opt {
   margin-bottom: 20px;
}

.question {
   margin-bottom: 20px;
   border-bottom: 1px solid #ccc;
   padding-bottom: 10px;
}

.boardTitle {
    font-size: 22px;
}

.reply {
   display: flex;
    align-items: center;
   margin-bottom: 10px;
   border-bottom: 1px solid #ccc;
   padding-bottom: 10px;
}

.reply p {
   margin: 0;
}

.memId {
   margin: 10px 5% 0 0;
}

.replyContent {
   margin-right: 83% !important;
}

.delete-reply {
   border: none;
    border-radius: 0.25rem;
    padding: 0.375rem 0.75rem;
    cursor: pointer;
    color: #fff;
    background: #17a2b8;
}
button.delete-reply {
    width: 60px;
}
form {
   margin-top: 20px;
}

#deleteForm {
   margin: 0;
}

label {
   display: block;
   font-weight: bold;
}

input[type="text"], textarea {
   width: 100%;
   padding: 5px;
   margin-bottom: 10px;
}

input[type="submit"] {
   background-color: #17a2b8;
   color: #fff;
   border: none;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 14px;
   border-radius: 5px;
   cursor: pointer;
}

input[type="submit"]:hover {
   background-color: #45a049;
}

.updateBtn {
   display: flex;
    justify-content: center;
    margin: 4% 1% 4% 4%;
}

.deleteBtn {
	margin: 4% 4% 4% 0;
}

.boardBtns {
	display: flex;
	justify-content: flex-end;
    width: 88%;
}

.error-message {
   color: red;
}
</style>
<body>
   <jsp:include page="/WEB-INF/views/include/header.jsp" />
   <div class="container">


      <!-- Q&A 형식으로 답변 표시를 위한 부분 -->
      <h3></h3>
      <div class="question">
         <h3>
            <strong class="boardTitle">${board.title}</strong>
         </h3>
         <p>${board.content}</p>
      </div>

      <!-- 답변 표시 -->
      <h4>댓글</h4>
      <c:forEach var="reply" items="${replyList}" varStatus="status">
         <c:if test="${not empty reply}">
            <div class="reply">
                  <strong class="memId">${reply.memberId}</strong>
                  <p class="replyContent">${reply.replyContent}</p>
                  <!-- Add the form for each reply item -->
                  <c:if test="${member.isAdmin == 1}">
                  <form id="deleteForm" action="/board/deletereply" method="post">
                  <input type="hidden" name="replyId" value="${reply.replyId}" />
                  <input type="hidden" readonly="readonly" name="memberId" value="${member.memberId}" />
                  <input type="hidden" name="boardId" value="${board.boardId}" />
                  <button class="delete-reply" type="submit">삭제</button>
                  </c:if>
                    </form>
            </div>
         </c:if>
      </c:forEach>

      <!-- 답변 작성 폼 -->
      <c:if test="${member.isAdmin == 1}">
         <form action="/board/reply" method="post">
            <input type="hidden" id="boardId" name="boardId" value="${board.boardId}" /> <label
               for="writer"><fmt:message key="WRITER" />: </label> <input
               type="text" readonly="readonly" name="memberId" 
               value="${member.memberId}" /> <br /> <label for="content"></label>
            <textarea name="replyContent" rows="3" cols="40"></textarea>
            <br /> <input type="submit" />
         </form>
      </c:if>
      <c:if test="${member.isAdmin != 1}">
      </c:if>
   </div>
   <c:if test="${board.memberId == sessionScope.memberId || member.isAdmin==1}">
   	<div class="boardBtns">
         <a class="updateBtn" href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
                  <input type="hidden" id="memberId" readonly="readonly" name="memberId" value="${member.memberId}" />
                  <input type="hidden" id="boardId" name="boardId" value="${board.boardId}" />
         <a class="deleteBtn"><button type="button" id="deleteBoard" class="btn btn-info"><fmt:message key="DELETE"/></button></a>
   	</div>
   </c:if>
   <br>
   
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#deleteBoard").click(function() {
				$.ajax({
					url : "/board/delete",
					type : "POST",
					data : {
						memberId : $('#memberId').val(),
						boardId : $("#boardId").val()
					},
					success : function(result) {
						alert("삭제되었습니다.");
						location.href = "/board/cat/1";
					},
					error : function(err) {
						console.log(err);
					}
				})
			});
		})
	</script>
</html>