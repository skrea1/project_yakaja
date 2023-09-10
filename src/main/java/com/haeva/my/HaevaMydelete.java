package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.MainTelInfoDAO;
import com.yakaja.vo.MemberVO;

public class HaevaMydelete implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
    	request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        MainTelInfoDAO tidao1 = new MainTelInfoDAO();
        String msg = "";
        String url = "";
        System.out.println("delete1");

        String confirmMsg = "정말로 삭제하시겠습니까? (삭제 시 예약정보 및 내역은 일괄 삭제됩니다.)" ;
        request.setAttribute("confirmMsg", confirmMsg);		
        request.setAttribute("url", "myDelete.jsp");
        
        // 사용자의 선택에 따라 다른 동작 수행
        String action = (String) request.getAttribute("action");
        if (action != null && action.equals("confirm")) {
            // 확인 선택 시 삭제 수행
        	
        	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
        	
        	String mem_id = memberVO.getMem_id();
        	String mem_pw = request.getParameter("mem_pw");
        	
            // String mem_id = (String)session.getAttribute("mem_id");
            // String mem_pw = request.getParameter("mem_pw");
            
            try {
                
                System.out.println(mem_id);
                System.out.println(mem_pw);
                
                // 비밀번호 검증 로직 구현 필요
                if (tidao1.isValidPassword(mem_id, mem_pw)) { // 수정된 부분
                    tidao1.delete(mem_id);
                    // session.invalidate();
                    msg = "삭제되었습니다";
                    request.setAttribute("msg", msg);
                    request.setAttribute("url", "logout.do");
                } else {
                    msg = "비밀번호가 올바르지 않습니다";
                    request.setAttribute("msg", msg);
                    request.setAttribute("url", "myDelete.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 기본 동작 (메시지 표시)
            msg = "정말로 삭제하시겠습니까? (삭제 시 예약정보 및 내역은 일괄 삭제됩니다.)";
            request.setAttribute("msg", msg);
        }
    }
}


