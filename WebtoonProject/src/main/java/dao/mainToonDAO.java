package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.WebtoonVO;

public class mainToonDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메인툰 전체 목록 조회
	
	public List<WebtoonVO> selectList(){
		
		List<WebtoonVO> list = sqlSession.selectList("m.mainToon_list");
		
		return list;
		
	}
	
	//새 웹툰 추가
	
	public int insert(WebtoonVO vo) {
		
		//매퍼로 딱 한 개의 객체만 넘겨줄 수 있음
		int res = sqlSession.insert("m.mainToon_insert", vo);
		
		return res;
		
	}

	

}
