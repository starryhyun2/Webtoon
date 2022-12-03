package dao;

import org.apache.ibatis.session.SqlSession;

import vo.LoveVO;
import vo.WebtoonCommentsVO;

public class LoveDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//좋아요 테이블에 유저 추가
	public int insert(WebtoonCommentsVO vo) {
		int res =sqlSession.insert("love.love_insert",vo);
		return res;
	}
	//웹툰 좋아요 업데이트
	public int update_love(WebtoonCommentsVO vo) {
		int res = sqlSession.insert("wc.wc_update_love" , vo);
		return res;
	}
	
	//좋아요 취소를 위해서 love_vo 찾기
	public LoveVO findByID_comments(WebtoonCommentsVO vo) {
		LoveVO love_vo = sqlSession.selectOne("love.findByID_comments", vo);
		
		return love_vo;
	}
	
	//좋아요 삭제하기
	public int delete(WebtoonCommentsVO vo) {
		int res = sqlSession.delete("love.delete", vo);
		
		return res;
	}

}
