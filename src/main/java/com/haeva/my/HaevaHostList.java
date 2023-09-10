package com.haeva.my;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.HotelVO;
import com.yakaja.vo.ReservVO;

public class HaevaHostList implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mem_id = request.getParameter("mem_id");
		MainTelInfoDAO dao = new MainTelInfoDAO();
		
		ArrayList<HotelVO> hotelList = dao.getHotelList(mem_id);
		request.setAttribute("hotelList", hotelList);
		
		// 해당 업주의 호텔 id가 들어가 있는 예약.
			
		ArrayList<ReservVO> fin_reservList = new ArrayList<ReservVO>();
		
		for(HotelVO hvo : hotelList) {
			
			String hotel_id = hvo.getHotel_id();
			ArrayList<ReservVO> reservList = dao.getReservList(hotel_id);
			
			for(ReservVO rev : reservList) {
				fin_reservList.add(rev);
			}			
		}
		
		request.setAttribute("reservList", fin_reservList);
	}
}
