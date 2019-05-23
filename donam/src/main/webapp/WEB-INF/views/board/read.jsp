<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>도시남자</title>
    <%@ include file="../include/comm.jsp" %>
    <script type="text/javascript" src="../resources/js/event.js"></script>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/board.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
	<script>
	$(function() {
		listReply();
		$("#reply_btn").click(function(){
			reply();
		});
		$("#list_btn").click(function(){
			location.href="${path}/board/list";
		});
		$("#modify_btn").click(function(){
			document.bd_modifyForm.submit();
		});
		$("#delete_btn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.bd_deleteForm.submit();
			}
		});
	});
	function reply(){
		var reply_text=$("#reply_text").val();
		var bno="${dto.bno}";
		var user_nikname="${member.user_nikname}";
		var param={"reply_text":reply_text, "bno":bno, "user_nikname":user_nikname};
		$.ajax({
			type: "post",
			url: "${path}/reply/insert",
			data: param,
			success: function(){
				$("#reply_text").val("");
				listReply();
			}
		});
	}
	function listReply(){
		$.ajax({
			type: "post",
			url: "${path}/reply/list?bno=${dto.bno}",
			success: function(result){
				$("#reply_print").html(result);
			}
		});
	}	
	</script>
  </head>
  <body>
    <header id="header">
      <%@include file="../include/header.jsp" %>
    </header>
    <div id="main" style="min-height:1200px">
      <div id="nav_title">
		<%@include file="../include/nav_bar.jsp" %>
      </div>
      <div class="contents">
         <div class="print" style="min-height:600px;">
           <div id="read_title">${dto.title}</div>
           <div id="read_writer">
           <c:if test="${dto.writer_level == 0}">
          	 <img src="../resources/images/level_0.png" class="writer_level">
          	 <span>${dto.writer}</span>
           </c:if>
           <c:if test="${dto.writer_level == 1}">
          	 <img src="../resources/images/level_1.png" class="writer_level">
          	 <span>${dto.writer}</span>
           </c:if>
           <c:if test="${dto.writer_level == 2}">
          	 <img src="../resources/images/level_2.png" class="writer_level">
          	 <span>${dto.writer}</span>
           </c:if>
           <c:if test="${dto.writer_level == 3}">
          	 <img src="../resources/images/level_3.png" class="writer_level">
          	 <span>${dto.writer}</span>
           </c:if>
           <c:if test="${dto.writer_level == 4}">
          	 <img src="../resources/images/level_4.png" class="writer_level">
          	 <span>${dto.writer}</span>
           </c:if>
           <c:if test="${dto.writer_level == 5}">
          	 <img src="../resources/images/level_5.png" class="writer_level">
          	 <span style="font-weight:bold; color:#ff4500;">${dto.writer}</span>
           </c:if>
           </div>
           <div id="read_info">
             <p>등록일 <span>${dto.regTime}</span></p>
             <p>조회 <span>${dto.viewCnt}</span></p>
             <p>댓글 <span>${dto.replyCnt}</span></p>
           </div>
           <form name="bd_modifyForm" action="${path}/board/edit">
           	 <input type="hidden" name="bno" value="${dto.bno}">
           </form>
           <form name="bd_deleteForm" action="${path}/board/delete" method="POST">
           	 <input type="hidden" name="bno" value="${dto.bno}">
           </form>
	          <c:choose>
	          	<c:when test="${member.user_nikname == dto.writer}">
	          		<div id="edit">
	          			<input type="button" id="list_btn" value="목록" />
	           			<input type="button" id="modify_btn" value="수정" />
	            		<input type="button" id="delete_btn" value="삭제" />
	          		</div>
	          	</c:when>
	          	<c:when test="${member.user_level >= 4}">
	          		<div id="edit">
	          			<input type="button" id="list_btn" value="목록" />
	            		<input type="button" id="delete_btn" value="삭제" />
	          		</div>
	          	</c:when>
	          	<c:otherwise>
	          		<div id="edit">
	          			<input type="button" id="list_btn" value="목록" />
	          		</div>
	          	</c:otherwise>
	          </c:choose>
        	<div id="read_content">${dto.content}</div>
        </div>
        <div id="guide_line">
        	<p style="text-align:right; padding-right:5px;"><span style="color:#ff4500;">${dto.replyCnt}&nbsp;</span>Comments</p>
        </div>
        <div id="reply_print"></div>
        <c:if test="${member.user_nikname != null}">
        <div class="reply">
          <div class="reply_section" style=" width:85%;">
            <textarea id="reply_text" name="name"></textarea>
          </div>
          <div class="reply_section" style=" width:15%;">
            <input type="button" id="reply_btn" value="등록" />
          </div>
        </div>
        </c:if>
      </div>
    </div>
    <footer id="footer">
      <%@include file="../include/footer.jsp" %>
    </footer>
  </body>
</html>
