package com.standard.exam.user.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.standard.exam.admin.board.NoticeDTO;

@Repository
public class ExamBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
		//게시물 삽입
		public void add(ExamBoardDTO dto) {
			sqlSession.insert("examboard.add", dto);
			
		}
		
		
		//스레드가져오기
		public int getThread() {
			return sqlSession.selectOne("examboard.getthread");
		}
		
		
		//리스트 보기
		public List<ExamBoardDTO> list(HashMap<String, Integer> map) {
		
			return sqlSession.selectList("examboard.list", map);
		}
		
		//검색리스트   
		public List<ExamBoardDTO> searchList(HashMap<String, String> search) {
		
			return sqlSession.selectList("examboard.searchlist", search);
		}

		//해당글 보기
		public ExamBoardDTO get(String seq) {

			return sqlSession.selectOne("examboard.get", seq);
		}


		//수정하기
		public void edit(ExamBoardDTO dto) {

			sqlSession.update("examboard.edit", dto);
			
		}


		//글 삭제
		public void del(String seq) {

			sqlSession.delete("examboard.del", seq);
			
		}


		//댓글 쓰기
		public void comment(ExamBoardCommentDTO dto) {
			sqlSession.insert("examboard.comment", dto);
			
		}


		//댓글 카운트 증가
		public void commentCount(String pSeq) {
			sqlSession.selectOne("examboard.commentCount",pSeq);
			
		}
		
        //댓글목록 가져오기 
		public List<ExamBoardCommentDTO> listComment(String seq) {
			
			return sqlSession.selectList("examboard.listComment", seq);
		}


		//조회수 증가
		public void addCount(String seq) {

			sqlSession.update("examboard.addCount", seq);
			
		}

		
		//게시물수 가져오기        
		public int getTotal() {
			return sqlSession.selectOne("examboard.getTotal");
		}


		//답변달기 쓰레드
		public void updateThread(HashMap<String, Integer> map) {
			sqlSession.update("examboard.updatethread", map);
			
		}


		//댓글 삭제
		public void delComment(String seq) {

			sqlSession.delete("examboard.delcomment", seq);
			
		}


		//개별댓글 삭제
		public void commentDel(String seq) {

			sqlSession.delete("examboard.commentdel", seq);
			
		}


		public List<NoticeDTO> getNoticeList(HashMap<String, Integer> noticeMap) {
			return sqlSession.selectList("freeboard.getnoticelist", noticeMap);
			
		}

		
		//공지글총개수
		public int getNoticeTotalCount() {
			return sqlSession.selectOne("freeboard.getnoticetotalcount");
		}


		

		
      


		


	
		
}
