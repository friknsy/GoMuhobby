package com.test.qnaBoard;

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
public class QnABoardController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 해당 회원이 작성한 전체 게시물
	@RequestMapping(value = "/qnaboard.action", method = RequestMethod.GET)
	public String QnABoardList(Model model, HttpServletRequest request)
	{
		String result = "";
		
		HttpSession session = request.getSession();
		
		/* System.out.println(session); org.apache.catalina.session.StandardSessionFacade@1d75102c 
		 * session.setAttribute("uniqueId", uniqueId); */

		String uniqidnum = (String)session.getAttribute("uniqueId");
		
		IQnABoardDAO dao = sqlSession.getMapper(IQnABoardDAO.class);
		
		model.addAttribute("list", dao.list(uniqidnum));
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/views/QnABoard_List.jsp";
		return result;
	}
	
	// 개별 게시물
	@RequestMapping(value = "/qnaboardread.action", method = RequestMethod.GET)
	public String QnABoardRead(HttpServletRequest request, Model model)
	{
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		IQnABoardDAO dao1 = sqlSession.getMapper(IQnABoardDAO.class);
		IQnABoard_Reply_DAO dao2 = sqlSession.getMapper(IQnABoard_Reply_DAO.class);
		
		model.addAttribute("read", dao1.read(qna_num));
		model.addAttribute("reply", dao2.reply(qna_num));
		
		return "/WEB-INF/views/QnABoard_Read.jsp";
	}
	
	
	// insertform 이동
	@RequestMapping(value = "/qnaboardinsertform.action", method = RequestMethod.GET)
	public String QnABoardInsertForm(Model model)
	{
		IQnABoardDAO dao = sqlSession.getMapper(IQnABoardDAO.class);
		model.addAttribute("grouplist", dao.grouplist());
		
		return "/WEB-INF/views/QnABoard_InsertForm.jsp";
	}
	
	// insert action
	@RequestMapping (value = "/qnaboardinsert.action", method = RequestMethod.POST)
	public String QnABoardInsert(QnaBoardDTO q)
	{
		IQnABoardDAO dao = sqlSession.getMapper(IQnABoardDAO.class);
		
		dao.add(q);
		
		return "redirect:qnaboard.action";
	}
	
	// updateform 이동
	@RequestMapping (value = "/qnaboardupdateform.action", method = RequestMethod.GET)
	public String QnABoardUpdateForm(HttpServletRequest request,  Model model) 
	{	
		int qna_num = Integer.parseInt(request.getParameter("qna_num")); 
		IQnABoardDAO dao = sqlSession.getMapper(IQnABoardDAO.class);
		  
		model.addAttribute("read", dao.read(qna_num));
		model.addAttribute("grouplist", dao.grouplist());
		 
		return "/WEB-INF/views/QnABoard_UpdateForm.jsp";
	}
	
	// update action
	@RequestMapping (value = "/qnaboardupdate.action", method = RequestMethod.POST)
	public String QnABoardUpdate(QnaBoardDTO q)
	{
		String result = "";
				
		IQnABoardDAO dao = sqlSession.getMapper(IQnABoardDAO.class);
		
		dao.modify(q);
		
		result = "redirect:qnaboardread.action?qna_num=" + q.getQna_num();
		
		return result;
	}
	
	
	// delete action
	@RequestMapping (value = "qnaboarddelete.action", method = RequestMethod.GET)
	public String QnABoardDelete(QnaBoardDTO q)
	{
		
		IQnABoardDAO dao = sqlSession.getMapper(IQnABoardDAO.class);
		
		dao.remove(q);
		
		return "redirect:qnaboard.action";
		
	}
	
	
}
