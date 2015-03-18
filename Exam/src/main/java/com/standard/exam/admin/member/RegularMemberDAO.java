package com.standard.exam.admin.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class RegularMemberDAO {
		
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		//게시물 삽입
		public int add(RegularMemberDTO dto) {
			return sqlSession.insert("regularmember.add", dto);
		}
		
		//글 내용 가져오기
		public List<RegularMemberDTO> list(HashMap<String,Integer> map) {
			return sqlSession.selectList("regularmember.list", map);
		}
		
		//해당 글 삭제
		public void del(String seq) {
			sqlSession.delete("regularmember.del", seq);
		}

		public RegularMemberDTO get(String seq) {
			return sqlSession.selectOne("noticeboard.get",seq);
		}
		
		
}
