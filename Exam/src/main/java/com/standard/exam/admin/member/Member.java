package com.standard.exam.admin.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member")
public class Member {
	
	@Autowired
	MemberDAO dao;
	
	@RequestMapping(method={RequestMethod.GET}, value="/admin/member_step2.action")
	public String member_step2() {
		
		return "admin/member/member_step2";
	}
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/admin/member_step3.action")
	public String member_step3() {
	
		return "admin/member/member_step3";
	} 
	
	@RequestMapping(method={RequestMethod.POST}, value="/member/id_check.action")
	public String id_check(HttpServletRequest req){
		
		String userID = req.getParameter("userID");
		
		boolean id_check = dao.id_check(userID);
		
		JSONObject obj = new JSONObject();
		obj.put("id_check", id_check);
		
		System.out.println("id_check: "+obj.toJSONString());
		
		req.setAttribute("id_check", obj);
		
		return "admin/member/id_check";
	}


	
	@RequestMapping(method={RequestMethod.POST}, value="/admin/member_step3ok.action")
	public String member_step3ok(MemberDTO dto, HttpServletRequest req, HttpSession session ) {
		
		dto.setName(req.getParameter("name"));
		dto.setUserID(req.getParameter("userID"));
		dto.setUserPW(req.getParameter("userPW"));
		dto.setGender(req.getParameter("gender"));
		dto.setTel1(req.getParameter("tel1"));	
		dto.setTel2(req.getParameter("tel2"));
		dto.setTel3(req.getParameter("tel3"));
		dto.setBirth(req.getParameter("birth"));
		dto.setAddress(req.getParameter("address"));
		dto.setEmail(req.getParameter("email"));
		dto.setUserProduce(req.getParameter("userProduce"));
		dto.setSmsCheck(req.getParameter("smsCheck"));
		dto.setEmailCheck(req.getParameter("emailCheck"));
		dto.setMessageCheck(req.getParameter("messageCheck"));
		dto.setMemberState(req.getParameter("memberState"));
		dto.setMemberStateDIV(req.getParameter("memberStateDIV"));
		
	
		if (req.getParameter("smsCheck") == null ) {
			dto.setSmsCheck("n");
		} else if(req.getParameter("smsCheck") != null && req.getParameter("smsCheck").equals("on")){
			dto.setSmsCheck("s");
		}
		
		if (req.getParameter("emailCheck") == null ) {
			dto.setEmailCheck("n");
		} else if(req.getParameter("emailCheck") != null && req.getParameter("emailCheck").equals("on")){
			dto.setEmailCheck("s");
		}		
		
		if (req.getParameter("messageCheck") == null ) {
			dto.setMessageCheck("n");
		} else if(req.getParameter("messageCheck") != null && req.getParameter("messageCheck").equals("on")){
			dto.setMessageCheck("m");
		}
		
	
		System.out.println("name:"+dto.getName());
		System.out.println("UserID:"+dto.getUserID());
		System.out.println("UserPW:"+dto.getUserPW());
		System.out.println("Gender:"+dto.getGender());
		System.out.println("Tel1:"+dto.getTel1());
		System.out.println("Tel2:"+dto.getTel2());
		System.out.println("Tel3:"+dto.getTel3());
		System.out.println("Birth:"+dto.getBirth());
		System.out.println("Email:"+dto.getEmail());
		System.out.println("UserProduce:"+dto.getUserProduce());
		System.out.println("SmsCheck:"+dto.getSmsCheck());
		System.out.println("EmailCheck:"+dto.getEmailCheck());
		System.out.println("MessageCheck:"+dto.getMessageCheck());
		
		
	
		
		// 수신여부추가
		dao.receptionadd(dto);
		String reception = dao.addsel();
		dto.setReception(reception);
		
		System.out.println("re1: " +dto.getReception());		
		

		// 멤버 추가
		dao.add(dto);
				
		
		
		// 유료회원관리 추가
		// 멤버 seq 받아서 멤버십참조키로 입력
		String memberseq = dao.memberseq();
		// 멤버십 널처리
		if (req.getParameter("memberShip") == null) {
			dto.setMemberShip("n");
		} else if(req.getParameter("memberShip") != null && req.getParameter("memberShip").equals("")){
			dto.setMemberShip("y");
		}
	
		
		
		dao.membershipadd(memberseq);
		System.out.println("멤버십"+req.getParameter("memberseq"));
			
		return "admin/member/member_step3ok";
		
	}
	
}

	

