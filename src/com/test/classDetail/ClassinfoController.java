package com.test.classDetail;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.classmain.IClassDAO;

@Controller
public class ClassinfoController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 클래스 질문 답변 팝업 띄우기
	@RequestMapping(value = "/answerInsertPopup.action", method = RequestMethod.GET)
	public String answerInsertPopup(HttpServletRequest request, Model model)
	{
		
		model.addAttribute("c_qa_num",request.getParameter("c_qa_num"));
		return "/WEB-INF/views/ClassAnswerInsertPopup.jsp";
		
	}
	
	// 클래스 질문에 답변 등록
	@RequestMapping(value = "/classanswerinsert.action", method = RequestMethod.POST)
	public String classAnswerInsert(ClassinfoDTO dto)
	{
		IClassinfoDAO dao = sqlSession.getMapper(IClassinfoDAO.class);
		dao.classQnaInsert(dto);		
		return "windowclose.jsp";
	}
	
	//클래스 질문 답변 수정 팝업 띄우기
	@RequestMapping(value = "/answerUpdatePopup.action", method = RequestMethod.GET)
	public String answerUpdatePopup(HttpServletRequest request, Model model)
	{
		model.addAttribute("p_answ_num",request.getParameter("p_answ_num"));
		return "/WEB-INF/views/ClassAnswerUpdatePopup.jsp";
		
	}
	
	// 답변 수정하기
	@RequestMapping(value = "/classanswerupdate.action", method = RequestMethod.POST)
	public String classAnswerUpdate(ClassinfoDTO dto)
	{
		IClassinfoDAO dao = sqlSession.getMapper(IClassinfoDAO.class);
		dao.classQnaUpdate(dto);
		return "windowclose.jsp";
	}
	
	// 답변 삭제하기
	@RequestMapping(value = "/answerdelete.action", method = RequestMethod.GET)
	public String classAnswerDelete(HttpServletRequest request)
	{
		IClassinfoDAO dao = sqlSession.getMapper(IClassinfoDAO.class);
		String p_answ_num = request.getParameter("p_answ_num");
		dao.classQnaDelete(p_answ_num);
		return "redirect:onedayclassinfo.action";
	}
	
	//
	@RequestMapping(value = "/classquestioninsert.action", method = RequestMethod.POST)
	public String classQuestionInsert(ClassinfoDTO dto)
	{
		IClassinfoDAO dao = sqlSession.getMapper(IClassinfoDAO.class);
		dao.classQuestionInsert(dto);
		return "redirect:onedayclassinfo.action";
	}
	
	
	
	
}
