package com.standard.exam.admin.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestNewsBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 글추가
	public void add(TestNewsBoardDTO dto) {
		sqlSession.insert("testnewsboard.add", dto);
	}

	// 글목록수
	public int getTotal() {
		return sqlSession.selectOne("testnewsboard.getTotal");
	}

	// 검색어 없는 목록
	public List<TestNewsBoardDTO> list(HashMap<String, Integer> map) {
		return sqlSession.selectList("testnewsboard.list", map);
	}

	// 검색어 있는 목록
	public List<TestNewsBoardDTO> searchList(HashMap<String, String> search) {
		return sqlSession.selectList("testnewsboard.searchList", search);
	}

	// 조회수 증가
	public void addCount(String seq) {
		sqlSession.update("testnewsboard.addCount", seq);	
	}

	// 글 내용 가져오기
	public TestNewsBoardDTO get(String seq) {
		return sqlSession.selectOne("testnewsboard.get", seq);
	}

	
	// 삭제하기
	public void del(String seq) {
		sqlSession.delete("testnewsboard.del", seq);
		
	}

	// 수정하기
	public void edit(TestNewsBoardDTO dto) {
		sqlSession.update("testnewsboard.edit", dto);
	}
	

}
