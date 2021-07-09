package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class QA_answerController
{
	@Autowired
	private SqlSession sqlSession;
	
		
	
	
	// insertform
	@RequestMapping(value = "/qa_answerinsertform.action", method = RequestMethod.GET)
	public String QA_answerInsertForm(HttpServletRequest request, Model model)
	{
		int qa_forum_code = Integer.parseInt(request.getParameter("qa_forum_code"));
		
		model.addAttribute("qa_forum_code",qa_forum_code);
		
		return "/WEB-INF/views/QA_answerInsertForm.jsp";
	}
	
	// insert action
	@RequestMapping (value = "/qa_answerinsert.action", method = RequestMethod.POST)
	public String QA_answerInsert(QA_answerDTO a)
	{
		IQA_answerDAO dao = sqlSession.getMapper(IQA_answerDAO.class);
		
		dao.add(a);
		
		return "redirect:qa_forum.action";
	}
	
	
		// delete action
		@RequestMapping (value = "qa_answerdelete.action", method = RequestMethod.GET)
		public String QA_answerDelete(QA_answerDTO a)
		{
			
			IQA_answerDAO dao = sqlSession.getMapper(IQA_answerDAO.class);
			
			dao.remove(a);
			
			return "redirect:qa_forum.action";
			
		}
		
		
		
	
	
	
	
	
}
