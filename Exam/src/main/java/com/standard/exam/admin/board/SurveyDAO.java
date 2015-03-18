package com.standard.exam.admin.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SurveyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//설문조사 삽입
	public void add(SurveyDTO dto) {
		sqlSession.insert("survey.add", dto);
	}
	
	//방금 만든 설문조사 seq 가져오기
	public String getSeq() {
		return sqlSession.selectOne("survey.getseq");
	}
	
	//설문조사내용 삽입
	public void addContent(HashMap<String, String> map) {
		sqlSession.insert("survey.addcontent", map);
	}
	
	
	//설문조사제목
	public List<SurveyDTO> subjectList() {
		return sqlSession.selectList("survey.subjectlist");
	}
	
	//설문조사내용
	public List<SurveyDTO> contentList() {
		return sqlSession.selectList("survey.contentlist");
	}

	
	//설문조사제목 목록 가져오기
	public SurveyDTO getSubjectList(String seq) {
		return sqlSession.selectOne("survey.getsubjectlist", seq);
	}
	
	//설문조사 내용 목록 가져오기
	public List<SurveyDTO> getSurveyContentList(String seq) {
		return sqlSession.selectList("survey.getsurveycontentlist", seq);
	}
	
	//설문조사내용 개수가져오기
	public int getCount(String seq) {
		return sqlSession.selectOne("survey.getcount", seq);
	}
	
	//설문조사 수정하기
	public void edit(SurveyDTO dto) {
		sqlSession.update("survey.edit", dto);
	}
	
	//설문조사내용 seq불러오기
	public List<String> getContentSeq(String seq) {
		return sqlSession.selectList("survey.getcontentseq", seq);
	}

	
	//설문조사 내용 업데이트
	public void contentEdit(HashMap<String, String> map) {
		sqlSession.update("survey.contentedit", map);
	}
	
	//설문조사내용삭제
	public void contentDel(String seq) {
		sqlSession.delete("survey.contentdel", seq);
	}
	
	//설문조사제목삭제
	public void subjectDel(String seq) {
		sqlSession.delete("survey.historydel", seq);
		sqlSession.delete("survey.subjectdel", seq);
	}
	
	//메인등록
	public void updateMain(String seq) {
		sqlSession.update("survey.updatemain", seq);
	}
	
	//메인초기화
	public void clearMain() {
		sqlSession.update("survey.clearMain");
	}
	
	
	
	
	
}
