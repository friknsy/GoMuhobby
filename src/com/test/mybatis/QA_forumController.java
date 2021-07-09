package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QA_forumController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 게시물
	@RequestMapping(value = "/qa_forum.action", method = RequestMethod.GET)
	public String QA_forumList(Model model)
	{
		String result = "";
		
		IQA_forumDAO dao = sqlSession.getMapper(IQA_forumDAO.class);
			
		model.addAttribute("qlist", dao.qlist());
		
		result = "/WEB-INF/views/QA_forumList.jsp";
		return result;
	}
	
	// 특정 게시물
	// 조회수 증가 추가 
	@RequestMapping(value = "/qa_forumread.action", method = RequestMethod.GET)
	public String QA_forumRead(HttpServletRequest request, Model model)
	{
		String qa_forum_code = request.getParameter("qa_forum_code");
				
		
		HttpSession session = request.getSession();
		
		IQA_forumDAO dao1 = sqlSession.getMapper(IQA_forumDAO.class);
		IQA_answerDAO dao2 = sqlSession.getMapper(IQA_answerDAO.class);
		IQA_answerSelectDAO dao3 =sqlSession.getMapper(IQA_answerSelectDAO.class);
		
		/* 주의 */ int Test = Integer.parseInt(qa_forum_code);
		
		dao1.updateHit(qa_forum_code);
		/* dao2.answercheck(qa_answ_code); */
		
		model.addAttribute("qread", dao1.qread(qa_forum_code));
		model.addAttribute("read", dao2.read(qa_forum_code));
		

		String result = dao1.forumcheck(qa_forum_code);		
		
		if(result != null)
		{
			session.setAttribute("forumcheck", result + "");
		}
		
		// 채택된 답변이 있는 지 확인 -> count(selectcode>0)인 것을 받아온다. 
		model.addAttribute("select",dao3.select(Test));
		
		// 답변이 없는 경우 등록된 답변이 없다고 출력해주기
		model.addAttribute("count", dao2.count(Test));
		
		return "/WEB-INF/views/QA_forumRead.jsp";
	}
	
	
	
	// insertform 이동
	@RequestMapping(value = "/qa_foruminsertform.action", method = RequestMethod.GET)
	public String QA_forumInsertForm(Model model)
	{
		
		return "/WEB-INF/views/QA_forumInsertForm.jsp";
	}
	
	// insert action
	@RequestMapping (value = "/qa_foruminsert.action", method = RequestMethod.POST)
	public String QA_forumInsert(QA_forumDTO q)
	{
		IQA_forumDAO dao = sqlSession.getMapper(IQA_forumDAO.class);
		
		dao.qadd(q);
		
		return "redirect:qa_forum.action";
	}
	
	// updateform 이동
		@RequestMapping (value = "/qa_forumupdateform.action", method = RequestMethod.GET)
		public String QA_forumUpdateForm( HttpServletRequest request,  Model model)
		{
			
			String qa_forum_code =request.getParameter("qa_forum_code"); 
			
			IQA_forumDAO dao = sqlSession.getMapper(IQA_forumDAO.class);
			  
			model.addAttribute("qread", dao.qread(qa_forum_code));
			 
			return "/WEB-INF/views/QA_forumUpdateForm.jsp";
		}
		
		// update action
		@RequestMapping (value = "/qa_forumupdate.action", method = RequestMethod.POST)
		public String QA_forumUpdate(QA_forumDTO q)
		{
			String result = "";
					
			IQA_forumDAO dao = sqlSession.getMapper(IQA_forumDAO.class);
			
			dao.qmodify(q);
			
			result = "redirect:qa_forumread.action?qa_forum_code=" + q.getQa_forum_code();
			
			return result;
		}
		
		
		// delete action
		@RequestMapping (value = "qa_forumdelete.action", method = RequestMethod.GET)
		public String QA_forumDelete(QA_forumDTO q)
		{
			
			IQA_forumDAO dao = sqlSession.getMapper(IQA_forumDAO.class);
			
			dao.qremove(q);
			
			return "redirect:qa_forum.action";
			
		}
		
		// bookmark action
		@RequestMapping (value = "qa_bookmark.action", method = RequestMethod.GET)
		public String QA_Bookmark(QA_forumDTO q)
		{
			
			IQA_forumDAO dao = sqlSession.getMapper(IQA_forumDAO.class);
			
			dao.qbkm(q);
			
			return "redirect:qa_forum.action";
			
		}
	
		
	
	
	
	
	
}
