package com.test.professor_forum;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Prof_ForumController
{
	@Autowired 
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/professorforum.action", method = RequestMethod.GET)
	public String ProfForumList(Model model)
	{
		return "/WEB-INF/views/Prof_Forum_List.jsp";
	}
}
