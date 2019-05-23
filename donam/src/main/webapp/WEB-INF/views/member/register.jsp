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
    /*************************회원 가입****************************/
    $(function(){
   	  $("#reg_commit").click(function(){
   	    var id=$.trim($("#user_id").val());
   	    var nikname=$.trim($("#user_nikname").val());
   	    var pwd=$.trim($("#user_pwd").val());
   	    var pwd_check=$.trim($("#user_pwd_check").val());

   	    if(id==""){
   	      alert("아이디를 입력하세요.");
   	      $("#id").focus();
   	      return;
   	    }else if(nikname==""){
   	      alert("닉네임을 입력하세요.");
   	      $("#nikname").focus();
   	      return;
   	    }else if(pwd==""){
   	      alert("비밀번호를 입력하세요.");
   	      $("#pwd").focus();
   	      return;
   	    }else if(pwd_check==""){
   	      alert("비밀번호를 입력하세요.");
   	      $("#pwd_check").focus();
   	      return;
   	    } else if(pwd != pwd_check || pwd.length < 4) {
   	      alert("회원 정보를 올바르게 입력해주세요.");
   	      return;
   	    }
   	    document.registerForm.action="${path}/member/rgcommit";
   	    document.registerForm.submit();
   	  });
   	  
   	  $("#reg_cancel").click(function(){
   	    location.href="${path}";
   	  });
   	});
    /****************회원가입시 아이디,닉네임 중복확인**********************/
    $(function(){
    	$("#user_id").keyup(function() {
    		var user_id = $.trim($("#user_id").val());
    		var query = {user_id : user_id};
    		$.ajax({
    			type:"post",
    			url:"${path}/member/reg_id_check",
    			data: query,
    			success:function(data){
    				if(data == 1){
    					$("#id_check_msg").html("이미 존재하는 ID입니다.");
    					$("#reg_commit").attr("disabled", "disabled");
    				} else if(user_id == ""){
    					$("#id_check_msg").html("");
    					$("#reg_commit").attr("disabled", "disabled");
    				} else {
    					$("#id_check_msg").html("");
    					$("#reg_commit").removeAttr("disabled");
    				}
    			}
    		});
    	});
    	$("#user_nikname").keyup(function() {
    		var user_nikname = $.trim($("#user_nikname").val());
    		var query = {user_nikname : user_nikname};
    		$.ajax({
    			type:"post",
    			url:"${path}/member/reg_nikname_check",
    			data: query,
    			success:function(data){
    				if(data == 1){
    					$("#nikname_check_msg").html("이미 사용 중인 닉네임입니다.");
    					$("#reg_commit").attr("disabled", "disabled");
    				} else if(user_id == ""){
    					$("#nikname_check_msg").html("");
    					$("#reg_commit").attr("disabled", "disabled");
    				} else {
    					$("#nikname_check_msg").html("");
    					$("#reg_commit").removeAttr("disabled");
    				}
    			}
    		});
    	});
    });
    </script>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/register.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
  </head>
  <body>
  	<c:if test="${param.message == 'nologin'}">
  		<script>alert("로그인 후 이용 가능합니다.");</script>
    </c:if>
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
          <h3>회원가입</h3>
          <form name="registerForm" method="post" autocomplete="off">
	          <div class="edge" style="margin-top:20px;">
	            <div class="edge_left">
	              <label for="user_id">아이디</label>
	            </div>
	            <div class="edge_right">
	              <input type="text" name="user_id" id="user_id" autocomplete="off" maxlength="12" class="tb" placeholder="영어 및 숫자만 최대 12자까지" />
	              <div class="check_msg" id="id_check_msg"></div>
	            </div>
	          </div>
	          <div class="edge">
	            <div class="edge_left">
	              <label for="user_nikname">닉네임</label>
	            </div>
	            <div class="edge_right">
	              <input type="text" name="user_nikname" id="user_nikname" autocomplete="off" maxlength="10" class="tb" placeholder="게시물 작성시 표시되는 필명" />
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
	              <input type="button" id="reg_commit" value="회원가입 완료" disabled="disabled" />
	              <input type="button" id="reg_cancel" value="회원가입 취소" />
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
