package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;
import com.yakaja.vo.ReservVO;

public class HaevaMyResDelete implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String msg = "";
		String url = "";
		
		try {
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			HttpSession session =  request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		
			
			MainTelInfoDAO tidao1 = new MainTelInfoDAO();
			

			int reserv_id = Integer.parseInt(request.getParameter("reserv_id"));
			System.out.println("reserv_id : " + reserv_id);
			ReservVO reservVO = tidao1.getReservOne(reserv_id);
			
			tidao1 = new MainTelInfoDAO();
			boolean success = tidao1.resvDelete(reserv_id);
			System.out.println("success : " + success);
			
			
			System.out.println(reservVO.getHotel_id());
			System.out.println(reservVO.getRoom_num());
			System.out.println(reservVO.getReserv_in());
			System.out.println(reservVO.getReserv_out());
			
			boolean success2 = tidao1.deleteReserv2(reservVO.getHotel_id(), reservVO.getRoom_num(), 
					reservVO.getReserv_in(), reservVO.getReserv_out());
			
			if (success && success2) {
				msg = "예약취소 성공.";
			} else {
				msg = "예약취소 실패";
			}
			
			url = "myReserv.do?mem_id=" + memberVO.getMem_id();
			
		} catch (Exception e) {
			msg = "예약 ID가 유효하지 않습니다.";
			e.printStackTrace();
			
		}	
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

	}

}