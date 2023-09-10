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

 <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container text-center">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <i class="fas fa-check-circle display-1 text-primary"></i>
                    <h1 class="mb-4">결제가 완료되었습니다!</h1>
                    <p class="mb-4">야가자 서비스를 이용해주셔서 감사합니다.</p>
                    <a class="btn btn-primary rounded-pill py-3 px-5" href="getAllHotel.do">추가 예약하기</a>
                    <a class="btn btn-primary rounded-pill py-3 px-5" href="main.do">메인으로 가기</a>
                </div>
            </div>
        </div>
    </div>
</c:if>  
<%@ include file="bottom.jsp"%>