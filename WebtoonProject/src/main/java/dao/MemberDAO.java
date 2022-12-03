package dao;

import java.util.Random;

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

	
	//신원 인증용 개인 문자메시지 보내는 메서드
	public void sendMessage(String phonenum,String key ) {
		service.MessageService.sendMessage(phonenum, key);
		System.out.println(key);
	}
	
	//개인 이메일 보내는 메서드
	public void sendEmail(String email,String key) {
		service.MailService.sendmail(email,key);
		System.out.println(key);
	}
	
	//회원가입 정보를 DB에 저장하는 코드
	public int insert(MemberVO vo) {
		int res = sqlSession.insert("u.sign_in", vo);
		return res;
	}

}
