package com.ineat.oxo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.FileDAO;
import com.ineat.oxo.dao.StoryBoardDAO;
import com.ineat.oxo.services.FileService;
import com.ineat.oxo.vo.StoryBoardVO;

/**
 * 이 클래스는 storyboard 컨트롤러입니다.
 * @author	이태성
 * @since	2019.12.31
 * @version	v.1.0
 * @see		2019.12.31 - 클래스 제작 - 담당자: 이태성
 *
 */
@Controller
@RequestMapping("/storyboard/")
public class StoryBoard {
	@Autowired
	StoryBoardDAO sbDAO;
	
	@Autowired
	FileDAO fDAO;
	
	@Autowired
	FileService fileSrvc;
	
	// sb 출력
	@RequestMapping("storyBoard.eat")
	public ModelAndView storyBoard(ModelAndView mv, HttpSession session) {
		List<StoryBoardVO> list = sbDAO.storyBoard();
		mv.addObject("LIST", list);
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
		System.out.println("*storyBoard.eat sid: " + sid);
		return mv;
	}

	// sbinfo 출력
	@RequestMapping("storyBoardInfo.eat")
	public ModelAndView storyBoardInfo(ModelAndView mv, HttpSession session, StoryBoardVO sbVO, int bno) {
		sbVO = sbDAO.storyBoardInfo(bno);
		session.setAttribute("SBNO", bno);
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
		System.out.println("*storyBoardInfo.eat sid: " + sid);
		
		mv.addObject("mid", sbVO.getMid());
		mv.addObject("title", sbVO.getTitle());
		mv.addObject("content", sbVO.getContent());
		mv.addObject("sbDate", sbVO.getSbDate());
		mv.addObject("views", sbVO.getViews());
		mv.addObject("saveName", sbVO.getSaveName());
		mv.addObject("llike", sbVO.getLlike());
		mv.addObject("hhate", sbVO.getHhate());
		
		
		return mv;
	}
	
	// sbwrite 출력
	@RequestMapping("storyBoardWrite.eat")
	public ModelAndView storyBoardWrite(ModelAndView mv, HttpSession session) {
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
		System.out.println("*storyBoardWrite.eat sid: " + sid);
		
		return mv;
	}
	
	// sbwrite 처리
	@RequestMapping("storyBoardWriteProc.eat")
	public ModelAndView storyBoardWriteProc(ModelAndView mv, RedirectView rv, HttpSession session, StoryBoardVO sbVO) {
		System.out.println("##sbVO.toString()\n " + sbVO.toString());
		
		int cnt = sbDAO.storyBoardWriteProc(sbVO);
		
		// 업로드 할 파일 유무 확인
		if(cnt == 1 && sbVO.getsFile().getOriginalFilename() != "") {
			session.setAttribute("mid", sbVO.getMid());
			fileSrvc.setDAO(fDAO);
			fileSrvc.sbFileAddProc(session, sbVO);
			System.out.println("##sbVO.toString()\n " + sbVO.toString());
			rv.setUrl("/oxo/storyboard/storyBoard.eat");
		}else if(cnt == 1) {
			rv.setUrl("/oxo/storyboard/storyBoard.eat");
		}else {
			rv.setUrl("/oxo/storyboard/storyBoardWrite.eat");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	// 좋아요 처리
	@RequestMapping("sbLike.eat")
	public ModelAndView sbLike(ModelAndView mv, HttpSession session, StoryBoardVO sbVO) {
		System.out.println(sbVO.getBno());
		
		// 데이터가 있는지 먼저 확인
		int cnt = sbDAO.sbLike(sbVO);
		
		if(cnt == 1) {
			System.out.println("이미 좋아요를 눌렀습니다.");
			sbDAO.sbLikeU(sbVO);
			
			
		}else {
			int cnt2 = sbDAO.sbLikeHC(sbVO);
			
			if(cnt2 == 1) {
				System.out.println("이미 싫어요를 눌렀습니다.");
				
			
			}else {
				int cnt3 = sbDAO.sbLikeZC(sbVO);
				
				if(cnt3 == 1) {
					System.out.println("이미 Z값이 있습니다.");
					sbDAO.sbLikeU2(sbVO);
					
				}else {
					System.out.println("좋아요를 눌러도 좋습니다.");
					sbDAO.sbLike2(sbVO);
					
				}
				
			}
		}
		
		mv.setViewName("storyboard/storyBoardInfo");
		return mv;
	}
}
