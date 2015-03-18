package com.standard.exam.admin.exam;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 시험종류 출력
	public List<CategoryDTO> tpbdivlist(CategoryDTO dto) {
		return sqlSession.selectList("category.tpbdivlist", dto);
	}
	
	// 시험종류 입력
	public void tpbdivadd(String tpbdivadd) {
		sqlSession.insert("category.tpbdivadd",tpbdivadd);
	}

	// 선택된 시험종류  seq 받아오기
	public String tbpdivcheckseq(String tpbdivadd) {
		return sqlSession.selectOne("category.tbpdivcheckseq",tpbdivadd);
	}

	// 선택된 시험종류로 시험과목 리스트 받아오기
	public List<CategoryDTO> tpmdivlist(String tpbdivseq) {
		return sqlSession.selectList("category.tpmdivlist", tpbdivseq);
	}

	// 시험과목 등록
	public void tpmdivadd(CategoryDTO dto) {
		sqlSession.insert("category.tpmdivadd", dto);		
	}

	// 중분류  seq 받아오기
	public String tbmdivcheckseq(CategoryDTO dto) {
		return sqlSession.selectOne("category.tbmdivcheckseq",dto);
	}

	// 선택 중분류로 소분류 리스트 받아오기
	public List<CategoryDTO> tpsdivlist(String tpmdivseq) {
		return sqlSession.selectList("category.tpsdivlist", tpmdivseq);
	}

	// 시험회차 등록
	public void tpsdivadd(CategoryDTO dto) {
		sqlSession.insert("category.tpsdivadd", dto);
	}

	
	
	

	// 카테고리 중분류리스트
	
	

	




	

	
	// 중분류 추가

	
	// 소분류 추가



	

	
}
