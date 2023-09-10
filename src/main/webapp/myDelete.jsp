<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<c:if test="${empty sessionScope.memberVO}">
   <script type="text/javascript">
      alert("로그인을 먼저 해 주세요!!")
      location.href="login.do"
   </script>
</c:if>
<c:if test="${not empty sessionScope.memberVO}">

<style>
	.small-font {
	  font-size: 12px;
	}
</style>

	<br>
	<br>
	<br>
	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
		<h6 class="bg-white text-center text-primary px-3"></h6>
		<h1 class="mb-5">회원 삭제</h1>
	</div>
	<br>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6" align="center">
				<form action="delete.do" method="post">
					<table>
						<tr>
							<td><div class="text-center"><h3 class="text-primary">비밀번호 입력</h3></div></td>
						</tr>
						<tr>
							<td>
								<input type="password" name="mem_pw" placeholder="비밀번호 입력" required>
								<button type="submit" class="btn btn-primary btn-lg small-font">확인</button>
							</td>
						</tr>
					</table>
					<input type="hidden" name="action" value="confirm"> 
					<!-- <input type="hidden" name="mem_id" value="confirm"> -->
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
</c:if>
<%@ include file="bottom.jsp"%>