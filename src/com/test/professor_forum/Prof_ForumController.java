package com.test.professor_forum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	// 해당 커뮤니티의 전체 게시글 리스트 불러오기
	
	@RequestMapping(value = "/professorforum.action", method = RequestMethod.GET)
	public String profForumList(Model model, HttpServletRequest request)
	{
		IProf_ForumDAO dao1 = sqlSession.getMapper(IProf_ForumDAO.class);
		IProf_Forum_ReplyDAO dao2 = sqlSession.getMapper(IProf_Forum_ReplyDAO.class);
		
		// 로그인 되어있는 세션값 받아오기
		// 일단 이렇게 해놨는데 유어페이지로 들어가는 경우에는
		// 본인 고유식별번호가 아닌 유어페이지 회원의 고유식별번호를 얻어내야함
		HttpSession session = request.getSession();
		
		String uniq_id_num = (String)session.getAttribute("uniqueId");
		String p_comm_code = dao1.getNum(uniq_id_num);
		
		model.addAttribute("p_comm_code", p_comm_code);
		model.addAttribute("list", dao1.list(p_comm_code));
		model.addAttribute("count", dao1.count(p_comm_code));
		
		// 댓글 리스트
		model.addAttribute("commentList", dao2.list());
		
		
		return "/WEB-INF/views/Prof_Forum_List.jsp";
	}
	
	
	// insertform 이동
	@RequestMapping(value = "/professorforuminsertform.action", method = RequestMethod.GET)
	public String profForumInsertForm(Model model , HttpServletRequest request )
	{
		String p_comm_code = request.getParameter("p_comm_code");
		
		model.addAttribute("p_comm_code", p_comm_code);
		
		return "/WEB-INF/views/Prof_Forum_InsertForm.jsp";
	}
	
	// insert
	@RequestMapping(value = "/professorforuminsert.action", method = RequestMethod.POST)
	public String profForumInsert(Prof_ForumDTO f)
	{
		IProf_ForumDAO dao = sqlSession.getMapper(IProf_ForumDAO.class);
		
		dao.add(f);
		
		return "redirect:professorforum.action";
	}
	
	
	// updateform 이동
	@RequestMapping(value = "/professorforumupdateform.action", method = RequestMethod.GET)
	public String profForumUpdateForm(Model model, HttpServletRequest request)
	{
		IProf_ForumDAO dao = sqlSession.getMapper(IProf_ForumDAO.class);
		String p_forum_num = request.getParameter("p_forum_num");
		
		model.addAttribute("p_forum_num", p_forum_num);
		model.addAttribute("read", dao.read(p_forum_num));
		
		return "/WEB-INF/views/Prof_Forum_UpdateForm.jsp";
	}
	
	
	// update
	@RequestMapping(value = "/professorforumupdate.action", method = RequestMethod.POST)
	public String profForumUpdate(Model model, Prof_ForumDTO f)
	{
		IProf_ForumDAO dao = sqlSession.getMapper(IProf_ForumDAO.class);
		
		dao.modify(f);
		
		return "redirect:professorforum.action";
	}
	
	// delete
	@RequestMapping(value = "/professorforumdelete.action", method = RequestMethod.GET)
	public String profForumDelete(Model model, HttpServletRequest request)
	{
		IProf_ForumDAO dao = sqlSession.getMapper(IProf_ForumDAO.class);
		
		String p_forum_num = request.getParameter("p_forum_num");
		
		dao.remove(p_forum_num);
		
		return "redirect:professorforum.action";
	}
	
}
