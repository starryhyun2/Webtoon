package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.WebtoonCommentsVO;

public class WebtoonCommentsDAO {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시물 조회
	
	public List<WebtoonCommentsVO> selectList(int episode_idx){
		
		List<WebtoonCommentsVO> wc_list = sqlSession.selectList("wc.wc_list",episode_idx);	
		return wc_list;
		
	}
	
	// 새 글 작성
	public int insert(WebtoonCommentsVO vo) {
		
		int res = sqlSession.insert("wc.wc_insert" , vo);
		return res;
		
	}
	
	//웹툰 댓글 수정
	public int update(WebtoonCommentsVO vo) {
		int res = sqlSession.insert("wc.wc_update" , vo);
		return res;
	}
	
	//웹툰 댓글 삭제
	public int delete(WebtoonCommentsVO vo) {
		int res = sqlSession.delete("wc.deleteByidx", vo);
		return res;
	}
	

}
