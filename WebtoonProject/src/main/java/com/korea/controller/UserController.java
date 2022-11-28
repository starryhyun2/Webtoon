package com.korea.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korea.service.UserService;

import vo.UserVO;


@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	//3-1. 서비스 처리 객체를 주입(DI)
	@Inject
	private UserService service;
	
	private static final Logger l = LoggerFactory.getLogger(UserController.class);
	
	/* 회원가입 처리하는 동작 */
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	//value="/User/insert"에서 User를 빼도 됨
	public String insertGET() throws Exception {
		l.info("C: 회원가입 입력페이지 GET");
		return "/User/insertUser";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	//value="/User/insertPro"에서 User를 빼도 됨
	public String insertPOST(UserVO vo) throws Exception{
		
		//1. 한글처리 : request객체가 없다 => web.xml에서 filter태그로 인코딩해야한다.
		
		//2. 전달된 파라미터 받기
		//request.getParameter라는 내장객체가 없다. 따라서 메서드의 매개변수를 통해 가져올 수 있다.
		//l.info("C: "+ request.getParameter()); 에러발생
		l.info("C: "+ vo);
		
		//3. 서비스객체 생성(직접생성안하고 의존주입)
		//3-2. 서비스객체호출
		service.insertUser();		
		l.info("C: 회원가입 처리페이지 POST");
		
		//4. 로그인페이지로 이동(주소줄과 view페이지 동시에 insert->login 변경되어야함)
		return "redirect:/User/login";
	}
	
	/* 로그인 기능 */
	// http://localhost:8088/User/login

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception{
		l.info("C: 로그인 입력페이지 GET");
		return "/user/loginform";
	}
	
	
	@RequestMapping
	(value = "/login", method = RequestMethod.POST)
	//public String loginPOST(@ModelAttribute("userid") String id, @ModelAttribute("userpw") String pw) throws Exception{


	public String loginPOST(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		l.info("C: 로그인 처리페이지 POST");
		
		//1.한글처리 => web.xml에서 완료
		
		//2.전달받은 파라미터 저장 => loginPOST()메서드의 파라미터값으로 저장함.
		l.info("C: "+ vo.getID() + vo.getPWD());
		
		//3.서비스객체생성 => 22번째 코드로 의존주입완료
		//4.서비스 로그인 체크 동작(HttpSession)
		UserVO returnVO = service.loginUser(vo);
		l.info("C: 리턴VO결과(서비스에서 예외처리를 진행했으므로 null이 출력되면 코드에 문제있다는 의미) "+returnVO);
		
		//5.메인페이지로 이동(주소줄과 view페이지 동시에 main으로 변경되어야함)
		// 해당 정보 있는 경우 : => main페이지로 이동
		//if(returnVO.getUserid() != null) {
		//에러가 발생하는 이유:
		if(returnVO != null) {
			//5.세션값생성
			session.setAttribute("ID", returnVO.ID());
			
			//RedirectAttributes의 addAttribute메서드 사용해보려고 했으나 실패. 에러 발생
			//Map<String, Object> map = new HashMap<String, Object>();
			//map.put("username", returnVO.getUsername());
			//map.put("useremail", returnVO.getUseremail());
			//rttr.addAttribute("mvo", map);
			
			rttr.addFlashAttribute("mvo", returnVO);
			//l.info("C: 모델에 뭐 들어있니?"+model);
			return "redirect:/user/main"; 
		} else {
			// 해당 정보 없는 경우 : => login페이지로 이동
			return "redirect:/user/login";
		}
	}//end of loginPOST()
	public class MemberController {
	    
	    
	    @Inject    //서비스를 호출하기 위해서 의존성을 주입
	    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	    Userservice userservice; //서비스를 호출하기 위해 의존성을 주입
	    
	    
	    //로깅을 위한 변수
	    private static final Logger logger=
	    LoggerFactory.getLogger(MemberController.class);
	    private static final String String = null;
	    
	    
	    // mailSending 코드
	        @RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
	        public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {
	 
	            Random r = new Random();
	            int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
	            
	            String setfrom = "tswdmswls@gamil.com";
	            String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
	            String title = "회원가입 인증 이메일 입니다."; // 제목
	            String content =
	            
	            System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	            
	            System.getProperty("line.separator")+
	                    
	            "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	    
	            " 인증번호는 " +dice+ " 입니다. "
	            
	            +System.getProperty("line.separator")+
	            
	            System.getProperty("line.separator")+
	            
	            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	            
	            
	            try {
	                MimeMessage message = mailSender.createMimeMessage();
	                MimeMessageHelper messageHelper = new MimeMessageHelper(message,
	                        true, "UTF-8");
	 
	                messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	                messageHelper.setTo(tomail); // 받는사람 이메일
	                messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	                messageHelper.setText(content); // 메일 내용
	                
	                mailSender.send(message);
	            } catch (Exception e) {
	                System.out.println(e);
	            }
	            
	            ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
	            mv.setViewName("/member/email_check");     //뷰의이름
	            mv.addObject("dice", dice);
	            
	            System.out.println("mv : "+mv);
	 
	            response_email.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_email = response_email.getWriter();
	            out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
	            out_email.flush();
	            
	            
	            return mv;
	            
	        }
	    
	    //이메일 인증 페이지 맵핑 메소드
	    @RequestMapping("/user/email.do")
	    public String email() {
	        return "user/email";
	    }
	    
	    
	    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	    //틀리면 다시 원래 페이지로 돌아오는 메소드
	    @RequestMapping(value = "/user/email_check.do{dice}", method = RequestMethod.POST)
	    public ModelAndView join_injeung(String email_check, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	 
	        
	        System.out.println("마지막 : email_check : "+email_check);
	        
	        System.out.println("마지막 : dice : "+dice);
	        
	        
	        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
	         
	        ModelAndView mv = new ModelAndView();
	        
	        mv.setViewName("/member/join.do");
	        
	        mv.addObject("EMAIL",email_check);
	        
	        if (email_check.equals(dice)) {
	            
	            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
	            
	            
	            
	            mv.setViewName("member/join");
	            
	            mv.addObject("e_mail",email_check);
	            
	            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
	            //한번더 입력할 필요가 없게 한다.
	            
	            response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
	            out_equals.flush();
	    
	            return mv;
	            
	            
	        }else if (email_check != dice) {
	            
	            
	            ModelAndView mv2 = new ModelAndView(); 
	            
	            mv2.setViewName("member/email_check");
	            
	            response_equals.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response_equals.getWriter();
	            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	            out_equals.flush();
	            
	    
	            return mv2;
	            
	        }    
	    
	        return mv;
	        
	    }
	}
}
