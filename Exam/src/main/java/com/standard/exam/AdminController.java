package com.standard.exam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *  관리자 홈페이지 컨트롤러
 */
@Controller("Admin")
public class AdminController {

	@RequestMapping(method={RequestMethod.GET}, value="/admin/home.action")
	public String admin() {
		
		
		return "/admin/admin_home";
	}
	
}
