package dao;

import org.apache.ibatis.session.SqlSession;

import vo.EpisodeVO;
import vo.ScoreVO;

public class ScoreDAO {
	
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//웹툰 회차 별점 업데이트
	public int updateScore(ScoreVO score_vo) {
		
		int episode_idx = score_vo.getEpisode_idx();
		int scoreNum = score_vo.getScore();
		
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
		
		//StoreScoreUser
		res = sqlSession.insert("ssu.insertssu", score_vo);
		//추후 평점 삭제를 위해 스코어 vo 선언;
		return res;
	}
	
	public ScoreVO findById(String id) {
		ScoreVO vo = sqlSession.selectOne("ssu.findById", id);
		return vo;
	}
	
	public int fixScore( ScoreVO score_vo, ScoreVO base_score_vo) {
		
		//웹툰 접근을 위한 episode_idx
		int episode_idx = score_vo.getEpisode_idx();
		
		//새로운 점수와 기준 점수
		int new_score = score_vo.getScore();
		int old_score = base_score_vo.getScore();
		
		//해당 회차의 에피소드 찾기
		EpisodeVO vo =sqlSession.selectOne("w.find_epi",episode_idx);
		
		//기존에 존재하던 점수만 빼기 위한 토탈 스코어 
		double totalscore = vo.getTotalscore();
		
		//기존에 존재하던 점수 -, 새로 업데이트될 점수 +
		totalscore -= old_score;
		totalscore += new_score;
		
		double readhit = vo.getReadhit();
		double middlescore = totalscore/readhit;
		
		middlescore = Math.round(middlescore*10)/10.0;
		
		//토탈 점수와 평점 업데이트
		vo.setScore(middlescore);
		vo.setTotalscore(totalscore);
		int res = sqlSession.update("w.updateScore",vo);
		
		//새로운 점수 Score DB에 업데이트
		res = sqlSession.update("ssu.updateScore",score_vo);
		
		return res;
	}
	

}
