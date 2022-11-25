package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;
import vo.c_BoardVO;

public class c_BoardDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시물 조회
	
	public List<c_BoardVO> selectList(){
		
		List<c_BoardVO> cb_list = sqlSession.selectList("cb.c_board_list");	
		return cb_list;
		
	}
	
	// 새 글 작성
	
	public int insert(c_BoardVO vo) {
		
		int res = sqlSession.insert("cb.c_board_insert" , vo);
		return res;
		
	}
	

}
