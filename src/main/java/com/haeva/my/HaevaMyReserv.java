package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.ReservVO;

public class HaevaMyReserv implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		
		MainTelInfoDAO yakajaDAO = new MainTelInfoDAO();
		
		ArrayList<ReservVO> listReserv = yakajaDAO.findReserv(mem_id);
		ArrayList<String> listReserv2 = yakajaDAO.findReservHotelName(mem_id); // 호텔 이름만 가져오는 메소드
		
		request.setAttribute("listReserv", listReserv);
		request.setAttribute("listReserv2", listReserv2);
		
	}
}
