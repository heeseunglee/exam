package com.standard.exam.user.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.standard.exam.admin.board.TestNewsBoardDTO;

@Repository
public class UserTestNewsDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 글목록수
	public int getTotal() {
		return sqlSession.selectOne("usertestnews.getTotal");
	}

	// 검색어 없는 목록
	public List<UserTestNewsDTO> list(HashMap<String, Integer> map) {
		return sqlSession.selectList("usertestnews.list", map);
	}

	// 검색어 있는 목록
	public List<UserTestNewsDTO> searchList(HashMap<String, String> search) {
		return sqlSession.selectList("usertestnews.searchList", search);
	}

	// 조회수 증가
	public void addCount(String seq) {
		sqlSession.update("usertestnews.addCount", seq);	
	}

	// 해당 글 보기
	public UserTestNewsDTO get(String seq) {
		return sqlSession.selectOne("usertestnews.get", seq);
	}

	
}
