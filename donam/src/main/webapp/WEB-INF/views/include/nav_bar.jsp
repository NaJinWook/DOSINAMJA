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
<script>
/*************************메뉴바 로그인, 로그아웃************************/
$(function(){
  $("#login_btn").click(function(){
    var id=$.trim($("#id_txt").val());
    var password=$.trim($("#pwd_txt").val());
    if(id==""){
      alert("아이디를 입력하세요.");
      $("#id").focus();
      return;
    }
    if(password==""){
      alert("비밀번호를 입력하세요.");
      $("#password").focus();
      return;
    }
    document.loginForm.action="${path}/member/login_check";
    document.loginForm.submit();
  });
  $("#register_btn").click(function(){
	  location.href="${path}/member/register";
  });
  $("#logout_btn").click(function(){
		location.href="${path}/member/logout";
  });
  $("#info_btn").click(function(){
		location.href="${path}/member/user_info";
  });
});
/*************************미구현 게시판****************************/
function test(){
	location.href="${path}/board/checking";
}
function freeBoard(){
	location.href="${path}/board/list";
}
</script>
</head>
<body>
        <div class="contents" id="menu_bar">
          <div class="menu" id="promotion">
            <div class="com" id="notice" onclick="test()">공지사항</div>
            <div class="com" id="reg_intro" onclick="test()">가입인사</div>
            <div class="com" id="lvup" onclick="test()">등업신청</div>
          </div>
          <div class="menu" id="community">
            <div class="com" id="free_talk" onclick="freeBoard()">프리토크</div>
            <div class="com" id="qna" onclick="test()">Q & A</div>
            <div class="com" id="tip" onclick="test()">꿀팁공유</div>
          </div>
          <c:choose>
          	<c:when test="${member == null}">
          		<form class="info" name="loginForm" method="post">
		            <div class="menu_login" style="width: 10%;">
		              <img src="../resources/images/user_id.png" id="id_img">
		            </div>
		            <div class="menu_login" style="width: 25%;">
		              <input type="text" name="user_id" id="id_txt" maxlength="12" autocomplete="off" placeholder="아이디" style="width:95%; height:25px;">
		            </div>
		            <div class="menu_login" style="width: 10%;">
		              <img src="../resources/images/user_pwd.png" id="pwd_img">
		            </div>
		            <div class="menu_login" style="width: 25%;">
		              <input type="password" name="user_pwd" id="pwd_txt" maxlength="18" placeholder="비밀번호" style="width:95%; height:25px;">
		            </div>
		            <div class="menu_login" style="width: 15%;">
		              <input type="submit" value="로그인" id="login_btn" style="background-color: #dc143c;">
		            </div>
		            <div class="menu_login" style="width: 15%;">
		              <input type="button" value="회원가입" id="register_btn" style="background-color: #3f4248;">
		            </div>
          		</form>
          	</c:when>
            <c:otherwise>
         		<div class="user_info">
		            <div class="login_user" id="login_user_nikname" style="width:45%;">${member.user_nikname} 님</div>
		            <div class="login_user" id="login_user_level" style="width:10%;">
		            <c:if test="${member.user_level == 0}">
		            	<img src="../resources/images/level_0.png">
		            </c:if>
		            <c:if test="${member.user_level == 1}">
		            	<img src="../resources/images/level_1.png">
		            </c:if>
		            <c:if test="${member.user_level == 2}">
		            	<img src="../resources/images/level_2.png">
		            </c:if>
		            <c:if test="${member.user_level == 3}">
		            	<img src="../resources/images/level_3.png">
		            </c:if>
		            <c:if test="${member.user_level == 4}">
		            	<img src="../resources/images/level_4.png">
		            </c:if>
		            <c:if test="${member.user_level == 5}">
		            	<img src="../resources/images/level_5.png">
		            </c:if>
		            </div>
		            <div class="login_user" style="width:45%;">
              			<div class="user_option" style="text-align:right;">
                			<input type="button" value="내 정보" id="info_btn">
              			</div>
              			<div class="user_option">
                			<input type="button" value="로그아웃" id="logout_btn">
             			</div>
            		</div>
          		</div>
            </c:otherwise>
          </c:choose>
        </div>
</body>
</html>