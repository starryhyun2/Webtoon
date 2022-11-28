package com.korea.service;



import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.korea.controller.UserDTO;

import dao.UserDao;
import vo.UserVO;

@Service
	public class UserServiceImpl implements UserService {

		//DB와 연결 (의존주입)
		@Inject
		private UserDao mdao;
		
		//회원가입
		@Override
		public void insertUser(UserVO vo) {
			//컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB
			System.out.println("S : 회원가입동작");
			if(vo == null) {
				//처리
				return;
			}
			mdao.insertUser(vo);
		}

		//로그인기능
		@Override
		public UserVO loginUser(UserVO vo) {
			System.out.println("S : 컨트롤러에서 호출받으면 필요한 정보를 받아서 DAO로 전달");
			UserVO returnVO = null;
			try {
				returnVO = mdao.readUserWithIDPW(vo.getID(), vo.getPWD());
			} catch (Exception e) {
				e.printStackTrace();
				returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
			}
			return returnVO; //null이 반환되면 앞의 코드가 문제가 있다는 것을 바로 알수있다.
		}	
		 
	    
	    @Inject    
	    UserDao userdao; //dao를 사용하기 위해 의존성을 주입
	    private JavaMailSender mailSender;
	 
	    
	    
	    @Override    //회원가입 메소드, Map과 dto를 갖이 넘김
	    public void join(Map<String, Object>map,UserDTO dto) {
	        userdao.join(map,dto);
	 
	    }
	 
	 
	    @Override    //로그인 관련 메소드 (세션에 아이디와 비밀번호를 저장)
	    public boolean loginCheck(UserDTO dto, HttpSession session) {
	        
	        boolean result = userdao.loginCheck(dto);
	        if(result) {    //로그인 성공
	            session.setAttribute("ID", dto.getID());
	            session.setAttribute("PWD", dto.getPWD());
	            System.out.println(session.getAttribute("ID"));
	            System.out.println(session.getAttribute("PWD"));
	        }
	        
	        return result;
	    }
	 
	    //아이디 찾기
	    @Override
	    public String find_idCheck(UserDTO dto) {
	        String ID = userdao.ID_Check(dto);
	        
	        return ID;
	    }
	 
	    //비밀번호 찾기
	    @Override
	    public String find_passCheck(UserDTO dto) {
	        String PWD = userdao.find_PWD_Check(dto);
	        return PWD;
	    }
	 
	 
	    @Override
	    public void authentication(UserDTO dto) {
	        
	        userdao.authentication(dto);
	    }
	 
	 
	    @Override
	    public void pass_change(Map<String, Object> map, UserDTO dto) throws Exception {
	        
	        
	        userdao.pass_change(map,dto);
	    }
	 
	 
	    //이메일 중복 확인
	    @Override
	    public boolean email_check(String e_mail) throws Exception{
	        
	        boolean result = userdao.email_check(e_mail);
	        
	        return result;
	        
	    }
	 
	    //아이디 중복 확인
	    @Override
	    public boolean join_id_check(String user_id) throws Exception {
	    
	        boolean result = userdao.join_id_check(user_id);
	        
	        return result;
	    }
}
	 


