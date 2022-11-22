package dao;

import org.apache.ibatis.session.SqlSession;

public class WebtoonDAO {
	SqlSession sqlSession;
	
	public WebtoonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
