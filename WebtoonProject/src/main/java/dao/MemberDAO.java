package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MemberDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 회원가입
	//public int insert(Webtoon_UserVO vo) {					
	//	int res = sqlSession.insert("m.mypage_insert", vo);
	//	return res;
	//}
	
	// 마이페이지에 출력될 유저의 정보 불러오기
	public MemberVO selectOne(String id) {
		MemberVO res = sqlSession.selectOne("u.mypage_selectOne", id);
		return res;
	}
	
	//개인정보 수정
	public int update(MemberVO vo) {
		int res = sqlSession.update("u.mypage_update", vo);
		return res;
	}
	
}

