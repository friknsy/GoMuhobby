package com.test.classmain;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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
	
	// 원데이 클래스 상세
	@RequestMapping(value = "/onedayclassinfo.action", method = RequestMethod.GET)
	public String Onedayclass(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		return "/WEB-INF/views/onedayclassinfo.jsp";
	}
}
