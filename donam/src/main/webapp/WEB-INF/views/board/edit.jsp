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
   	<!-- ckeditor 사용을 위해 js 파일 연결 -->
	<script src="../resources/ckeditor/ckeditor.js"></script>
	<script>
	/*************************글쓰기*************************/
	$(function(){
	  $("#update_commit").click(function(){
	    var title = $.trim($("#title").val());
	    if(title == ""){
	      alert("제목을 입력하세요.");
	      $("#title").focus();
	      return;
	    } 
	    document.updateForm.submit();
	  });
	  $("#update_cancel").click(function(){
		 location.href="${path}/board/list"; 
	  });
	});
	</script>
  </head>
  <body>
    <header id="header">
      <%@include file="../include/header.jsp" %>
    </header>
    <div id="main" style="height:1200px">
      <div id="nav_title">
		<%@include file="../include/nav_bar.jsp" %>
      </div>
      <div class="contents">
      	<img src="../resources/images/spon.png" id="spon" />
        <div class="print" style="height:800px;">
          <form name="updateForm" method="post" action="${path}/board/update">
         	 <div id="write_name">글 수정</div>
         	 <div id="write_title">
          		<label for="title">제목<label>
          	 	<input name="title" value="${dto.title}" id="title" size="80" placeholder="제목을 입력하세요." maxlength="35">
         	 </div>
    	  	 <div id="write_content">
    	  		<textarea id="content" name="content" placeholder="내용을 입력하세요.">${dto.content}</textarea>
    	   	 </div>
    	  	 <script>
    	 	 //id가 description인 태그에 ckeditor를 적용시킴
	    	 CKEDITOR.replace("content", {
	    		 height:450
	         });
    		</script>
    	 	<div id="write_btn">
    	  		<input type="button" id="update_commit" value="수정 완료">
            	<input type="button" id="update_cancel" value="취소">
            	<input type="hidden" name="bno" value="${dto.bno}">
    		</div>
		  </form>
        </div>
      </div>
    </div>
    <footer id="footer">
      <%@include file="../include/footer.jsp" %>
    </footer>
  </body>
</html>
