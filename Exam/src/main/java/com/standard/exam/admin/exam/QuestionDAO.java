package com.standard.exam.admin.exam;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//시험 문제 삽입
	public void add(QuestionDTO dto) {
		sqlSession.insert("question.add", dto);
	}
	
	//총 게시물 수 가져오기
	public int getTotal() {
		return sqlSession.selectOne("question.gettotal");
	}
	
	//검색어 없는 목록
	public List<QuestionDTO> list(HashMap<String, String> map) {
		return sqlSession.selectList("question.list", map);
	}
	
	//검색어 있는 목록
	public List<QuestionDTO> searchList(HashMap<String, String> map) {
		return sqlSession.selectList("question.searchlist", map);
	}
	
	
	//글 수정
	public void edit(QuestionDTO dto) {
		sqlSession.update("question.edit", dto);
	}
	
	
	//글 삭제
	public void del(String seq) {
		sqlSession.delete("question.del", seq);
	}
	
	
	//대분류 리스트 가져오기
	public List<TestPaperDTO> getTpbList() {
		return sqlSession.selectList("question.gettpblist");
	}
	
	//중분류 리스트 가져오기
	public List<TestPaperDTO> getTpmList(String tpbdiv) {
		return sqlSession.selectList("question.gettpmlist", tpbdiv);
	}
	
	//소분류 리스트 가져오기
	public List<TestPaperDTO> getTpsList(String tpmdiv) {
		return sqlSession.selectList("question.gettpslist", tpmdiv);
	}
	
	
	
}
