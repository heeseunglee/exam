package com.standard.exam.user.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.standard.exam.admin.board.NoticeDTO;

@Repository
public class FreeBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//게시물 삽입
	public void add(FreeBoardDTO dto) {
		sqlSession.insert("freeboard.add", dto);
		
	}
	
	
	//스레드가져오기
		public int getThread() {
			return sqlSession.selectOne("freeboard.getthread");
		}


		
		//리스트
		public List<FreeBoardDTO> list(HashMap<String, Integer> map) {
			return sqlSession.selectList("freeboard.list", map);
		}


		//해당글 보기
		public FreeBoardDTO get(String seq) {
			
			return sqlSession.selectOne("freeboard.get", seq);
		}

    
		//수정하기
		public void edit(FreeBoardDTO dto) {

			 sqlSession.update("freeboard.edit", dto);
		}


		//삭제하기
		public void del(String seq) {
			
			sqlSession.delete("freeboard.del", seq);
		}


		//조회수 증가
		public void addCount(String seq) {
			sqlSession.update("freeboard.addCount", seq);
			
		}

 
		//답변달기 쓰레드
		public void updateThread(HashMap<String, Integer> map) {
			sqlSession.update("freeboard.updatethread", map);
			
		}


		//총 게시물수 가져오기
		public int getTotal() {
			
			return sqlSession.selectOne("freeboard.getTotal");
		}

		//댓글쓰기
        public void comment(FreeBoardCommentDTO dto) {
		
        	sqlSession.insert("freeboard.comment", dto);
			
		}

		//댓글 카운트 증가
		public void commentCount(String pSeq) {

			sqlSession.update("freeboard.commentCount", pSeq);
			
		}

        //댓글 목록 가져오기
		public List<FreeBoardCommentDTO> listComment(String seq) {
			
			return sqlSession.selectList("freeboard.listComment", seq);
		}

		//댓글 삭제
		public void delComment(String seq) {
			sqlSession.delete("freeboard.delcomment", seq);
		}
		
		//개별댓글삭제
		public void commentDel(String seq) {
			sqlSession.delete("freeboard.commentdel", seq);
		}
		
		//검색리스트
		public List<FreeBoardDTO> searchList(HashMap<String, String> search) {
			return sqlSession.selectList("freeboard.searchlist", search);
		}

		//공지리스트
		public List<NoticeDTO> getNoticeList(HashMap<String, Integer> noticeMap) {
			return sqlSession.selectList("freeboard.getnoticelist", noticeMap);
		}

		//공지사항 총개수
		public int getNoticeTotalCount() {
			return sqlSession.selectOne("freeboard.getnoticetotalcount");
		}


		
}
