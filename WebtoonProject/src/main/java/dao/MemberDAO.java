package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//로그인 가능여부(id)
	public MemberVO loginCheck(String id) {
		//파라미터로 전달된 id와 일치하는 객체가 있는지 DB를 통해 검색
		MemberVO vo = sqlSession.selectOne("u.login_check", id);
		return vo;
	}

}
