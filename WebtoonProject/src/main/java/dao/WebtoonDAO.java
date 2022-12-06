package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.EpisodeVO;
import vo.WebtoonVO;
import vo.WebtoonVO2;

public class WebtoonDAO {
	SqlSession sqlSession;
	
	public WebtoonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//북마크(병합시 필요없음)
	public List<WebtoonVO> selectList(){
		List<WebtoonVO> list = sqlSession.selectList("bm.select_list");
		return list;
	}
	
	public WebtoonVO select(int ref){
		WebtoonVO list = sqlSession.selectOne("bm.select_bookmark", ref);
		return list;
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
	
}
