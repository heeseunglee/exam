package com.standard.exam.admin.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("regularmember")
public class RegularMember {
	
	@Autowired
	RegularMemberDAO dao;
	
	  @RequestMapping(method = { RequestMethod.GET }, value = "/admin/addrm.action")
	   public String add(HttpServletRequest req,RegularMemberDTO dto, HttpSession session) {
		    String Seq = req.getParameter("seq");
			String ServicePrice= req.getParameter("serviceprice");
			String ServiceDate = req.getParameter("servicedate");
			String userSeq = (String)session.getAttribute("userSeq");
			String memberState = (String)session.getAttribute("memberState");
					
			if ( userSeq == null ) {
				return "auth/backToAdminHome";
			} else if ( !memberState.equals("4") ){
				return "auth/backToAdminHome";
			}
		
		//게시물 불러오기
		/*dto.setSeq(Seq);
		dto.setServicedate(ServiceDate);
		dto.setServiceprice(ServicePrice);*/
		
		//System.out.println("seq : "+Seq);
		//List<RegularMemberDTO> getms = dao.list(Seq);  //null;
		
		//dto= dao.get(Seq);

		req.setAttribute("dto",dto);
		
        System.out.println("전부다" + ServicePrice + ServiceDate + Seq);
		return "admin/member/addrm";
	}
	
	
	// 게시물 삽입 페이지
		@RequestMapping(method = { RequestMethod.POST }, value = "/admin/addokrm.action")
		public String addok(HttpServletRequest req, RegularMemberDTO dto, HttpSession session) {
			// 사용자 입력 데이터 초기화
			String Seq =req.getParameter("seq");
			String ServiceDate = req.getParameter("servicedate");
			String ServicePrice = req.getParameter("serviceprice");
			String userSeq = (String)session.getAttribute("userSeq");
			String memberState = (String)session.getAttribute("memberState");
					
			if ( userSeq == null ) {
				return "auth/backToAdminHome";
			} else if ( !memberState.equals("4") ){
				return "auth/backToAdminHome";
			}
			/*System.out.println("seq" + Seq);
			System.out.println("servicedate" + ServiceDate);
			System.out.println("serviceprice" + ServicePrice);*/
			
			dto.setSeq(Seq);
			dto.setServicedate(ServiceDate);
			dto.setServiceprice(ServicePrice);
			

			dao.add(dto);
			//System.out.println("dto =" + dto);
			return "admin/member/addokrm";
		}
		

	  
		// 글삭제
		@RequestMapping(method = { RequestMethod.GET }, value = "/admin/delokrm.action")
		public String delok(HttpServletRequest req, HttpSession session) {

			// 데이터 가져오기
			String seq = req.getParameter("seq");
			String userSeq = (String)session.getAttribute("userSeq");
			String memberState = (String)session.getAttribute("memberState");
					
			if ( userSeq == null ) {
				return "auth/backToAdminHome";
			} else if ( !memberState.equals("4") ){
				return "auth/backToAdminHome";
			}
			
			dao.del(seq);

			return "admin/member/delokrm";
		}

}