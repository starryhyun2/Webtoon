package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//전체 게시물 조회

	public List<BoardVO> selectList(HashMap<String, Integer> map){
		//map[key = start value = start, key = end value = end]
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);	
		return list;

	}
	//전체 게시물 수 조회
	public int getRowTotal(){

		int res = sqlSession.selectOne("b.board_count");	
		return res;

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

	// 글 삭제

	public int delete(int idx) {

		int res = sqlSession.delete("b.del_update", idx);

		return res;
	}


}
