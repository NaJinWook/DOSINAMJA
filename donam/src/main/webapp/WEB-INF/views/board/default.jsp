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
    <link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
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
          <div class="checking">
            <img src="../resources/images/checking.png">
          </div>
        </div>
      </div>
    </div>
    <footer id="footer">
      <%@include file="../include/footer.jsp" %>
    </footer>
  </body>
</html>
