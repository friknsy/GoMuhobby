//MemberMain.java
// - 컨트롤러


package com.test.register;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 로그인 클릭 시 로그인 폼 반환
	@RequestMapping(value = "/mainpage.action", method = RequestMethod.GET)
	public String tomain()
	{	
		return "/WEB-INF/views/3mainpage.jsp";
	}
	
	// 로그인 시 정보 확인
	// SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=? AND SSN2 = CRYPTPACK.ENCRYPT(?,?) AND GRADE=0
	@ResponseBody
	@RequestMapping(value = "/loginIdCheck.action", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest request)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		String u_id = request.getParameter("userId");
		String u_pwd = request.getParameter("userPw");
		
		UserDTO u = new UserDTO();
		
		u.setU_id(u_id);
		u.setU_pwd(u_pwd);
		
		// System.out.println(dao.idcheck(u_id));		// 아이디가 있는 지 없는 지 0 or 1 반환
		// System.out.println(dao.pwcheck(u));			// 비밀번호가 맞는지 안 맞는지 0 or 1 반환
		// System.out.println(dao.logincheck(u));		// 문자열 반환
		
		int idcheck = dao.idcheck(u_id);
		int pwcheck = dao.pwcheck(u);
		
		String message = null;
		
		// 존재하지 않는 아이디이거나 탈퇴한 아이디 입니다.
	    if(idcheck < 1)
	    {	
	        message = "idfail";
	        return message;
	    }
	    
	    // 비밀번호가 일치하지 않습니다.
		else if (pwcheck < 1)
		{
	    	message = "pwfail";
	    	return message;
		}
	    
		else
		{
			return "/WEB-INF/views/3mainpage.jsp";
		}
	}
}
