package com.standard.exam.admin.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Member_listDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//총 게시물수 가져오기
	public int getTotal() {
		return sqlSession.selectOne("member_list.getTotal");
	}

	//검색어 없는 목록
	public List<MemberDTO> list(HashMap<String, Integer> map) {
		return sqlSession.selectList("member_list.list", map);
	}

	//검색어 있는 목록
	public List<MemberDTO> searchList(HashMap<String, String> search) {
		return sqlSession.selectList("member_list.searchList", search);
	}

	public MemberDTO get(String seq) {
		return sqlSession.selectOne("member_list.get", seq);
	}

	
	//회원 수정 사항
	public void msedit(MemberDTO dto) {
		sqlSession.update("member_list.msedit", dto);
	}

	
	public void edit(MemberDTO dto) {
		sqlSession.update("member_list.edit", dto);
	}

	//memberState 테이블 update
	public void mbsedit(MemberDTO dto) {
		sqlSession.update("member_list.mbsedit", dto);
		
	}

	// 유료회원 총수
	public int getMembershipTotal() {
		return sqlSession.selectOne("member_list.getMembershipTotal");
	}

	//유료회원 리스트
	public List<MemberDTO> Membershiplist(HashMap<String, Integer> map) {
		return sqlSession.selectList("member_list.membershiplist", map);
	}

	
	public List<MemberDTO> searchMembershipList(HashMap<String, String> search) {
		return sqlSession.selectList("member_list.searchMembershipList", search);
	}

	
	//탈퇴총수
	public int getUnregisterTotal() {
		return sqlSession.selectOne("member_list.getUnregisterTotal");
	}

	//탈퇴리스트
	public List<MemberDTO> unregisterlist(HashMap<String, Integer> map) {
		return sqlSession.selectList("member_list.unregisterlist", map);
	}

	
	//탈퇴 검색
	public List<MemberDTO> searchUnregisterList(HashMap<String, String> search) {
		return sqlSession.selectList("member_list.searchUnregisterlist", search);
	}

	
	//탈퇴회원 복구
	public void member_reactive(String seq) {
		sqlSession.update("member_list.userReactive", seq);
	}


	
}
