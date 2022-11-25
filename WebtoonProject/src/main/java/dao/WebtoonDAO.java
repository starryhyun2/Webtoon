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
}
