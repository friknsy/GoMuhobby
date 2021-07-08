package com.test.qnaBoard;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnABoard_Reply_Controller
{
	@Autowired
	public SqlSession sqlSession;
	
	// 전체 게시물 조회
	@RequestMapping (value = "/qnaboardadmin.action", method = RequestMethod.GET)
	public String QnABoardList(Model model)
	{
		IQnABoard_Reply_DAO dao = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/views/QnABoard_List_Admin.jsp";
	}
	
	
	// 개별 게시물
	@RequestMapping(value = "/qnaboardreadadmin.action", method = RequestMethod.GET)
	public String QnABoardRead(HttpServletRequest request, Model model)
	{
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		IQnABoardDAO dao1 = sqlSession.getMapper(IQnABoardDAO.class);
		IQnABoard_Reply_DAO dao2 = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		
		model.addAttribute("read", dao1.read(qna_num));
		model.addAttribute("reply", dao2.reply(qna_num));
		
		return "/WEB-INF/views/QnABoard_Reply_Read.jsp";
	}
	
	// insertform
	@RequestMapping(value = "/qnaboardreplyinsertform.action", method = RequestMethod.GET)
	public String QnABoardInsertForm(HttpServletRequest request, Model model)
	{
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		model.addAttribute("qna_num", qna_num);
		
		
		return "/WEB-INF/views/QnABoard_Reply_InsertForm.jsp";
	}
	
	// insert action
	@RequestMapping(value = "/qnaboardreplyinsert.action", method = RequestMethod.POST)
	public String QnABoardInsert(/* HttpServletRequest request, Model model, */QnABoard_Reply_DTO r)
	{
		/* int qna_num = Integer.parseInt(request.getParameter("qna_num")); */
		
		IQnABoard_Reply_DAO dao = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		
		/* model.addAttribute("read", dao.read(qna_num)); */
		
		dao.add(r);
		
		return "redirect:qnaboardadmin.action";
	}
	
	// updateform
	@RequestMapping(value = "/qnaboardreplyupdateform.action", method = RequestMethod.GET)
	public String QnABoardUpdateForm(HttpServletRequest request, Model model)
	{
		int qna_num = Integer.parseInt(request.getParameter("qna_num")); 
		IQnABoard_Reply_DAO dao = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		  
		model.addAttribute("reply", dao.reply(qna_num));
		
		return "/WEB-INF/views/QnABoard_Reply_UpdateForm.jsp";
	}
	
	
	// update action
	@RequestMapping(value = "/qnaboardreplyupdate.action", method = RequestMethod.POST)
	public String QnABoardUpdate(QnABoard_Reply_DTO r)
	{
		String result = "";
		
		IQnABoard_Reply_DAO dao = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		
		dao.modify(r);
		
		/* result = "redirect:qnaboardreadadmin.action?qna_num=" + r.getQna_num(); */
		result = "redirect:qnaboardadmin.action";
		
		return result;
	}
	
	
	// delete
	@RequestMapping(value = "/qnaboardreplydelete.action", method = RequestMethod.GET)
	public String QnABoardDelete(HttpServletRequest request, Model model, QnABoard_Reply_DTO r)
	{
		/* int qna_num = Integer.parseInt(request.getParameter("qna_num")); */
		
		IQnABoard_Reply_DAO dao = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		
		/* model.addAttribute("read", dao.read(qna_num)); */
		
		dao.remove(r);
		
		return "redirect:qnaboardadmin.action";
	}
	
	
	
	
}
