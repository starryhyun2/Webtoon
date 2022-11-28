package dao;

import vo.UserVO;

public interface UserDao {
	//해당 도메인에 관련된 기능 선언
	public String getTime();

	//C: 회원가입
	public void insertUser(UserVO vo);

	//R: 회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public UserVO readUser(String ID) throws Exception;

	//R: 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public UserVO readUserWithIDPW(String ID,String PWD) throws Exception;
}
