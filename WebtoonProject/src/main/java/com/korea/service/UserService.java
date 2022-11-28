package com.korea.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.korea.controller.UserDTO;

import vo.UserVO;

public interface UserService {
		// 회원 가입 (일반회원가입테이블에 sns계정 컬럼 추가하기)
		// 일반적으로는 DAO랑 같은 메소드명을 사용하여 일관성을 유지한다
		public void insertUser(UserVO vo);
		
		// 로그인기능 DAO랑 같은 이름으로 하지않은이유? 이름이 달라도 메서드생성가능하다는 걸 보여주기 위해서.
		// public UserVO readUserWithIDPW(String userid,String userpw) throws Exception;
		
		// 로그인기능
		public UserVO loginUser(UserVO vo);
	    
	    public void join (Map<String, Object>map,UserDTO dto); //회원가입 관련
	    
	    
	    public boolean loginCheck(UserDTO dto, HttpSession session);    //로그인 관련
	    
	    
	    public String find_idCheck(UserDTO dto);    //아이디 찾기 관련
	    
	    
	    public String find_passCheck(UserDTO dto);    //비밀번호 찾기 관련
	    
	    
	    public void authentication(UserDTO dto);        //회원 인증관련 메소드
	    
	    
	    public void pass_change(Map<String, Object> map, UserDTO dto)throws Exception;    //비밀번호 변경
	    
	    
	    public boolean email_check(String e_mail) throws Exception;    //이메일 중복확인을 하는 메소드
	    
	    
	    public boolean join_id_check(String user_id) throws Exception;    //회원가입시 아이디를 체크하는 메소드
	    
	    
	    public List<UserDTO> member_profile(String user_id) throws Exception;    //회원의 프로필을 볼 수 있는 메소드
	    
	    
	 
	}
		


