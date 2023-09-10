<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- hostList.jsp -->
<!-- 업주 관리 페이지 -->
<%@ include file="top.jsp"%>

<c:if test="${empty sessionScope.memberVO}">
   <script type="text/javascript">
      alert("로그인을 먼저 해 주세요!!")
      location.href="login.do"
   </script>
</c:if>
<c:if test="${not empty sessionScope.memberVO}">

<!-- Contact Start -->
<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">Hotel List</h6>
                <h1 class="mb-5">${sessionScope.memberVO.mem_id}님의 등록 호텔목록</h1>
        </div>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		        <table class="table table-bordered">
		          <tr align="center">
		          	<th>호텔id</th>
		          	<th>호텔명</th>
		          	<th>주소</th>
		          </tr>
		         
		       	  <c:forEach var="hotelVO" items="${hotelList}">
		          <tr align="center">
					<td>
					  <div class="text-primary">
					  	${hotelVO.hotel_id}
					  </div>
					</td>
		            <td style="white-space: nowrap;">${hotelVO.hotel_name}</td>
		            <td style="white-space: nowrap;">${hotelVO.hotel_address}</td>
		          </tr>
		          </c:forEach> 
		          <tr>
		            <td colspan="7" align="center">
		            	<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">
		            </td>
		          </tr>
		        </table>
		    </div>
		  </div>
		</div>
	</div>
</div>
</c:if>
<%@ include file="bottom.jsp"%>