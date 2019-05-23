<%@ page language="java" contentType="text/html; charset=UTF-8" 
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>도시남자</title>
    <%@ include file="include/comm.jsp" %>
    <link rel="icon" type="image/png" href="resources/images/donam_ico.ico"/>
    <script type="text/javascript" src="resources/js/event.js"></script>
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
    	location.href="${path}/board/checking"
    }
    function freeBoard(){
    	location.href="${path}/board/list";
    }
    </script>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/reset.css">
    
  </head>
  <body>
    <header id="header">
      <div class="contents">
        <section>
          <div id="logo">
            <a href="${path}/member/home"><img src="resources/images/dosinamja.png"/></a>
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
    </header>
    <div id="main" style="height:1200px">
      <div id="nav_title">
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
          	<c:when test="${member.user_id == null}">
          		<form class="info" name="loginForm" method="post" autocomplete="off">
		            <div class="menu_login" style="width: 10%;">
		              <img src="resources/images/user_id.png" id="id_img">
		            </div>
		            <div class="menu_login" style="width: 25%;">
		              <input type="text" name="user_id" id="id_txt" maxlength="12" placeholder="아이디" style="width:95%; height:25px;">
		            </div>
		            <div class="menu_login" style="width: 10%;">
		              <img src="resources/images/user_pwd.png" id="pwd_img">
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
		            	<img src="resources/images/level_0.png">
		            </c:if>
		            <c:if test="${member.user_level == 1}">
		            	<img src="resources/images/level_1.png">
		            </c:if>
		            <c:if test="${member.user_level == 2}">
		            	<img src="resources/images/level_2.png">
		            </c:if>
		            <c:if test="${member.user_level == 3}">
		            	<img src="resources/images/level_3.png">
		            </c:if>
		            <c:if test="${member.user_level == 4}">
		            	<img src="resources/images/level_4.png">
		            </c:if>
		            <c:if test="${member.user_level == 5}">
		            	<img src="resources/images/level_5.png">
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
      </div>
      <div class="contents">
      	<img src="resources/images/spon.png" id="spon" />
        <div class="print" style="height:800px; background-color: #000;">
          	<img src="resources/images/portfolio.png"/>
        </div>
      </div>
    </div>
    <footer id="footer">
      <div class="footer_section">
        <div class="copyright">
          <p>Copyright ⓒ 도시남자 All rights reserved.</p>
        </div>
        <div class="copyright">
          <p style="text-align:right">Powered by <span style="color:#e56424">Inside Community Platform</span></p>
        </div>
      </div>
    </footer>
  </body>
</html>
