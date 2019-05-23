<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>도시남자</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
  </head>
  <body>
     <div class="contents">
       <section>
         <div id="logo">
           <a href="${path}/member/home"><img src="../resources/images/dosinamja.png"/></a>
         </div>
       </section>
       <section>
         <div class="desc_section">
           <div class="description">
           	안내
           </div>
         </div>
         <div class="desc_section">
           <div class="description">
           	커뮤니티
           </div>
         </div>
       </section>
     </div>
  </body>
</html>
