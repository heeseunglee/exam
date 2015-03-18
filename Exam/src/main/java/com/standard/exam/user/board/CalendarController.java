package com.standard.exam.user.board;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("calendar")
public class CalendarController {

	@Autowired
	CalendarDAO dao;
	
	//관리자 켈린더 입력하기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/setcalendar.action")
	public String adminSetData(HttpServletRequest req, CalendarDTO dto, HttpSession session) {
		
		
		return "admin/board/setcalendar";
	}

	//관리자 켈린더 DB입력
	@RequestMapping(method={RequestMethod.GET}, value="/admin/setcalendarok.action")
	public String addminSetDataOk(HttpServletRequest req, CalendarDTO dto, HttpSession session) {
		
		String subjectExamDate = req.getParameter("subjectExamDate");
		String examDate = req.getParameter("examDate");
		String startTime = req.getParameter("startTime");
		String siteURL = req.getParameter("siteURL");
		String examTime = req.getParameter("examTime");
		String examSupplies = req.getParameter("examSupplies");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dto.setSubjectExamDate(subjectExamDate);
		dto.setExamDate(examDate);
		dto.setStartTime(startTime);
		dto.setSiteURL(siteURL);
		dto.setExamTime(examTime);
		dto.setExamSupplies(examSupplies);
		
		//일정삽입
		dao.insertCalendar(dto);
		
		
		return "admin/board/setcalendarok";
	}
	
	//관리자 캘린더 삭제하기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/delcalendar.action")
	public String adminDelDate(HttpServletRequest req, HttpSession session) {
		
		String seq = req.getParameter("seq");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dao.delCalendar(seq);
		
		return "admin/board/delcalendar";
	}
	
	//관리자 캘린더리스트보기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/listcalendar.action")
	public String adminListDate(HttpServletRequest req, CalendarDTO dto, HttpSession session) {
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		//일정목록 불러오기
		List<CalendarDTO> list = dao.getlist();
		for (int i=0; i<list.size(); i++) {
			dto = list.get(i);
			
			dto.setExamDate(dto.getExamDate().substring(0, 10));
		}
		
		req.setAttribute("list", list);
		
		return "admin/board/calendarlist";
	}
	
	//캘린더 정보보기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/calendarview.action")
	public String adminCalendarView(HttpServletRequest req, CalendarDTO dto, HttpSession session) {
		
		String seq = req.getParameter("seq");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dto = dao.getview(seq);
		
		dto.setExamDate(dto.getExamDate().substring(0, 10));
		dto.setSiteURL(String.format("<a href='%s' target='_blank'>%s</a>", dto.getSiteURL(), dto.getSiteURL()));
		
		req.setAttribute("dto", dto);
		
		return "admin/board/calendarview";
	}
	

	
	//유저캘린더보기
	@RequestMapping(method={RequestMethod.GET}, value="/user/calendar.action")
	public String userView(HttpServletRequest req, CalendarDTO dto) {
		
		Calendar now = Calendar.getInstance();
		
		String nowDate = now.get(Calendar.YEAR)+"-"+(now.get(Calendar.MONTH)+1)+"-"+now.get(Calendar.DATE);
		
		List<CalendarDTO> list = dao.getlist();
		for (int i=0; i<list.size(); i++) {
			dto = list.get(i);
			
			dto.setExamDate(dto.getExamDate().substring(0, 10));
		}
		
		req.setAttribute("nowDate", nowDate);
		req.setAttribute("list", list);
		
		return "user/board/calendar";
	}
	
	//사용자 캘린더 내용보기
	@RequestMapping(method={RequestMethod.GET}, value="/user/calendarinfo.action")
	public String userEventInfo(HttpServletRequest req, CalendarDTO dto) {
		
		String seq = req.getParameter("seq");
		
		
		//뷰 가져오기
		dto = dao.getview(seq);
		
		Calendar now = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String tempDate = dto.getExamDate();
		long gap = 0;
		
		try {
			
			Date examDate = format.parse(tempDate);
			
			gap = examDate.getTime() - now.getTime().getTime();
			
			dto.setRemainDate("<span style='color: red;'>"+(gap/1000/60/60/24)+"</span>일 남았습니다.");
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		
		dto.setExamDate(dto.getExamDate().substring(0, 10));
		dto.setSiteURL(String.format("<a href='%s' target='_blank'>%s</a>", dto.getSiteURL(), dto.getSiteURL()));
		
		
		
		req.setAttribute("dto", dto);
		
		return "user/board/calendarinfo";
	}
	
	
	
}
