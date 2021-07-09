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
}
