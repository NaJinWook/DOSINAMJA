<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>도시남자</title>
    <%@ include file="../include/comm.jsp" %>
    <script type="text/javascript" src="../resources/js/event.js"></script>
    <script>
    /*************************회원가입 완료 홈 이동버튼 추가*************************/
    $(function(){
      $("#home_btn").click(function(){
        location.href="${path}";
      });
    });
    </script>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/register.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
  </head>
  <body>
    <header id="header">
      <%@include file="../include/header.jsp" %>
    </header>
    <div id="main" style="height:1000px">
      <div id="nav_title">
        <%@include file="../include/nav_bar.jsp" %>
	  </div>
	  <div class="contents">
	    <div class="print" style="height:400px;">
	      <h3 style="color:#252525";>회원가입을 축하드립니다.</h3>
	      <div id="commit_msg">
	        <h1>도시남자에 오신 걸 환영합니다.</h1>
	        <div style="text-align:center;">
	          <input type="button" id="home_btn" value="홈으로" />
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
    <footer id="footer">
      <%@include file="../include/footer.jsp" %>
    </footer>
  </body>
</html>
