package com.korea.webtoon;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import dao.c_BoardDAO;
import dao.mainToonDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;
import vo.c_BoardVO;
import vo.WebtoonVO;

@Controller
public class BoardController {
	
	@Autowired
	ServletContext app; // 현재 프로젝트의 기본정보들을 저장하고 있는 클래스
	
	@Autowired
	HttpServletRequest request;
	
	BoardDAO board_dao;
	mainToonDAO mainToon_dao;
	c_BoardDAO c_board_dao;
	
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	public void setMainToon_dao(mainToonDAO mainToon_dao) {
		this.mainToon_dao = mainToon_dao;
	}
	public void setC_board_dao(c_BoardDAO c_board_dao) {
		this.c_board_dao = c_board_dao;
	}
	
	
	//메인화면 전체목록 조회
	@RequestMapping( value= {"/", "list.do", "mainToon.do"})
	public String list( Integer page, Model model ) {
		
		//list.do? ----------> null
		//list.do?page= -----> empty
		
		int nowPage= 1;
		
		if( page != null ) {
			nowPage = page;
		}
		
		//한 페이지에 표시되는 게시물의 시작번호와 끝번호를 계산
		int start = (nowPage - 1)*Common.BLOCKLIST + 1;
		int end = start + Common.BLOCKLIST - 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		//페이지별 목록 조회
		List<BoardVO> list = board_dao.selectList(map);
		
		//전체 게시물의 갯수 구하기
		int row_total = board_dao.getRowTotal();
		
		//위의 정보를 기반으로 하단의 페이지메뉴를 생성
		String pageMenu = Paging.getPaging("list.do", nowPage, row_total, Common.BLOCKLIST, Common.BLOCKPAGE);
		
		//list를 바인딩
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		
		//세션을 비운다
		HttpSession session = request.getSession();
		session.removeAttribute("s");
		
		//메인툰 전체조회 -----------------------------------------------------------------
		
		List<WebtoonVO> mt_list = mainToon_dao.selectList();
		model.addAttribute("mt_list",mt_list); //바인딩
				
		return Common.PATH + "board_list.jsp"; //포워딩		
			
		
	}
	
	@RequestMapping("/admin_form.do")
	public String admin_form() {	
		return Common.ADMIN_PATH + "admin_form.jsp";
	}
	
	//새 웹툰 올리기
	@RequestMapping("mainToon_insert.do")
	public String mainToon_insert(WebtoonVO vo, HttpServletRequest request) {
		

		
		// 클라이언트의 파일 업로드를 위한 절대경로를 생성
		
				String webPath = "/resources/upload/";
				String savePath = app.getRealPath(webPath);
				System.out.println("경로 : " + savePath);

				//에피소드까지의 경로를 위해서 webPath와 savePath 추가
				String epiPath = "/resources/";
				String saveEpiPath = app.getRealPath(epiPath);
				System.out.println(saveEpiPath);
				
				// 업로드를 위해 파라미터로 넘어온 사진의 정보
				MultipartFile photo = vo.getPhoto();

				String filename = "no_file";

				if (!photo.isEmpty()) {
					// 업로드가 된 실제 파일의 이름
					filename = photo.getOriginalFilename();

					//에피소드 디렉토리 생성및 경로 지정
					File saveEpiFile = new File(saveEpiPath,vo.getEpipath());
					if(!saveEpiFile.exists()) {
						saveEpiFile.mkdirs();
					}
					
					// 이미지를 저장할 경로를 지정
					File saveFile = new File(savePath, filename);
					if (!saveFile.exists()) {
						saveFile.mkdirs();
					} else {

						// 동일 파일명 변경
						long time = System.currentTimeMillis();
						filename = String.format("%d_%s", time, filename);
						saveFile = new File(savePath, filename);

					}

					try {
						photo.transferTo(saveFile);
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}

				vo.setFilename(filename);
		
		//DB에 새 웹툰을 추가하기 위해 DAO에게 vo를 전달
		int res = mainToon_dao.insert(vo);
		
		return "redirect:mainToon.do";
		
	}
	
	
	
	//새 게시판 글 작성을 위한 폼으로 화면 전환
	
	@RequestMapping("/insert_form.do")	
	public String insert_form() {
		return Common.PATH + "board_write.jsp";
	}
	
	//새 게시판 글 작성
	@RequestMapping("/insert.do")
	public String insert( BoardVO vo) {
		
		vo.setIp( request.getRemoteAddr());
		
		board_dao.insert(vo);
		
		return "redirect:mainToon.do";
		// 문서로 이동 후 새로고침
		
	}
	
	//게시글 상세보기
	@RequestMapping(value= {"/view.do","/reply.do"})
	public String view(Model model,int board_idx) {
		//view.do?idx = 10
		BoardVO vo = board_dao.selectOne(board_idx);
		
	//게시판 별 댓글 파트-----------------------------------
		
		List<c_BoardVO> cb_list = c_board_dao.selectList(board_idx);
		
		//cb_list 바인딩
		
		request.setAttribute("cb_list", cb_list);
		
		
	//	------------------------------------------------
		//폭발적인 조회수 증가를 방지하기 위해 session저장공간을 사용
		HttpSession session = request.getSession();
		
		String show = (String)session.getAttribute("s");
		if(show == null) {
		
			//조회 수 증가
			int res = board_dao.update_readhit(board_idx);
			session.setAttribute("s", "check");
			
		}
		
		model.addAttribute("vo",vo);
		return Common.PATH + "board_view.jsp";
		
	}
	//게시판 별 댓글 쓰기
	@RequestMapping("reply_insert.do")
	public String reply_insert( c_BoardVO vo) {
		
		vo.setIp( request.getRemoteAddr());
		
		c_board_dao.insert(vo);
		
		return "redirect:reply.do?board_idx="+vo.getRef();
		// 문서로 이동 후 새로고침
		
	}
	

	
	//글 삭제(된 것 처럼 업데이트)
		@RequestMapping("del")
		public String delete(int board_idx) {
			board_dao.delete(board_idx);
			

			return "redirect:mainToon.do";
			
		}
	

}
