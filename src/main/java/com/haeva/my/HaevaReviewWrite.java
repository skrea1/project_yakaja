package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;

public class HaevaReviewWrite implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		 String msg = "";
	     String url = "";
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		MainTelInfoDAO hidao = null;
		hidao = new MainTelInfoDAO();

		// int number=2;
		String reviewhead = request.getParameter("reviewHead");
		String mem_id = request.getParameter("mem_id");
		String reviewbody = request.getParameter("reviewBody");
		double score = Double.parseDouble(request.getParameter("number"));
		String hotelName = request.getParameter("hotelName");

//		System.out.println(reviewhead+" , "+reviewbody);

		boolean alist1 = hidao.writeReview(reviewhead, mem_id, reviewbody, score, hotelName);

		if (alist1 == false) {
			msg = "호텔 등록에 실패했습니다.";
			url = "hotelJoin.jsp";
		} else {
			// 시퀀스를 사용하여 hotel_id를 생성합니다.
			msg = "호텔 등록에 성공하셨습니다.";
			url = "yakajaMain.jsp";
		}
		
		
		request.setAttribute("msg", msg );
		request.setAttribute("url", url);
		
//		String hotelname=hidao.getHotelName(hotelnum);
//
//		//String numberstr=Integer.toString(number);
//		String scorestr=Integer.toString(score);
//		
//		
//		if(alist1) {
//			//request.setAttribute("number",numberstr);
//			request.setAttribute("reviewhead", reviewhead);
//			request.setAttribute("mem_id",mem_id);
//			request.setAttribute("reviewbody", reviewbody);
//			request.setAttribute("score",scorestr);
//			request.setAttribute("hotelname", hotelname);
//		}
	}

}
