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

	
	// 원데이 클래스 상세
	@RequestMapping(value = "/onedayclassinfo.action", method = RequestMethod.GET)
	public String Onedayclass(HttpServletRequest request, Model model)
	{
		//String c_info_num = request.getParameter("c_info_num");
		//값을 받는 대신 임의로 넘겨준 번호 6
		String c_info_num="6";
		IClassinfoDAO dao = sqlSession.getMapper(IClassinfoDAO.class);
		model.addAttribute("classinfo",dao.classDetail(c_info_num));
		return "/WEB-INF/views/onedayclassinfo.jsp";
	}
}
