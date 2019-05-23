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
    <link rel="stylesheet" type="text/css" href="../resources/css/board.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
    <script>
   	$(function() {
   		$("#write").click(function(){
   			location.href="${path}/board/write";
   		});
   	});
   	function list(page){
   		location.href="${path}/board/list?curPage="+page+"&search_option=${map.search_option}"+"&keyword=${map.keyword}";
   	}
    </script>
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
        <div class="print" style="height:700px;">
		  <div style="height:7%;">
            <p class="freeBoard">프리토크</p>
            <span style="font-size:13px; padding-left:20px;">${map.count}개의 게시물이 있습니다.</span>
          </div>
          <div style="height:67%;">
              <table class="table">
                <thead class="thead">
    	            <tr>
                		<th class="bbs_title" scope="col" width="10%">번호</th>
                		<th class="bbs_title" scope="col" width="45%">제목</th>
                		<th class="bbs_title" scope="col" width="20%">작성자</th>
                		<th class="bbs_title" scope="col"width="15%">등록일</th>
                		<th class="bbs_title" scope="col" width="10%">조회</th>
                 	</tr>
                </thead>
                <c:forEach var="row" items="${map.list}">
                <tbody class="tbody">
                	<tr>
                		<td class="bbs_content">${row.bno}</td>
                		<td class="bbs_content">
                			<a href="${path}/board/read?bno=${row.bno}&curPage=${map.pager.curPage}&search_option=${map.search_option}&keyword=${map.keyword}">${row.title}</a>
                			<!-- 댓글의 갯수 -->
                			<c:if test="${row.replyCnt > 0}">
                				<span style="color:#ff4500; font-weight:bold;">&nbsp;+${row.replyCnt}</span>
                			</c:if>
                		</td>
                		<td class="bbs_content">
	                		<c:if test="${row.writer_level == 0}">
	                			<img src="../resources/images/level_0.png" class="writer_level">
	                			<span>${row.writer}</span>
	                		</c:if>
	                		<c:if test="${row.writer_level == 1}">
	                			<img src="../resources/images/level_1.png" class="writer_level">
	                			<span>${row.writer}</span>
	                		</c:if>
	                		<c:if test="${row.writer_level == 2}">
	                			<img src="../resources/images/level_2.png" class="writer_level">
	                			<span>${row.writer}</span>
	                		</c:if>
	                		<c:if test="${row.writer_level == 3}">
	                			<img src="../resources/images/level_3.png" class="writer_level">
	                			<span>${row.writer}</span>
	                		</c:if>
	                		<c:if test="${row.writer_level == 4}">
	                			<img src="../resources/images/level_4.png" class="writer_level">
	                			<span>${row.writer}</span>
	                		</c:if>
	                		<c:if test="${row.writer_level == 5}">
	                			<img src="../resources/images/level_5.png" class="writer_level">
	                			<span style="font-weight:bold; color:#ff4500;">${row.writer}</span>
	                		</c:if>
                		</td>
                		<td class="bbs_content">${row.regDate}</td>
                		<td class="bbs_content">${row.viewCnt}</td>
                	</tr>
                </tbody>
                </c:forEach>
              </table>
          </div>
          <div style="height:7%;">
            <input type="button" id="write" value="글쓰기" />
          </div>
          <form name="searchForm" action="${path}/board/list">
          	<div style="width:100%; height:10%;">
	          <div class="search_section" style="width: 40%;">
	            <select id="sbox" name="search_option">	            
	              <option value="all" 
	              <c:if test="${map.search_option == 'all'}">selected</c:if>>제목+내용</option>
	              <option value="title"
	              <c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
	              <option value="content"
	              <c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
	              <option value="writer"
	              <c:if test="${map.search_option == 'writer'}">selected</c:if>>작성자</option>
	            </select>
	          </div>
	          <div class="search_section" style="width: 60%;">
	            <input type="text" id="search_keyword"  name="keyword" value="${map.keyword}" placeholder="검색어" />
	            <input type="submit" id="search_btn" value="검색"/>
	          </div>
	        </div>
          </form>
          <div class="paging">
          <c:if test="${map.pager.curBlock > 1}">
          	<button type="button" class="pg_btn"><a href="javascript:list('1')"><<</a></button>
          </c:if>
          <c:if test="${map.pager.curBlock > 1}">
          	<button type="button" class="pg_btn"><a href="javascript:list('${map.pager.prevPage}')"><</a></button>
          </c:if>
          <c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
          	<c:choose>
          		<c:when test="${num == map.pager.curPage}">
          			<button type="button" class="pg_btn" style="background-color:#444;"><span style="color:#fff;">${num}</span></button>
          		</c:when>
          		<c:otherwise>
          			<button type="button" class="pg_btn"><a href="javascript:list('${num}')">${num}</a></button>
          		</c:otherwise>
          	</c:choose>
          </c:forEach>
          <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
          	<button type="button" class="pg_btn"><a href="javascript:list('${map.pager.nextPage}')">></a></button>
          </c:if>
          <c:if test="${map.pager.curPage <= map.pager.totPage}">
          	<button type="button" class="pg_btn"><a href="javascript:list('${map.pager.totPage}')">>></a></button>
          </c:if>
          </div>
        </div>
      </div>
    </div>
    <footer id="footer">
      <%@include file="../include/footer.jsp" %>
    </footer>
  </body>
</html>
