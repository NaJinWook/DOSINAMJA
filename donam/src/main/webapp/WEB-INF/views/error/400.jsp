<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<%@ include file="../include/comm.jsp" %>
</head>
  <body style="margin:0;padding:0;background-color:#252525;">
    <div style="height:60vh;width:45%;margin:0 auto;background-color:#252525;color:#fff;">
      <div style="height:30%;">
        <a href="${path}" style="float:right;padding-top:20px;padding-right:5px;font-size:13px;text-decoration:none;color:#fff">도시남자 홈</a>
      </div>
      <div style="height:60%;width:100%;">
        <p style="font-weight:bold;font-size:20px;padding:5px;padding-left:100px;">죄송합니다.<br>요청하신 페이지를 찾을 수 없습니다.<br></p>
        <p style="font-size:16px;padding:5px;padding-left:100px;">방문하시려는 페이지의 주소가 잘못 입력되었거나,<br><br>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br><br>입력하신 주소가 정확한지 다시 한번 확인 해 주시기 바랍니다.<br><br>감사합니다.</p>
      </div>
      <div style="height:10%;font-size:9px;text-align:center;">
        Copyright © <span style="font-weight:bold;">DOSINAMJA</span> Corp. All Rights Reserved.
      </div>
    </div>
  </body>
</html>