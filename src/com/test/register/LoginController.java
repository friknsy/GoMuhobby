//MemberMain.java
// - 컨트롤러


package com.test.register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	// 로그아웃 후 메인페이지 반환.
	@RequestMapping(value = "/logoutAction.action", method = RequestMethod.GET)
	public String logout()
	{	
		return "/WEB-INF/views/2logoutAction.jsp";
	} 
	
	// 로그인 시 정보 확인
	// SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=? AND SSN2 = CRYPTPACK.ENCRYPT(?,?) AND GRADE=0
	@ResponseBody
	@RequestMapping(value = "/loginIdCheck.action", method = RequestMethod.POST)
	public String loginCheck(HttpServletRequest request, HttpServletResponse response)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		String u_id = request.getParameter("userId");
		String u_pwd = request.getParameter("userPw");
		
		// 서버에 생성된 세션이 있으면 세션을 반환하고 없다면 새 세션을 생성. (인수 default true)
		// 인수로 false 값을 주면 이미 생성된 세션이 있을 때 그 세션을 반환하고 없다면 
		HttpSession session = request.getSession();
		
		UserDTO u = new UserDTO();
		
		u.setU_id(u_id);
		u.setU_pwd(u_pwd);
		
		System.out.println(dao.idcheck(u_id) + "아이디 확인");		// 아이디가 있는 지 없는 지 0 or 1 반환
		System.out.println(dao.pwcheck(u) + "비밀번호 확인");			// 비밀번호가 맞는지 안 맞는지 0 or 1 반환
		System.out.println(dao.logincheck(u) + "닉네임 확인");		// 문자열 반환
		
		int idcheck = dao.idcheck(u_id);
		int pwcheck = dao.pwcheck(u);
		
		String message = null;
		String mynickName = dao.logincheck(u);
		
		// 여기까진 문제 없음.. 근데 여기서 로그인이 되면 오류가 안 뜨고
		// 틀렸을 경우에 오류 발생함 ,,
		
		String uniqueId = dao.uniqueId(u_id);
		
		if(uniqueId==null)
		{
			uniqueId = "";
		}
		
		int admin = dao.admincheck(uniqueId);
		String adminStr = admin + "";
		
		System.out.println(adminStr + "야 ,, ");
		
		/* System.out.println(uniqueId); */
		
		/* System.out.println(mynickName); */
		
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
			if(admin == 0)
			{
				session.setAttribute("uniqueId", uniqueId);
				session.setAttribute("mynickName", mynickName);
				return message;
			}
			
			else
			{	
				session.setAttribute("adminStr", adminStr);
				session.setAttribute("uniqueId", uniqueId);
				session.setAttribute("mynickName", mynickName);
				return message;
			}
		}
	}
}
