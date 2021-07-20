package com.test.classopen;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.classmain.IClassDAO;
import com.test.professor.IProfessorDAO;


@Controller
public class ClassOpenController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 클래스 개설 페이지 1
	@RequestMapping(value = "/classopen1.action", method = RequestMethod.GET)
	public String ClassOpen1(Model model, HttpServletRequest request)
	{
		IClassOpenDAO dao = sqlSession.getMapper(IClassOpenDAO.class);
		
		HttpSession session = request.getSession();
		
		String uniqidnum = (String)session.getAttribute("uniqueId");
		String uniq_id_num = uniqidnum;
		
		if(uniq_id_num != null)
		{
			model.addAttribute("profinfo", dao.profinfo(uniq_id_num));
			return "/WEB-INF/views/9ClassOpen1.jsp";
		}
		else
		{
			return "/WEB-INF/views/3mainpage.jsp";
		}
	}
	
	// 클래스 개설 페이지 2
	@RequestMapping(value = "/classopen2.action", method = RequestMethod.GET)
	public String ClassOpen2(HttpServletResponse response, HttpServletRequest request)
	{	
		HttpSession session = request.getSession();
		
		String c_prof_info = request.getParameter("c_prof_info");
		System.out.println(c_prof_info);
		session.setAttribute("c_prof_info", c_prof_info);
		
		return "/WEB-INF/views/9ClassOpen2.jsp";
	}
	
	// 클래스 개설 페이지 3
	@RequestMapping(value = "/classopen3.action", method = RequestMethod.GET)
	public String ClassOpen3(Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		
		return "/WEB-INF/views/9ClassOpen3.jsp";
	}
}
