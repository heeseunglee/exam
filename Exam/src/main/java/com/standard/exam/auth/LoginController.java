package com.standard.exam.auth;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("LoginController")
public class LoginController {

	@Autowired
	private LoginDAO dao;
	
	
	@RequestMapping(method={RequestMethod.POST}, value="/auth/idcheck.action")	
	public String idCheck(HttpServletRequest req) {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		//System.out.println("입력 id : " + id);
		//System.out.println("입력 pw : " + pw);
		
		boolean idCheck = dao.idCheck(id);	// id 존재여부 체크
		
		JSONObject obj = new JSONObject();
		obj.put("idCheck", idCheck);
		
		req.setAttribute("obj", obj);
		
		return "/auth/idcheck";
	}
	
	
	@RequestMapping(method={RequestMethod.POST}, value="/auth/login.action")	
	public String login(HttpServletRequest req) {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String isAdmin = req.getParameter("isAdmin");
		
		if ( isAdmin == null ) {
			isAdmin = "";
		}
		
		//System.out.println("입력 id : " + id);
		//System.out.println("입력 pw : " + pw);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		
		boolean pwCheck = dao.pwCheck(map);
		
		if ( !pwCheck ) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("check", pwCheck);
			req.setAttribute("check", obj);
			return "/auth/pwcheck";
		}
		
		
		
		LoginDTO dto = dao.login(map);
		//System.out.println(dto.getSeq() + dto.getUserId() + dto.getName() + dto.getMileagePoint() + dto.getUserImage());
		
		String userSeq = dto.getSeq();
		
		int massageCNT = dao.getMassage(userSeq);
		System.out.println("새로운 쪽지 : " + massageCNT);
		
		if ( isAdmin.equals("admin") ) {
			
			if ( dto.getMemberState().equals("4") ) {
				
				boolean isAdminId = true;
				
				HttpSession session = req.getSession();
				session.setAttribute("userSeq", dto.getSeq());
				session.setAttribute("userId", dto.getUserId());
				session.setAttribute("userName", dto.getName());
				session.setAttribute("userMile", dto.getMileagePoint());
				session.setAttribute("userImage", dto.getUserImage());
				session.setAttribute("memberState", dto.getMemberState());
				session.setAttribute("massageCNT", massageCNT);
				
				JSONObject obj = new JSONObject();
				obj.put("isAdminId", isAdminId);
				obj.put("check", pwCheck);
				req.setAttribute("check", obj);
				
				return "/auth/pwcheck";
			
			} else {

				boolean isAdminId = false;
				JSONObject obj = new JSONObject();
				obj.put("isAdminId", isAdminId);
				obj.put("check", pwCheck);
				req.setAttribute("check", obj);
				
				return "/auth/pwcheck";
			}
			
		}
		
		
		HttpSession session = req.getSession();
		session.setAttribute("userSeq", dto.getSeq());
		session.setAttribute("userId", dto.getUserId());
		session.setAttribute("userName", dto.getName());
		session.setAttribute("userMile", dto.getMileagePoint());
		session.setAttribute("userImage", dto.getUserImage());
		session.setAttribute("memberState", dto.getMemberState());
		session.setAttribute("massageCNT", massageCNT);
		
		JSONObject obj = new JSONObject();
		
		obj.put("check", pwCheck);
		req.setAttribute("check", obj);
		return "/auth/pwcheck";

	}
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/auth/logout.action")	
	public String logout(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.invalidate(); // 세션 초기화(모든 키값 삭제)
		
		return "/auth/logout";
	}
}
