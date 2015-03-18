package com.standard.exam;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.standard.exam.admin.board.NoticeDTO;
import com.standard.exam.admin.board.SurveyDTO;
import com.standard.exam.user.board.CalendarDTO;

@Repository
public class HomeControllerDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//설문조사제목리스트
	public SurveyDTO subjectList() {
		return sqlSession.selectOne("home.subjectlist");
	}
	
	//설문조사내용리스트
	public List<SurveyDTO> contentList(String seq) {
		return sqlSession.selectList("home.contentlist", seq);
	}
	
	//투표하기
	public void updateAnswerCount(String cSeq) {
		sqlSession.update("home.updateanswercount", cSeq);
	}
	
	//설문조사 카운트 증가
	public void updateCount(String seq, String cSeq) {
		sqlSession.update("home.updatevotecount", seq);
		sqlSession.update("home.updateanswercount", cSeq);
	}
	
	
	//공지사항총개수
	public int getTotal() {
		return sqlSession.selectOne("home.gettotal");
	}
	
	//공지사항리스트
	public List<NoticeDTO> getNoticeList(HashMap<String, Integer> map) {
		return sqlSession.selectList("home.getnoticelist", map);
	}
	
	//일정 리스트 불러오기
	public List<CalendarDTO> getCalendarList(HashMap<String, Integer> calendarMap) {
		return sqlSession.selectList("home.getcalendarlist", calendarMap);
	}
	
	//일정 총개수 가져오기
	public int getCalendarTotal() {
		return sqlSession.selectOne("home.getcalendartotal");
	}
	
	//설문조사 했는지 검사
	public int checkHistory(HashMap<String, String> map) {
		return sqlSession.selectOne("home.checkhistory", map);
	}
	
	//설문조사 기록 남기기
	public void insertHistory(HashMap<String, String> map) {
		sqlSession.insert("home.inserthistory", map);
	}
	
}
