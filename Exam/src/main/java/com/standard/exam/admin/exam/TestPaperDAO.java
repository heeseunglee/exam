package com.standard.exam.admin.exam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestPaperDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 시험종류 리스트
	public List<TestPaperDTO> TestPaperCategoryTpb(TestPaperDTO dto) {
		return sqlSession.selectList("testpaper.tpbdivlist", dto);
	}

	// 선택 seq 시험과목 리스트
	public List<TestPaperDTO> TestPaperCategoryTpm(String tpbdiv) {
		return sqlSession.selectList("testpaper.tpmdivlist", tpbdiv);
	}

	// 선택 seq 시험회차 리스트
	public List<TestPaperDTO> TestPaperCategoryTps(String tpmdiv) {
		return sqlSession.selectList("testpaper.tpsdivlist", tpmdiv);
	}

	// 경호 내용 추가
	public List<TestPaperDTO> getTpmdiv() {
		return sqlSession.selectList("testpaper.gettpmdiv");
	}

	// 시험문제리스트
	public List<QuestionDTO> questionlist(String tpmdiv) {
		return sqlSession.selectList("testpaper.questionlist", tpmdiv);
	}

	// 선택된 시험과목명
	public String tpmdivcheck(String tpmdiv) {
		return sqlSession.selectOne("testpaper.tpmdivcheck", tpmdiv);
	}

	
	// 문제지 등록

	public void tpmadd(TestPaperDTO dto) {
		sqlSession.insert("testpaper.tpmadd", dto);
	}
	
	// 시험그룹 추가
	public void testgroupadd(String list) {
		sqlSession.insert("testpaper.testgroupadd", list);
	}


	// 선택문제 중분류 호출 
	public String testpaperseq() {
		return sqlSession.selectOne("testpaper.testpaperseq");
	}

	// 선택문제 추가
	public void questionadd(QuestionDTO dto) {
		sqlSession.insert("testpaper.questionadd", dto);
	}

	// 시험지 seq 호출
	public List<String> tpmseq() {
		return sqlSession.selectList("testpaper.tpmseq");
	}


	public void alltestadd(String testpaperseq) {
		sqlSession.insert("testpaper.alltestadd",testpaperseq);
	}
	
	// 문제지리스트
	public TestPaperDTO allestcnt(String tpmSeq) {
		return sqlSession.selectOne("testpaper.alltestcnt", tpmSeq);
	}

	public int getTotal() {
		return sqlSession.selectOne("testpaper.getTotal");
	}

	public void testpaperdel(String tpmSeq) {
		sqlSession.selectOne("testpaper.testpaperdel",tpmSeq);
	}

	public TestPaperDTO tpmedit(String tpmSeq) {
		return sqlSession.selectOne("testpaper.tpmedit", tpmSeq);
	}

	public List<QuestionDTO> questioneditlist(String tpmSeq) {
		return sqlSession.selectList("testpaper.questioneditlist",tpmSeq);
	}

	public void tpmDel(String tpmSeq) {
		sqlSession.delete("testpaper.tpmDel", tpmSeq);
	}

	public List<QuestionDTO> questioneditlist1(String tpmSubject) {
		return sqlSession.selectList("testpaper.questioneditlist1",tpmSubject);
	}

	
	


	

/*	public List<TestPaperDTO> allestcnt(List<TestPaperDTO> tpmlistseq) {
		return sqlSession.selectList("testpaper.alltestcnt", tpmlistseq);
	}
*/
}
