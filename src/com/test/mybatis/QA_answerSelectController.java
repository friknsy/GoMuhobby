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
public class QA_answerSelectController
{
	@Autowired
	private SqlSession sqlSession;
	
		
	
	
	// insert action
		@RequestMapping (value = "qa_answerselectinsert.action", method = RequestMethod.GET)
		public String QA_answerInsert(QA_answerSelectDTO s)
		{
			
			IQA_answerSelectDAO dao = sqlSession.getMapper(IQA_answerSelectDAO.class);
				
				dao.add(s);
				
			return "redirect:qa_forum.action";
				
		}
	
	
		// delete action
		@RequestMapping (value = "qa_answerselectdelete.action", method = RequestMethod.GET)
		public String QA_answerSelectDelete(QA_answerSelectDTO s)
		{
			
			IQA_answerSelectDAO dao = sqlSession.getMapper(IQA_answerSelectDAO.class);
			
			dao.remove(s);
			
			return "redirect:qa_forum.action";
			
		}
		
		
		
	
	
	
	
	
}
