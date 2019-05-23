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
        <c:if test="${message == 'error'}">
          	<script>alert("아이디 또는 비밀번호를 다시 확인하세요.");</script>
        </c:if>
          <div class="view_section">
            <div class="view_section2">
              <div class="view_section3">
                <div class="main_title">
                  <img src="../resources/images/notice.png" id="title_img"><span id="title_name">공지사항</span>
                </div>
                <div class="main_content">
                  <div class="view_content" id="view_title">게시물이 없습니다.</div>
                </div>
              </div>
            </div>
            <div class="view_section2">
              <div class="view_section3">
                <div class="main_title">
                  <img src="../resources/images/talk.png" id="title_img">
                  <span id="title_name">프리토크</span>
                </div>
                <c:forEach var="list" items="${list}">
                <div class="main_content">
                  <div class="view_content" id="view_title"><a href="${path}/board/read?bno=${list.bno}&curPage=1&search_option=all&keyword=">${list.title}</a>
                  <c:if test="${list.replyCnt > 0}">
                  	<span style="color:#ff4500; font-weight:bold;">&nbsp;+${list.replyCnt}</span>
                  </c:if>
                  </div>
                  <div class="view_content" id="view_regDate">
                  <c:if test="${list.writer_level == 0}">
	                  <img src="../resources/images/level_0.png" class="writer_level">
	                  ${list.writer}
	                  <span>${list.regDate}</span>
	              </c:if>
	              <c:if test="${list.writer_level == 1}">
	                  <img src="../resources/images/level_1.png" class="writer_level">
	                  ${list.writer}
	                  <span>${list.regDate}</span>
	              </c:if>
	              <c:if test="${list.writer_level == 2}">
	                  <img src="../resources/images/level_2.png" class="writer_level">
	                  ${list.writer}
	                  <span>${list.regDate}</span>
	              </c:if>
	              <c:if test="${list.writer_level == 3}">
	                  <img src="../resources/images/level_3.png" class="writer_level">
	                  ${list.writer}
	                  <span>${list.regDate}</span>
	              </c:if>
	              <c:if test="${list.writer_level == 4}">
	                  <img src="../resources/images/level_4.png" class="writer_level">
	                  ${list.writer}
	                  <span>${list.regDate}</span>
	              </c:if>
	              <c:if test="${list.writer_level == 5}">
	                  <img src="../resources/images/level_5.png" class="writer_level">
	                  ${list.writer}
	                  <span>${list.regDate}</span>
	              </c:if>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="view_section">
            <div class="view_section2">
              <div class="view_section3">
                <div class="main_title">
                  <img src="../resources/images/best.png" id="title_img"><span id="title_name">BEST</span>
                </div>
                <c:forEach var="best" items="${best_list}">
                <div class="main_content">
                  <div class="view_content" id="view_title"><a href="${path}/board/read?bno=${best.bno}&curPage=1&search_option=all&keyword=">${best.title}</a>
                  <c:if test="${best.replyCnt > 0}">
                  	<span style="color:#ff4500; font-weight:bold;">&nbsp;+${best.replyCnt}</span>
                  </c:if>
                  </div>
                  <div class="view_content" id="view_regDate">
                  	<c:if test="${best.writer_level == 0}">
	                  <img src="../resources/images/level_0.png" class="writer_level">
	                  ${best.writer}
	                  <span>${best.regDate}</span>
	              </c:if>
	              <c:if test="${best.writer_level == 1}">
	                  <img src="../resources/images/level_1.png" class="writer_level">
	                  ${best.writer}
	                  <span>${best.regDate}</span>
	              </c:if>
	              <c:if test="${best.writer_level == 2}">
	                  <img src="../resources/images/level_2.png" class="writer_level">
	                  ${best.writer}
	                  <span>${best.regDate}</span>
	              </c:if>
	              <c:if test="${best.writer_level == 3}">
	                  <img src="../resources/images/level_3.png" class="writer_level">
	                  ${best.writer}
	                  <span>${best.regDate}</span>
	              </c:if>
	              <c:if test="${best.writer_level == 4}">
	                  <img src="../resources/images/level_4.png" class="writer_level">
	                  ${best.writer}
	                  <span>${best.regDate}</span>
	              </c:if>
	              <c:if test="${best.writer_level == 5}">
	                  <img src="../resources/images/level_5.png" class="writer_level">
	                  ${best.writer}
	                  <span>${best.regDate}</span>
	              </c:if>
                  </div>
                </div>
                </c:forEach>
              </div>
            </div>
            <div class="view_section2">
              <div class="view_section3">

              </div>
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
