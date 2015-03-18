package com.standard.exam.user.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//관리자시험일정입력
	public void insertCalendar(CalendarDTO dto) {
		sqlSession.insert("examcalendar.insertcalendar", dto);
	}
	
	//관리자시험일정불러오기
	public List<CalendarDTO> getlist() {
		return sqlSession.selectList("examcalendar.getlist");
	}
	
	//관리자시험삭제하기
	public void delCalendar(String seq) {
		sqlSession.delete("examcalendar.delcalendar", seq);
	}
	
	//관리자시험일정내용보기
	public CalendarDTO getview(String seq) {
		return sqlSession.selectOne("examcalendar.getview", seq);
	}
}
