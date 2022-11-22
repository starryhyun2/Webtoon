package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.Webtoon_UserVO;

@Repository
public class Webtoon_UserDAO {

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
	public Webtoon_UserVO selectOne(String id) {
		Webtoon_UserVO res = sqlSession.selectOne("m.mypage_selectOne", id);
		return res;
	}
	
	//개인정보 수정
	public int update(Webtoon_UserVO vo) {
		int res = sqlSession.update("m.mypage_update", vo);
		return res;
	}
	
	public List<Webtoon_UserVO> selectList(int idx) {
		List<Webtoon_UserVO> res = sqlSession.selectOne("m.mypage_blog", idx);
		return res;
	}
}
