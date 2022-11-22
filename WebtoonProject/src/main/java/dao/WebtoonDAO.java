package dao;

import org.apache.ibatis.session.SqlSession;

import vo.WebtoonVO;

public class WebtoonDAO {
	SqlSession sqlSession;
	
	public WebtoonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public WebtoonVO selectOne(int idx){
		WebtoonVO vo = sqlSession.selectOne("w.find", idx);
		
		return vo;
	}
}
