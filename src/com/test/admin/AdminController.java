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
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardMain.jsp");
		return "/WEB-INF/views/DashboardFrame.jsp";
		
	}
	
	/* =====================================신고처리 ============================================ */
	@RequestMapping(value = "/qrepreg.action", method = RequestMethod.GET)
	public String QRepReg(Model model) 
	{
		//qna 질문글 신고 내역 가져오기
		// 자유게시판 신고 내역 가져오기
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("qaReportList", dao.qaReportList());
		model.addAttribute("ffReportList", dao.ffReportList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardQRepReg.jsp");
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	@RequestMapping(value = "/frepreg.action", method = RequestMethod.GET)
	public String FRepReg(Model model) 
	{
		//qna 질문글 신고 내역 가져오기
		// 자유게시판 신고 내역 가져오기
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("qaReportList", dao.qaReportList());
		model.addAttribute("ffReportList", dao.ffReportList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardFRepReg.jsp");
		
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	@RequestMapping(value = "/qqreg.action", method = RequestMethod.GET)
	public String QQReg(Model model) 
	{
		//qna 질문글 신고 내역 가져오기
		// 자유게시판 신고 내역 가져오기
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("qaReportList", dao.qaReportList());
		model.addAttribute("ffReportList", dao.ffReportList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardQQReg.jsp");
		
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	@RequestMapping(value = "/qareg.action", method = RequestMethod.GET)
	public String QAReg(Model model) 
	{
		//qna 질문글 신고 내역 가져오기
		// 자유게시판 신고 내역 가져오기
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("qaReportList", dao.qaReportList());
		model.addAttribute("ffReportList", dao.ffReportList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardQAReg.jsp");
		
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	@RequestMapping(value = "/freg.action", method = RequestMethod.GET)
	public String FReg(Model model) 
	{
		//qna 질문글 신고 내역 가져오기
		// 자유게시판 신고 내역 가져오기
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("qaReportList", dao.qaReportList());
		model.addAttribute("ffReportList", dao.ffReportList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardFReg.jsp");
		
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	/* =====================================신고처리 end ============================================ */
	
	/* =====================================가입/탈퇴/경고/정지 ============================================ */
	
	@RequestMapping(value = "/dashboardjoinlist.action", method = RequestMethod.GET)
	public String joinList(Model model) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("memberList",dao.memberList());
		model.addAttribute("quitList", dao.quitList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardJoinList.jsp");
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	
	@RequestMapping(value = "dashboardquitlist.action", method = RequestMethod.GET)
	public String quitList(Model model) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("memberList",dao.memberList());
		model.addAttribute("quitList", dao.quitList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardQuitList.jsp");
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	
	@RequestMapping(value = "dashboardyellowlist.action", method = RequestMethod.GET)
	public String yellowList(Model model) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("memberList",dao.memberList());
		model.addAttribute("quitList", dao.quitList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardYellowList.jsp");
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	

	
	/* =====================================가입/탈퇴/경고/정지 end ============================================ */
	

	
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
		
		return "redirect:dashboardquitlist.action";
		
		
	}
	
	// 이름 변경 팝업
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
			
		return "";
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
	
	
	
	
	//================================== 환불신청내역 ==============================================================
	
	// 환불신청 리스트 불러오기
	@RequestMapping(value = "/dashboardrefundrequestlist.action", method = RequestMethod.GET)
	public String refundRequest(Model model) 
	{
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("refundRequestList",dao.refundRequestList());
		model.addAttribute("clickedContentUrl","/WEB-INF/views/DashboardRefundRequestList.jsp");
		return "/WEB-INF/views/DashboardFrame.jsp";
	}
	
	// 환불신청 처리 페이지 반환
	@RequestMapping(value = "/refundprocessingpage.action", method = RequestMethod.GET)
	public String refundProcessiongPage(HttpServletRequest request, Model model) 
	{
		// 환불요청번호
		String refund_req_num=request.getParameter("refund_req_num");
		// 결제금액
		int pay_price=Integer.parseInt(request.getParameter("pay_price"));
		// 남은일수(환불신청일자와 수업일자의 차이)
		int days_left=Integer.parseInt(request.getParameter("days_left"));
		
		/*환불번호와 남은 일수가 넘겨진 상황
		남은 일수를 기준으로 환불금액이 달라진다. 
		0이면 환불불가
		1이면 50% 환불
		2이면 100% 환불*/
		double expectedRefund = 0;
		if (days_left>=2)
		{
			expectedRefund = pay_price*1.0;
		}
		else if (days_left==1) {
			expectedRefund = pay_price*0.5;
		}
		else
			expectedRefund = pay_price*0;
		
		
		// 환불예정금액
		model.addAttribute("refund_req_num",refund_req_num);
		model.addAttribute("expectedRefund",Math.round(expectedRefund));
		return "/WEB-INF/views/DashboardRefundProcessing.jsp";
	}
	
	//================================== 환불신청내역 end==============================================================
	
	


}
