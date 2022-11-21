package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시물 조회
	
	public List<BoardVO> selectList(){
		
		List<BoardVO> list = sqlSession.selectList("b.board_list");	
		return list;
		
	}
	
	// 새 글 작성
	
	public int insert(BoardVO vo) {
		
		int res = sqlSession.insert("b.board_insert" , vo);
		return res;
		
	}
	
	//게시글 상세보기

	public BoardVO selectOne(int idx) {
		
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		return vo;
	}
	
	//조회 수 증가
	
	public int update_readhit( int idx ) {
		int res = sqlSession.update("b.update_readhit", idx);
		return res;
	}
	
	//댓글처리를 위한 step값을 증가
	public int update_step(BoardVO baseVO) {
		
		int res = sqlSession.update("b.update_step", baseVO);
		
		return res;
		
	}
	
	//댓글 추가 
	
	public int reply(BoardVO vo) {

		int res = sqlSession.insert("b.board_reply", vo);

		return res;
	}
	
	// 글 삭제

		public int del_update(BoardVO vo) {
			
			int res = sqlSession.update("b.del_update", vo);
			
			return res;
		}
	

}
