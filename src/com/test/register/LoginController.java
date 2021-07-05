//MemberMain.java
// - 컨트롤러


package com.test.register;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.mybatis.IMemberDAO;
import com.test.mybatis.MemberDTO;

@Controller
public class LoginController
{
	// mybatis 객체 의존성(자동) 주입!!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 클릭 시 로그인 폼 반환
	@RequestMapping(value = "/loginform.action", method = RequestMethod.GET)
	public String login()
	{	
		return "/WEB-INF/views/2login.jsp";
	}
	
	// SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=? AND SSN2 = CRYPTPACK.ENCRYPT(?,?) AND GRADE=0
	@RequestMapping(value = "/loginIdCheck.action", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest request)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		String loginId = request.getParameter("u_id");
		String loginPw = request.getParameter("u_pwd");
		
		System.out.println(loginId);
		System.out.println(loginPw);
		
		return "/WEB-INF/views/2login.jsp";
	}
}
