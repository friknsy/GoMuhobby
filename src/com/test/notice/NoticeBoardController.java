//MemberMain.java
// - 컨트롤러


package com.test.notice;



import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;




@Controller
public class NoticeBoardController
{
	// mybatis 객체 의존성(자동) 주입!!!!
	@Autowired
	private SqlSession sqlSession;
	
	// memberlist.action 요청이 들어오면 처리하도록

	@RequestMapping(value = "/noticeboardlist.action", method = RequestMethod.GET)
	public String main(Model model)
	{
		
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		model.addAttribute("list",dao.noticeList());
		model.addAttribute("noticeCat",dao.getNoticeCat());  //getNotice 메소드에 mapper 클래스에서 쿼리문 연결해놨고 그걸로 데이터를 가져온다. 가져오는건 dto형식
	
		return "/WEB-INF/views/NoticeBoardList.jsp";
		
	}
	
	@RequestMapping(value = "/noticeboardinsertform.action", method = RequestMethod.GET)
	public String goInsertForm(Model model)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		model.addAttribute("noticeCat",dao.getNoticeCat());
		return "/WEB-INF/views/NoticeBoardInsertForm.jsp";
		
	}
	
	@RequestMapping(value = "/noticeinsert.action", method = RequestMethod.POST)
	public String noticeInsert(NoticeBoardDTO dto)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		dao.addNotice(dto);
		return "redirect:noticeboardlist.action";
	}
	
	
	@RequestMapping(value = "/noticeselect.action", method = RequestMethod.GET)
	public String noticeSelect(HttpServletRequest request, Model model)
	{
		
		String ntc_num = request.getParameter("ntc_num");
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		dao.hitNotice(ntc_num);
		model.addAttribute("notice",dao.selectNotice(ntc_num));
		
		return "/WEB-INF/views/NoticeBoardView.jsp";
	}
	
	@RequestMapping(value = "/noticeboarddelete.action", method = RequestMethod.GET)
	public String noticeDelete(HttpServletRequest request)
	{
		String ntc_num = request.getParameter("ntc_num");
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		dao.deleteNotice(ntc_num);
		return "redirect:noticeboardlist.action";
	}
	
	@RequestMapping(value = "/noticeboardupdateform.action", method = RequestMethod.GET)
	public String noticeUpdateForm(HttpServletRequest request, Model model)
	{
		String ntc_num = request.getParameter("ntc_num");
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		model.addAttribute("noticeCat",dao.getNoticeCat());
		model.addAttribute("notice",dao.selectNotice(ntc_num));
		return "/WEB-INF/views/NoticeBoardUpdateForm.jsp";
	}
	
	
	@RequestMapping(value = "/noticeboardupdate.action", method = RequestMethod.POST) 
	public String noticeUpdate(NoticeBoardDTO dto, Model model) //이전 페이지에서 넘겨준 name 값들이 여기 dto 에 담긴다
	{
		/*
		 * dao.update() 하고 model 에 dao.select 한 내용을 add 해주고 NoticeBoardView 페이지로 이동시켜준다.(자신이 수정한 내용보여지도록)
		 */
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		dao.updateNotice(dto);
		model.addAttribute("notice",dao.selectNotice2(dto)); 
		return "/WEB-INF/views/NoticeBoardView.jsp";
		
	}
	
	@RequestMapping(value = "/noticecategrizedlist.action", method = RequestMethod.GET)
	public String noticeCategorizedList(HttpServletRequest request, Model model)
	{
		String ntc_cat_code = request.getParameter("ntc_cat_code");
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		model.addAttribute("list",dao.categorizedList(ntc_cat_code));
		model.addAttribute("noticeCat",dao.getNoticeCat());
		return "/WEB-INF/views/NoticeBoardList.jsp";
	}
	
	@RequestMapping(value = "/noticekeywordsearch.action", method = RequestMethod.POST) // 검색어를 form submit 방식으로 받으므로 post
	public String noticeSearchedList(NoticeBoardDTO dto, Model model)
	{
		INoticeBoardDAO dao = sqlSession.getMapper(INoticeBoardDAO.class);
		
		model.addAttribute("list",dao.searchedList(dto));
		model.addAttribute("noticeCat",dao.getNoticeCat());
		return "/WEB-INF/views/NoticeBoardList.jsp";
		
	}
	
}
