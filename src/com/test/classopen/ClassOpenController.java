package com.test.classopen;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.classDetail.IClassinfoDAO;
import com.test.classmain.IClassDAO;
import com.test.register.IUserDAO;

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
		
		String c_title = request.getParameter("c_title");
		session.setAttribute("c_title", c_title);
		
		String music_cat_code = request.getParameter("music_cat_code");
		session.setAttribute("music_cat_code", music_cat_code);
		
		String c_photo = request.getParameter("c_photo");
		session.setAttribute("c_photo", c_photo);
		
		String c_detail_info = request.getParameter("c_detail_info");
		session.setAttribute("c_detail_info", c_detail_info);
		
		String c_video = request.getParameter("c_video");
		session.setAttribute("c_video", c_video);
		
		String c_addr = request.getParameter("c_addr");
		session.setAttribute("c_addr", c_addr);
		
		String c_detail_info2 = request.getParameter("c_detail_info2");
		session.setAttribute("c_detail_info2", c_detail_info2);
		
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
	public String ClassOpen2(HttpServletResponse response, HttpServletRequest request, ModelMap model)
	{	
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		IClassOpenDAO dao1 = sqlSession.getMapper(IClassOpenDAO.class);
		
		HttpSession session = request.getSession();
		
		model.addAttribute("musiccat", dao.musiccat());
		model.addAttribute("cvlist",dao1.cvlist());
		
		String c_prof_info = request.getParameter("c_prof_info");
		session.setAttribute("c_prof_info", c_prof_info);
		
		return "/WEB-INF/views/9ClassOpen2.jsp";
	}
	
	// 클래스 개설 페이지 3
	@RequestMapping(value = "/classopen3.action", method = RequestMethod.GET)
	public String ClassOpen3(HttpServletRequest request, Model model)
	{
		IClassDAO dao = sqlSession.getMapper(IClassDAO.class);
		IClassOpenDAO dao1 = sqlSession.getMapper(IClassOpenDAO.class);
		HttpSession session = request.getSession();
		
		String uniqidnum = (String)session.getAttribute("uniqueId");
		String uniq_id_num = uniqidnum;
		
		String c_title = request.getParameter("c_title");
		session.setAttribute("c_title", c_title);
		
		String music_cat_code = request.getParameter("music_cat_code");
		session.setAttribute("music_cat_code", music_cat_code);
		
		String c_photo = request.getParameter("c_photo");
		session.setAttribute("c_photo", c_photo);
		
		String c_detail_info = request.getParameter("c_detail_info");
		session.setAttribute("c_detail_info", c_detail_info);
		
		String c_video = request.getParameter("c_video");
		session.setAttribute("c_video", c_video);
		
		String c_addr = request.getParameter("c_addr");
		session.setAttribute("c_addr", c_addr);
		
		String c_detail_info2 = request.getParameter("c_detail_info2");
		session.setAttribute("c_detail_info2", c_detail_info2);
		
		String[] city = c_addr.split(" ");
		
		// 읍면동 ( 읍면동 코드로 넣어줘야 함 )
		c_addr = city[1];
		String town_name = c_addr;
		
		String membergrade = dao1.membergrade(uniq_id_num);
		
		if(membergrade.equals("브론즈"))
			request.setAttribute("membergrade", "bronze");
		
		else if (membergrade.equals("실버"))
			request.setAttribute("membergrade", "silver");
		
		else
			request.setAttribute("membergrade", "gold");
		
		// 읍면동 코드 출력
		// System.out.println(dao1.towncode(town_name));
		
		return "/WEB-INF/views/9ClassOpen3.jsp";
	}
	
	@RequestMapping(value = "/profgrade.action", method = RequestMethod.GET)
	public String profgrade(HttpServletRequest request, Model model)
	{
		return "/WEB-INF/views/prof_grade.jsp";
	}
	
	@RequestMapping(value = "/ClassOpenComplete.action", method = RequestMethod.GET)
	public String ClassOpenComplete(HttpServletRequest request, Model model)
	{
		return "";
	}
}
