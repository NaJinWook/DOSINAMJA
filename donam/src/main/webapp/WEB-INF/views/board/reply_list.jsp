<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/comm.jsp" %>
<script>
	$(function(){
		$("#reply_delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.rp_deleteForm.submit();
			}
		});
	});
</script>
</head>
<body>
<c:forEach var="row" items="${list}">		
<form name="rp_deleteForm" action="${path}/reply/delete" method="POST">
	<input type="hidden" name="rno" value="${row.rno}">
</form>
<div id="reply_user_nikname">
<c:if test="${row.reply_user_level == 0}">
<img src="../resources/images/level_0.png" id="writer_level">
<span>${row.reply_user} (${row.regTime})</span>
</c:if>
<c:if test="${row.reply_user_level == 1}">
<img src="../resources/images/level_1.png" id="writer_level">
<span>${row.reply_user} (${row.regTime})</span>
</c:if>
<c:if test="${row.reply_user_level == 2}">
<img src="../resources/images/level_2.png" id="writer_level">
<span>${row.reply_user} (${row.regTime})</span>
</c:if>
<c:if test="${row.reply_user_level == 3}">
<img src="../resources/images/level_3.png" id="writer_level">
<span>${row.reply_user} (${row.regTime})</span>
</c:if>
<c:if test="${row.reply_user_level == 4}">
<img src="../resources/images/level_4.png" id="writer_level">
<span>${row.reply_user} (${row.regTime})</span>
</c:if>
<c:if test="${row.reply_user_level == 5}">
<img src="../resources/images/level_5.png" id="writer_level">
<span style="font-weight:bold; color:#ff4500;">${row.reply_user} (${row.regTime})</span>
</c:if>
<c:if test="${member.user_level >= 4}">
	<button type="button" id="reply_delBtn">X</button></div>
</c:if>
<div id="reply_user_content">${row.reply_text}</div>
</c:forEach>
</body>
</html>