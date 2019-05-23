<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="footer_section">
        <div class="copyright">
          <p>Copyright ⓒ 도시남자 All rights reserved.</p>
        </div>
        <div class="copyright">
          <p style="text-align:right">Powered by <span style="color:#e56424">Inside Community Platform</span></p>
        </div>
    </div>
</body>
</html>