<%@page import="com.yakaja.vo.PagingVO"%>
<%@page import="com.yakaja.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yakaja.dao.MainTelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="top.jsp"%>
<%@ include file="mainStyle.jsp" %>

<!-- writeReview -->
<!-- 게시판 리뷰목록 -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	MainTelInfoDAO tidao = new MainTelInfoDAO();
	PagingVO paging = (PagingVO)request.getAttribute("paging");
	int total = paging.getTotalCount();		
	out.println("전체 검색결과 : " + total);
	ArrayList<ReviewVO> list = (ArrayList<ReviewVO>)request.getAttribute("list");
	
%>

<script>
function PageMove(page){
    location.href = "paging.do?page="+page;
  }
</script>

<!-- reviewTable출력 -->
<table class="reviewTable">
	<thead>
	<tr>
		<th id="nameColumn">호텔</th>
		<th id="titleColumn">제목</th>
		<th id="writerColumn">닉네임</th>
		<th id="contentColumn">내용</th>
		<th id="scoreColumn">평점</th>
	</tr>
	</thead>


	<tbody>
	<% for(ReviewVO imsi : list){ %>
	<tr>	
		<td><img src="img/hotel/<%=Integer.parseInt(imsi.getHotel_id()) % 3 %>.png" width="200px">
		<BR><a href="goHotel.do?hotel_name=<%= imsi.getHotel_name() %>"><%= imsi.getHotel_name() %></a></td>
		<td><%= imsi.getReview_title() %></td>
		<td><%= imsi.getMem_name() %></td>
		<td>
		<%= imsi.getReview_content()%>
		<!-- 눌렀을때 커짐 -->
	
		</td>
		<td>
		<%
			String scoreOne = imsi.getReview_score();
			Double scoreTwo = Double.parseDouble(scoreOne);
			int scoreIpart = (int) Math.floor(scoreTwo);
			Double scoreDpart = scoreTwo-scoreIpart;
			String scoreResult = String.format("%.1f", scoreDpart);
			double scoreDouble = Double.parseDouble(scoreResult) * 10;
			String scoreFinal = "";
			if(scoreDouble >= 5){
				scoreFinal = scoreIpart + ".5";
			}else if(scoreDouble < 5){
				scoreFinal = String.valueOf(scoreIpart);
			}
		%>	
		<img src="img/score/score<%=scoreFinal%>.png">
		<%
			out.print(imsi.getReview_score());
		%>
		
		</td>
		
		
	</tr>
	<%} %>
	</tbody>
</table>

<style>
  .toolbar-bottom {
    display: flex;
    justify-content: center;
  }
</style>

<div class="toolbar-bottom">
  <div class="toolbar mt-lg">
    <div class="sorter">
      <ul class="pagination">
        <li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>&nbsp;&nbsp;
        <li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>&nbsp;&nbsp;
              <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                  <c:choose>
                      <c:when test="${i eq paging.pageNo}">
                		<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>&nbsp;&nbsp;
                      </c:when>
                      <c:otherwise>
                        <li><a href="javascript:PageMove(${i})">${i}</a></li>&nbsp;&nbsp;
                      </c:otherwise>
                  </c:choose>
              </c:forEach>
        <li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>&nbsp;&nbsp;
        <li><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
      </ul>
    </div>
  </div>
</div>

<%@ include file="bottom.jsp"%>