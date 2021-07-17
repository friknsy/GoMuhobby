package com.test.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class AdminController
{
	// mybatis 객체 의존성(자동) 주입!!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 페이지 최초요청
	@RequestMapping(value = "/adminpage.action", method = RequestMethod.GET)
	public String main(Model model) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		//=======================
		// 오늘 날짜 얻기
			
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd", Locale.KOREA);
		String todayDate = sdf.format(date);
		//=======================
		
		
		
		model.addAttribute("todayVisit",dao.getTodayVisit(todayDate));
		model.addAttribute("totalVisit",dao.getTotalVisit());
		model.addAttribute("qnaList", dao.yetQna());
		return "/WEB-INF/views/Dashboard.jsp";
		
	}
	
	
	@RequestMapping(value = "/gotoreportreg.action", method = RequestMethod.GET)
	public String goToReportReg(Model model) 
	{
		//qna 질문글 신고 내역 가져오기
		// 자유게시판 신고 내역 가져오기
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("qaReportList", dao.qaReportList());
		model.addAttribute("ffReportList", dao.ffReportList());
		
		return "/WEB-INF/views/ReportReg.jsp";
	}
	
	
	@RequestMapping(value = "/joinandquitlist.action", method = RequestMethod.GET)
	public String goToJoinQuit(Model model) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("memberList",dao.memberList());
		model.addAttribute("quitList", dao.quitList());
		return "/WEB-INF/views/JoinAndQuitList.jsp";
	}
	
	// 계정복구 요청 시
	@RequestMapping(value = "/memberrecovery.action", method = RequestMethod.GET)
	public String memberRecovery(HttpServletRequest request)
	{
		
		String uniq_id_num = request.getParameter("uniq_id_num");
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 탈퇴테이블에 있는 정보를 회원테이블로 옮기고
		dao.memberRecovery(uniq_id_num);
		// 기존에 있던 탈퇴테이블 정보를 삭제한다.
		dao.dropMemberDelete(uniq_id_num);
		
		return "redirect:joinandquitlist.action";
		
		
	}
	
	@RequestMapping(value = "/namepopup.action", method = RequestMethod.GET)
	public String namePopUp(HttpServletRequest request, Model model) 
	{
		String uniq_id_num = request.getParameter("uniq_id_num");
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 현재이름을 가져와서 set 해줌
		model.addAttribute("u_name",dao.searchName(uniq_id_num));
		model.addAttribute("uniq_id_num",uniq_id_num);
		
		return "/WEB-INF/views/PopUp.jsp";
	}
	
	
	@RequestMapping(value = "/namechangeajax.action", method = RequestMethod.POST)
	public String ChangeName(HttpServletRequest request,AdminDTO dto) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.modifyName(dto);
			
		return "redirect:joinandquitlist.action";
	}
	
	
	@RequestMapping(value = "/reportpopupopen.action", method = RequestMethod.GET)
	public String reportPopUp(HttpServletRequest request, Model model) 
	{
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String qa_report_reg_code = request.getParameter("qa_report_reg_code");
		
		// 현재이름을 가져와서 set 해줌
		
		model.addAttribute("qa_report_reg_code",qa_report_reg_code);
		
		return "/WEB-INF/views/ReportPopUp.jsp";
	}
	
	
	@RequestMapping(value = "/reportprocessingajax.action" , method = RequestMethod.POST)
	public String reportProcessing(AdminDTO dto)
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		dao.reportProcessing(dto);
		return "";
	}
	
	


}
