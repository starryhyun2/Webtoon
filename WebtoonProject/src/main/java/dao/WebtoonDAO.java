package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.EpisodeVO;
import vo.WebtoonVO;

public class WebtoonDAO {
	SqlSession sqlSession;
	
	public WebtoonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//웹툰 선택
	public WebtoonVO selectOne(int idx){
		WebtoonVO vo = sqlSession.selectOne("w.find", idx);
		
		return vo;
	}
	
	//웹툰 선택 후 회차 선택을 위한 View
	public List<EpisodeVO> selectEpi(int idx) {
		List<EpisodeVO> epi= sqlSession.selectList("w.showepi", idx);
		
		return epi;
	}
	
	//회차 선택
	public EpisodeVO selectOne1(int idx) {
		
		EpisodeVO vo =sqlSession.selectOne("w.find_epi",idx);
		
		return vo;
		
	}
	
	//회차 삽입
	public int insert(EpisodeVO vo) {
		int res =sqlSession.insert("w.epi_insert", vo);
		return res;
	}
	
	//ref로 삽입할 웹툰 찾기
	public WebtoonVO selectOne_ref(int ref) {
		WebtoonVO vo = sqlSession.selectOne("w.findByRef", ref);
		
		return vo;
	}
	
	//회차 삽입시 정렬을 위해서 선언했던 step 업데이트
	public int updateStep(int ref) {
		int res =sqlSession.update("w.updateStep",ref);
		
		return res;
	}
	
	//웹툰 회차 별점 업데이트
	public int updateScore(int scoreNum, int episode_idx) {
		
		//평점 계산을 위한 readhit 업데이트
		int res = sqlSession.update("w.updateScoreReadhit", episode_idx);
		
		//해당 회차의 에피소드 찾기
		EpisodeVO vo =sqlSession.selectOne("w.find_epi",episode_idx);
		
		//에피소드 평점 계산
		double readhit = vo.getReadhit();
		double totalscore = vo.getTotalscore();
		totalscore += scoreNum;
		double middlescore = totalscore/readhit;
		
		//Math.round 를 사용하여 언제나 소수점  1자리까지만 저장함
		middlescore = Math.round(middlescore*10)/10.0;
		vo.setScore(middlescore);
		vo.setTotalscore(totalscore);
		res = sqlSession.update("w.updateScore",vo);
		
		return res;
	}
}
