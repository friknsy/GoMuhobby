package com.test.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController
{

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/mypageform.action", method = RequestMethod.GET)
	public String tomypage(Model model, HttpServletRequest request)
	{
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);

		HttpSession session = request.getSession();

		// 강사번호 얻어내서 마이페이지로 넘기기
		String uniq_id_num = (String) session.getAttribute("uniqueId");
		System.out.println("고유식별번호 체크" + uniq_id_num);
		model.addAttribute("p_info_num", dao.getNum(uniq_id_num));

		return "WEB-INF/views/4mypage.jsp";
	}

	@RequestMapping(value = "/mypagemyclass.action", method = RequestMethod.GET)
	public String mypagemyclass(Model model)
	{
		// 깃  올리기 용
		return "WEB-INF/views/6mypagemyclass.jsp";
	}

	@RequestMapping(value = "/mypageyourclass.action", method = RequestMethod.GET)
	public String mypageyourclass(Model model)
	{
		return "WEB-INF/views/7mypageyourclass.jsp";
	}

	@RequestMapping(value = "memberquitform.action")
	public String memberQuitForm()
	{

		return "WEB-INF/views/MemberQuit.jsp";
	}

	// rupy 회원탈퇴
	@RequestMapping(value = "memberquit.action", method = RequestMethod.POST)
	public String memberQuitAction(MypageDTO dto)
	{

		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);

		//탈퇴하고자 하는 회원정보를 탈퇴테이블로 옮기고 회원테이블에서 삭제
		dao.insertDropMember(dto);
		dao.deleteMember(dto);

		return "WEB-INF/views/2logoutAction.jsp";
	}

	//rupy 비밀번호 변경 팝업 반환
	@RequestMapping(value = "/changepasswordpop.action")
	public String changePwdPop()
	{

		return "WEB-INF/views/MypageChangePassPop.jsp";
	}

	//rupy 비밀번호 일치 여부 확인
	@ResponseBody
	@RequestMapping(value = "/pwdcheck.action", method = RequestMethod.POST)
	public String checkPwd(ChPwdDTO dto, Model model)
	{

		//System.out.println(dto.u_pwd);
		//System.out.println(dto.uniq_id_num);
		String result = "";
		IChPwdDAO dao = sqlSession.getMapper(IChPwdDAO.class);
		result = dao.chekPwd(dto);
		//System.out.println(result);

		return result;

	}
	
	//rupy 비밀번호 변경
	@RequestMapping(value = "/updatepassword.action")
	public String updatePwd(ChPwdDTO dto)
	{

		IChPwdDAO dao = sqlSession.getMapper(IChPwdDAO.class);
		dao.changePwd(dto);
		return "windowcloseAndLogout.jsp";

	}
	

}
