package com.korea.webtoon;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.WebtoonDAO;
import util.Common;
import vo.EpisodeVO;
import vo.WebtoonVO;

@Controller
public class WebtoonController {
	WebtoonDAO webtoon_DAO;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext app;
	
	@Autowired
	HttpSession login;

	public void setWebtoon_DAO(WebtoonDAO webtoon_DAO) {
		this.webtoon_DAO = webtoon_DAO;
	}
	
	//웹툰 회차 선택 화면
	@RequestMapping("/show")
	public String showEpi(Model model, int idx) {
		model.addAttribute("vo", webtoon_DAO.selectOne(idx));
		model.addAttribute("epi",webtoon_DAO.selectEpi(idx));
		return Common.SHOW_PATH+"show_page.jsp";
	}
	
	
	//회차 선택후 보여주는 화면
	@RequestMapping("/Epi")
	public String Epiindex(Model model,int episode_idx) {
		EpisodeVO epi = webtoon_DAO.selectOne1(episode_idx);
		model.addAttribute("epi",epi);
		
		String webPath = "/resources/"+epi.getPath()+"/"+epi.getEpisodename();
		String savePath = app.getRealPath(webPath);//절대경로
		
		
		//파일 갯수를 확인하기 위해서
		File saved = new File(savePath);
		int cnt = saved.listFiles().length;
			
		model.addAttribute("cnt", cnt);
		return Common.SHOW_PATH+"epi_index.jsp";
	}
	
	@RequestMapping("/addEpi_form")
	public String addEpi_form(Model model, int episode_idx) {
		model.addAttribute("ref", episode_idx);
		return Common.ADMIN_PATH+"admin_addEpi_form.jsp";
	}
	
	@RequestMapping("/addEpi.do")
	public String addEpi(EpisodeVO vo,MultipartHttpServletRequest mRequest) {
		int ref = vo.getRef();
		
		
		//외래키로 참조받는 WebtoonVO를 base_vo로 선언,
		//해당 웹툰 파일을 정리를 위해 생성한 경로를 getEpipath 메소드를 통해서 EpisodeVO에 set한다. 
		WebtoonVO base_vo = webtoon_DAO.selectOne_ref(ref);
		vo.setPath(base_vo.getEpipath());
		
		
		//에피소드까지의 경로를 위해서 webPath와 savePath 추가
		String photoPath = "/resources/"+base_vo.getEpipath()+"/"+vo.getEpisodename()+"/";
		String savephotoPath = app.getRealPath(photoPath);
		System.out.println(savephotoPath);
		
		File saveEpiFile = new File(savephotoPath);
		if(!saveEpiFile.exists()) {
			saveEpiFile.mkdirs();
		}
		
		
		// 업로드를 위해 파라미터로 넘어온 사진의 정보 
		 List<MultipartFile> photoList = mRequest.getFiles("photo");
		 String src = mRequest.getParameter("src");
		
		 for(MultipartFile mf : photoList) {
			 String originFileName=mf.getOriginalFilename();
			 
			 String safeFile=savephotoPath+originFileName;
			 
			 try {
	             mf.transferTo(new File(safeFile));
	         } catch (IllegalStateException e) {
	             // TODO Auto-generated catch block
	             e.printStackTrace();
	         } catch (IOException e) {
	             // TODO Auto-generated catch block
	             e.printStackTrace();
	         }
		 }
		webtoon_DAO.updateStep(ref);
		//입력받은 EpisodeVO를 매퍼를 통해 insert
		webtoon_DAO.insert(vo);
		
		return "redirect:show?idx="+ref;
	}
	
	
	

}
