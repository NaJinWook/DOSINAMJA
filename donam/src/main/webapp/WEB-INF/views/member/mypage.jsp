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
    /*************************메뉴바 마이페이지 수정, 취소************************/
	 $(function(){
      $("#mod_commit").click(function(){
    	  	var pwd=$.trim($("#user_pwd").val());
     	    var pwd_check=$.trim($("#user_pwd_check").val());
     	    if(pwd==""){
     	      alert("비밀번호를 입력하세요.");
     	      $("#pwd").focus();
     	      return;
     	    }else if(pwd_check==""){
     	      alert("비밀번호를 입력하세요.");
     	     $("#pwd").focus();
     	      return;
     	    } else if(pwd != pwd_check || pwd.length < 4) {
     	      alert("회원 정보를 올바르게 입력해주세요.");
     	      return;
     	    }
			document.updateForm.action ="${path}/member/user_update";
			document.updateForm.submit();
			alert("회원 정보가 수정되었습니다.\n다시 로그인해주세요.");
	  });
      $("#mod_cancel").click(function(){
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
      	<img src="../resources/images/banner2.png" id="banner" />
        <div class="print" style="height:400px;">
          <h3>내 정보</h3>
          <form name="updateForm" method="post" autocomplete="off">
	          <div class="edge" style="margin-top:20px;">
	            <div class="edge_left">
	              <label for="user_id">아이디</label>
	            </div>
	            <div class="edge_right">
	              <input type="text" name="user_id" value="${member.user_id}" id="user_id" maxlength="12" class="tb" placeholder="영어 및 숫자만 최대 12자까지" readonly="readonly"/>
	              <div class="check_msg" id="id_check_msg"></div>
	            </div>
	          </div>
	          <div class="edge">
	            <div class="edge_left">
	              <label for="user_nikname">닉네임</label>
	            </div>
	            <div class="edge_right">
	              <input type="text" name="user_nikname" value="${member.user_nikname}" id="user_nikname" class="tb" placeholder="게시물 작성시 표시되는 필명" readonly="readonly"/>
	              <div class="check_msg" id="nikname_check_msg"></div>
	            </div>
	          </div>
	          <div class="edge">
	            <div class="edge_left">
	              <label for="user_pwd">비밀번호</label>
	            </div>
	            <div class="edge_right">
	              <input type="password" name="user_pwd" id="user_pwd" maxlength="18" class="tb" oninput="pwd_check()" placeholder="최소 4자 이상" />
	              <div class="check_msg" id="pwd_check_msg"></div>
	            </div>
	          </div>
	          <div class="edge">
	            <div class="edge_left">
	              <label for="user_pwd_check">비밀번호 확인</label>
	            </div>
	            <div class="edge_right">
	              <input type="password" id="user_pwd_check" maxlength="18" class="tb" oninput="pwd_check()" />
	              <div class="check_msg" id="pwd_recheck_msg"></div>
	            </div>
	          </div>
	          <div class="edge">
	            <div class="reg_btn">
	              <input type="button" id="mod_commit" value="수정 완료" />
	              <input type="button" id="mod_cancel" value="수정 취소" />
	            </div>
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
