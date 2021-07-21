package com.test.classmain;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.classDetail.IClassinfoDAO;


@Controller
public class ClassController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 원데이클래스 메인페이지
	@RequestMapping(value = "/classmain.action", method = RequestMethod.GET)
	public String ClassMainList(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		model.addAttribute("list", dao.listNew());
		System.out.println(dao.listNew());
		
		return "/WEB-INF/views/ClassMain.jsp";

	}
	
	// 원데이클래스 전체
	@RequestMapping(value = "/classall.action", method = RequestMethod.GET)
	public String ClassAllList(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		model.addAttribute("list", dao.listAll());
		System.out.println(dao.listAll());
		
		return "/WEB-INF/views/ClassAll.jsp";
		
	}
	
	// 원데이클래스 추천 지역
	@RequestMapping(value = "/classregion.action", method = RequestMethod.GET)
	public String ClassRegionList(Model model, HttpServletRequest request)
	{
		String uniq_id_num = request.getParameter("uniq_id_num");
		
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		model.addAttribute("list", dao.listRegion(uniq_id_num));
		//System.out.println(dao.listRegion(uniq_id_num));
		
		return "/WEB-INF/views/ClassRegion.jsp";
		
	}
	
	// 원데이클래스 추천 음악
	@RequestMapping(value = "/classmusic.action", method = RequestMethod.GET)
	public String ClassMusicList(Model model, HttpServletRequest request)
	{
		String uniq_id_num = request.getParameter("uniq_id_num");
		
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		model.addAttribute("list", dao.listMusic(uniq_id_num));
		//System.out.println(dao.listMusic(uniq_id_num));
		
		return "/WEB-INF/views/ClassMusic.jsp";
		
	}
	
	/*
	// 클래스 개설 페이지 1
	@RequestMapping(value = "/classopen1.action", method = RequestMethod.GET)
	public String ClassOpen1(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		return "/WEB-INF/views/9ClassOpen1.jsp";
	}
	
	// 클래스 개설 페이지 2
	@RequestMapping(value = "/classopen2.action", method = RequestMethod.GET)
	public String ClassOpen2(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		return "/WEB-INF/views/9ClassOpen2.jsp";
	}
	
	// 클래스 개설 페이지 3
	@RequestMapping(value = "/classopen3.action", method = RequestMethod.GET)
	public String ClassOpen3(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		return "/WEB-INF/views/9ClassOpen3.jsp";
	}
	*/

	
	// 원데이 클래스 상세
	@RequestMapping(value = "/onedayclassinfo.action", method = RequestMethod.GET)
	public String Onedayclass(HttpServletRequest request, Model model)
	{
		String c_info_num = request.getParameter("c_info_num");
		//값을 받는 대신 임의로 넘겨준 번호 6
		//String c_info_num="6";
		IClassinfoDAO dao = sqlSession.getMapper(IClassinfoDAO.class);
		model.addAttribute("classinfo",dao.classDetail(c_info_num)); //클래스 상세 정보들
		model.addAttribute("catIntro", dao.getCatandIntroduction(c_info_num)); //클래스음악카테고리와 강사소개글
		model.addAttribute("totalClasses", dao.getTotalClasses(c_info_num));
		model.addAttribute("classTimes", dao.getClassDates(c_info_num));
		model.addAttribute("totalReviews", dao.getTotalReviews(c_info_num));
		model.addAttribute("reviews",dao.getReviews(c_info_num));
		model.addAttribute("cvs",dao.getCV(c_info_num));
		model.addAttribute("profPhoto", dao.getProfPhoto(c_info_num));
		model.addAttribute("starAvg", dao.getStarAvg(c_info_num));
		model.addAttribute("QnAs",dao.getQnA(c_info_num));
		return "/WEB-INF/views/onedayclassinfo.jsp";
	}
}
