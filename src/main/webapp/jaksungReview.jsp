<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ include file="mainStyle.jsp"%>

<c:if test="${empty sessionScope.memberVO}">
   <script type="text/javascript">
      alert("로그인을 먼저 해 주세요!!")
      location.href="login.do"
   </script>
</c:if>
<c:if test="${not empty sessionScope.memberVO}">


<form action="makereview.do">
	<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

	%>
	
	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
		<h3 class="bg-white text-center text-primary px-3">Review</h3>
		<h1 class="mb-5">리뷰를 작성해주세요</h1>
	</div>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<table class="table table-bordered">
				<tr><td><h5 align="center" class="text-primary"><span style="flex-grow: 1;">
				호텔 이름<BR>
				</span><input type="text" name="hotelName" required="required"></h5></td></tr>
					<tr>
						<td><input type="hidden" name="mem_id" value="${ sessionScope.memberVO.mem_id }">
							<h5 align="center" class="text-primary">
								<span style="flex-grow: 1;">리뷰 제목</span><BR> <input type="text"
									name="reviewHead"  required="required">
							</h5></td>
					</tr>
					<tr>
						<td><h5 align="center" class="text-primary">
								<span style="flex-grow: 1;">리뷰를 작성해주세요</span><BR>
								<BR>
								<textarea name="reviewBody" cols="40" rows="10"
									placeholder="여기에 리뷰 쓰기 "  required="required"></textarea>
							</h5></td>
					</tr>
					<tr>
						<td>
							<h5 align="center" class="text-primary">
								<span style="flex-grow: 1;"> 평점 <input type="number"
									name="number" min="0" max="5" step="0.1">
								</span>
							</h5>
						</td>
					</tr>
					<tr>
						<td><h5 align="center" class="text-primary">
								 <input
									type="submit" value="리뷰 쓰기"> <input type="reset"
									value="전부 지우기">
							</h5></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</form>
</c:if>
<%@ include file="bottom.jsp"%>
