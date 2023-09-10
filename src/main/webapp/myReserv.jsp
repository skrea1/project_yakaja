<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myReserv.jsp -->
<!-- 나의 예약목록 보기 -->

<%@ include file="top.jsp"%>

<c:if test="${empty sessionScope.memberVO}">
   <script type="text/javascript">
      alert("로그인을 먼저 해 주세요!!")
      location.href="login.do"
   </script>
</c:if>
<c:if test="${not empty sessionScope.memberVO}">

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">MY RESERVATION</h6>
                <h1 class="mb-5">나의 예약목록 보기</h1>
        </div>
        <c:if test="${empty requestScope.listReserv}">
   			<h4 align="center" style="color:blue;">No reservation information found.</h4>
		</c:if>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		    <form action="resvDelete.do" method="post">
		        <table class="table table-bordered">
		          <tr align="center">
		          	<th>선택</th>
		          	<th>예약id</th>
		          	<th>방번호</th>
		          	<th>호텔이름</th>
		          	<th>결제금액</th>
		          	<th>체크인</th>
		          	<th>체크아웃</th>
		          </tr>
		         
		       	  <c:forEach var="reservVO" items="${requestScope.listReserv}" varStatus="status">
		          <tr align="center">
		          	<td style="white-space: nowrap;"><input type="radio" name="reserv_id" value="${reservVO.reserv_id}"></td>
					<td>
					  <div class="text-primary">
					  	${reservVO.reserv_id}
					  </div>
					</td>
		            <td style="white-space: nowrap;">${reservVO.room_num}</td>
		            <td style="white-space: nowrap;">${requestScope.listReserv2[status.index]}</td>
		            <td style="white-space: nowrap;">${reservVO.room_price}</td>
		            <td style="white-space: nowrap;">${reservVO.reserv_in}</td>
		            <td style="white-space: nowrap;">${reservVO.reserv_out}</td>
		          </tr>
		          </c:forEach> 

		          <tr>
		            <td colspan="7" align="center">
		            	<input type="submit" value="선택항목 예약취소" class="btn btn-primary">
		            	<input type="button" value="메인으로" onclick="location.href='main.do'" class="btn btn-primary">
		            </td>
		          </tr>
		        </table>
		    </form>
		    </div>
		  </div>
		</div>
	</div>
</div>
</c:if>
<%@ include file="bottom.jsp"%>