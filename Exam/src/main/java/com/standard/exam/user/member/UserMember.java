package com.standard.exam.user.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("usermember")
public class UserMember {

	@Autowired
	UserMemberDAO dao;
	
	
	//회원 정보 뷰
	@RequestMapping(method = { RequestMethod.GET }, value = { "/mypage/myinfo.action" })
	public String myInfo(HttpServletRequest req, UserMemberDTO dto, HttpSession session) {

		
		// 데이터 가져오기
		/*String seq = req.getParameter("seq");*/
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		
		String userSeq = (String)session.getAttribute("userSeq");	// 접속한 유저 세션 받기

		// 글내용 가져오기		
		dto = dao.get(userSeq);
				
		// 데이터 보내기
		req.setAttribute("dto", dto);

		return "user/member/user_view";

	}
	
	
	
	// 회원리스트 수정
	@RequestMapping(method = { RequestMethod.GET }, value = { "/mypage/edit.action" })
	public String user_edit(HttpServletRequest req, UserMemberDTO dto, HttpSession session) {

		
		// 데이터 가져오기
		/*String seq = req.getParameter("seq");*/
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		
		String userSeq = (String)session.getAttribute("userSeq");	// 접속한 유저 세션 받기

		// 글내용 가져오기		
		dto = dao.get(userSeq);
				
		// 데이터 보내기
		req.setAttribute("dto", dto);

		return "user/member/user_edit";

	}

	// 수정하기
	@RequestMapping(method = { RequestMethod.POST }, value = "/user/user_editok.action")
	public String member_editok(HttpServletRequest req, UserMemberDTO dto, HttpSession session) {
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 

		if ( req.getParameter("userPW") == null) {
			return "user/member/user_password_error";
		}
		
		// 데이터 입력
		dto.setName(req.getParameter("name"));
		dto.setUserID(req.getParameter("userID"));
		dto.setSeq(req.getParameter("seq"));
		dto.setUserPW(req.getParameter("userPW"));
		dto.setGender(req.getParameter("gender"));
		dto.setTel1(req.getParameter("tel1"));
		dto.setTel2(req.getParameter("tel2"));
		dto.setTel3(req.getParameter("tel3"));
		dto.setBirth(req.getParameter("birth"));
		dto.setUserImage("1");
		dto.setAddress(req.getParameter("address"));
		dto.setEmail(req.getParameter("email"));
		dto.setUserProduce(req.getParameter("userProduce"));
		dto.setMemberStateDIV(req.getParameter("memberStateDIV"));
		dto.setMemberShip(req.getParameter("memberShip"));
		dto.setMemberPeriodStart(req.getParameter("memberPeriodStart"));
		dto.setMemberPeriodEnd(req.getParameter("memberPeriodEnd"));
		dto.setMileagePoint(req.getParameter("mileagePoint"));
		dto.setSmsCheck(req.getParameter("smsCheck"));
		dto.setEmailCheck(req.getParameter("emailCheck"));
		dto.setMessageCheck(req.getParameter("messageCheck"));
		dto.setMember("1");
		
/*		System.out.println("name: "+dto.getName());
		System.out.println("UserID: "+dto.getUserID());
		System.out.println("UserPW: "+dto.getUserPW());
		System.out.println("Gender: "+dto.getGender());
		System.out.println("Tel1: "+dto.getTel1());
		System.out.println("Tel2: "+dto.getTel2());
		System.out.println("Tel3: "+dto.getTel3());
		System.out.println("Birth: "+dto.getBirth());
		System.out.println("Email: "+dto.getEmail());
		System.out.println("address: "+dto.getAddress());
		System.out.println("UserProduce : "+dto.getUserProduce());
		System.out.println("seq :" + dto.getSeq());
		System.out.println("이미지: "+dto.getUserImage());
		System.out.println("마일리지":  + dto.getMileagePoint());
		System.out.println("멤버십: "+dto.getMemberShip()); */
		System.out.println("smsCheck: " + dto.getSmsCheck());
		System.out.println("emailCheck: " +dto.getEmailCheck());
		System.out.println("messageCheck: "+dto.getMessageCheck());
		

		String seq = dto.getSeq();
		System.out.println("seq:"+seq);
		System.out.println("메소드1");
		dao.memberedit(dto);
		
		System.out.println("메소드2");

		//reception null예외처리
		if (req.getParameter("smsCheck") == null ) {
			dto.setSmsCheck("n");
		} else if(req.getParameter("smsCheck") != null && req.getParameter("smsCheck").equals("on")){
			dto.setSmsCheck("s");
		}
		if (req.getParameter("emailCheck") == null) {
			dto.setEmailCheck("n");
		} else if(req.getParameter("emailCheck") != null && req.getParameter("emailCheck").equals("on")){
			dto.setEmailCheck("e");
		}
		if (req.getParameter("messageCheck") == null ) {
			dto.setMessageCheck("n");
		} else if(req.getParameter("messageCheck") != null && req.getParameter("messageCheck").equals("on")){
			dto.setMessageCheck("m");
		}
		
		dao.receptionedit(dto);
		
		System.out.println("메소드탈출");
		//유료회원 null예외처리
		if (req.getParameter("memberPeriodStart") != null
				&& !req.getParameter("memberPeriodStart").equals("")
				&& req.getParameter("memberPeriodEnd") != null
				&& !req.getParameter("memberPeriodEnd").equals("")) {
			
			System.out.println("진입");
			dao.membershipedit(dto);
						
		} else if (req.getParameter("memberPeriodStart") == null
				&& req.getParameter("memberPeriodEnd") == null) {
			System.out.println("else 진입");
			dto.setMemberPeriodStart("default");
			dto.setMemberPeriodEnd("default");
			dao.membershipedit(dto);
		}
		
		System.out.println("멤버십:" + dto.getMemberShip());
		System.out.println("멤버시작기간:" + dto.getMemberPeriodStart());
		System.out.println("멤버기한:" + dto.getMemberPeriodEnd());		
		
		req.setAttribute("seq", seq);
		
		return "user/member/user_editok";
	}
	
	
	//탈퇴 여부 확인 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/mypage/unregister.action")
	public String unregister(HttpServletRequest req, UserMemberDTO dto, HttpSession session) {
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 

		return "user/member/unregister";
	}	
	
	
	// 탈퇴하기
	@RequestMapping(method = { RequestMethod.GET }, value = "/user/user_del.action")
	public String user_del(HttpServletRequest req, UserMemberDTO dto, HttpSession session) {
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 

		String userSeq = (String)session.getAttribute("userSeq");
		System.out.println(userSeq);
		
		dao.userdel(userSeq);
		
		return "user/member/user_del";
	}	
		
}
