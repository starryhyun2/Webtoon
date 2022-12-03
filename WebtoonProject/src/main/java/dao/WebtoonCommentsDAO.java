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
	
	//베스트 댓글 조회
	public List<WebtoonCommentsVO>selectList2(int episode_idx){
		List<WebtoonCommentsVO> best_wc_list = sqlSession.selectList("wc.wc_list2",episode_idx);	
		return best_wc_list;
	}
	
	//웹툰 댓글 step 추가
	public int update_step(int episode_idx) {
		int res = sqlSession.update("wc.update_step", episode_idx);
		return res;
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
