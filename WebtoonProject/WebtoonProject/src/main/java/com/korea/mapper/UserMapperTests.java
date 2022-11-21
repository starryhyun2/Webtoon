package com.korea.mapper;

	import org.junit.Test;
	import org.junit.runner.RunWith;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.test.context.ContextConfiguration;
	import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


	import vo.UserVO;

	@RunWith(SpringJUnit4ClassRunner.class)//ApplicationContext를 만들고 작업을 할 수 있도록 jUnit의 기능 확장
	@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")//@bean 설정 파일의 위치를 지정할 수 있다. bean을 등록해 둔 xml파일을 지정해 컨테이너에서 사용할 수 있도록 해줌. 어떤 파일을 참조 할지 모르는 상태이기 때문에 어노테이션을 함께 써줘야 한다.
	public class UserMapperTests{

		@Autowired//자동으로 의존성 주입
		private UserMapper usermapper;			//UserMapper.java 인터페이스 의존성 주입
		
		//회원가입 쿼리 테스트 메서드
		@Test
		public void userJoin() throws Exception{
			UserVO user = new UserVO();
			
			user.setID("test");			//회원 id
			user.setPWD("test");			//회원 비밀번호
			user.setNAME("test");		//회원 이름
			user.setEMAIL("test");		//회원 메일
			
			usermapper.userJoin(user);			//쿼리 메서드 실행
			
		}
		
		
		
	}

