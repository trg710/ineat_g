package com.ineat.oxo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.FileDAO;
import com.ineat.oxo.dao.ReviewDAO;
import com.ineat.oxo.services.FileService;
import com.ineat.oxo.vo.FileVO;
import com.ineat.oxo.vo.ReviewVO;

/**
 * 이 클래스는 리뷰관련 컨트롤러 입니다.
 * 
 * @author 박송림
 * @since  2019.12.30
 * @version v.1.0
 * 
 * 			변경이력
 * 				2019.12.30	-	클래스 제작		-	담당자 : 박송림
 *
 */

@Controller
@RequestMapping("/ineatlist/review")
public class Review {
	@Autowired
	ReviewDAO rvDAO;
	@Autowired
	FileService fileSrvc;
	@Autowired
	FileDAO fDAO;
	
	@RequestMapping("reviewform.eat")
	public ModelAndView reviewform(ModelAndView mv, int ml_no) {
		mv.addObject("MLNO", ml_no);
		mv.setViewName("ineatlist/review/addreview");
		return mv;
	}
	
	@RequestMapping("addreview.eat")
	public ModelAndView addreview(ModelAndView mv, RedirectView rv, HttpSession session, ReviewVO rvVO) {
		MultipartFile[] sfile =rvVO.getSfile();
		rvVO.setM_id((String)session.getAttribute("SID"));
		Double score = Double.parseDouble(rvVO.getS_score());
		rvVO.setRv_score(score);
		rvDAO.addreview(rvVO);

		System.out.println(sfile);
		if(sfile != null) {
			String[] savename = fileSrvc.uploadProc(session, sfile);
			fDAO.rvFileaddProc(rvVO, savename);
		}
		rvVO.getRv_mlno();
		
		rv.setUrl("/oxo/ineatlist/info.eat?ml_no="+rvVO.getRv_mlno());
		mv.setView(rv);
		return mv;
	}
}
