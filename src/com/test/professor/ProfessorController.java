package com.test.professor;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProfessorController
{
	@Autowired 
	private SqlSession sqlSession;
	
	
	// 강사 정보 확인
	@RequestMapping(value = "/professor.action", method = RequestMethod.GET)
	public String ProfessorInfo(Model model)
	{
		// 일단 DAO.xml에 임의로 uniq_id_num 값을 넣어놨음
		IProfessorDAO dao = sqlSession.getMapper(IProfessorDAO.class);
		  
		model.addAttribute("read", dao.read());
		
		return "/WEB-INF/views/Professor_Read.jsp";
	}
	
	// insertform 이동
	@RequestMapping(value = "/professorinsertform.action", method = RequestMethod.GET)
	public String ProfessorInsertForm(Model model)
	{
		// insertform 으로 이동할 때 셀렉트 박스 값 가져가야함 
		// 나중에 추가
		
		// 이름값 미리 추가되어 있어야 해서 메소드로 값 넘김
		// uniq_id_num 은 session 에서 받아온 값으로 수정해야한다. 
		// 일단 고정값으로 넣어놨다.
		String uniq_id_num = "123123140";
		
		IProfessorDAO dao = sqlSession.getMapper(IProfessorDAO.class);
		model.addAttribute("name", dao.searchName(uniq_id_num));
		
		return "/WEB-INF/views/Professor_InsertForm.jsp";
	}
	
	// insert action
	@RequestMapping(value = "/professorinsert.action", method = RequestMethod.POST)
	public String ProfessorInsert(ProfessorDTO p)
	{
		IProfessorDAO dao = sqlSession.getMapper(IProfessorDAO.class);
		
		dao.add(p);
		
		return "redirect:professor.action";
	}
	
	// updateform 이동
	@RequestMapping(value = "/professorupdateform.action", method = RequestMethod.GET)
	public String ProfessorUpdateForm(Model model)
	{
		// 얘도 일단 고정값으로 넘겼다.
		String uniq_id_num = "123123140";
		
		IProfessorDAO dao = sqlSession.getMapper(IProfessorDAO.class);
		model.addAttribute("read", dao.read());
		model.addAttribute("name", dao.searchName(uniq_id_num));
		
		return "/WEB-INF/views/Professor_UpdateForm.jsp";
	}
	
	
	// update action
	@RequestMapping(value = "/professorupdate.action", method = RequestMethod.POST)
	public String ProfessorUpdate(ProfessorDTO p)
	{
		IProfessorDAO dao = sqlSession.getMapper(IProfessorDAO.class);
		dao.modify(p);
		
		return "redirect:professor.action";
	}
	
	
}










