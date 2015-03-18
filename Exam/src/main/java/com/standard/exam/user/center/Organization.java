package com.standard.exam.user.center;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Organization {
	
	@RequestMapping( method=RequestMethod.GET, value="/user/organization")
	public String organization() {
		
		
		return "/user/center/organization";
	}
	
}
