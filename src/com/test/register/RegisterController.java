//MemberMain.java
// - 컨트롤러


package com.test.register;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.mybatis.IMemberDAO;
import com.test.mybatis.MemberDTO;

@Controller
public class RegisterController
{
	// mybatis 객체 의존성(자동) 주입!!!!
	@Autowired
	private SqlSession sqlSession;
	
	
	// 회원가입 클릭 시 회원가입폼 반환
	@RequestMapping(value = "/registerform.action", method = RequestMethod.GET)
	public String main()
	{	
		return "/WEB-INF/views/1register.jsp";
	}	
	
	// 회원가입 폼 작성 후 SUBMIT 할 시 
	@RequestMapping(value = "/register.action", method = RequestMethod.POST)
	public String memberInsert(UserDTO u)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		dao.add1(u);
		dao.add2(u);
		
		
		return "/WEB-INF/views/welcome.jsp";
	}
	
	// 고유 식별번호
	@ResponseBody
	@RequestMapping(value="/uniqId.action", method = RequestMethod.POST)
	public String uniqId(HttpServletRequest request)
	{	
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		String uniqId = dao.uniqIdget();
		
		return uniqId;
	}
	
	// 회원가입 시 아이디 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/nickNameCheck.action", method=RequestMethod.POST)
	public String nickNameCheck(HttpServletRequest request, ModelMap model)
	{	
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		String nickName = request.getParameter("nickName");
		
		System.out.println(nickName);
		
		int result = dao.nickNameCheck(nickName);
		
		String message = null;
		
	    if(result > 0)
	    {	//사용할 수 있다. db에서 찾았는데없으니까
	        message = "success";
	    }
	    
	    else 
	    {
	    	//사용할 수 없다.
	        message = "fail";
	    }
	    
	    return message;
	}
	
	// 회원가입 시 닉네임 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/idCheck.action", method=RequestMethod.POST)
	public String idcheck(HttpServletRequest request, ModelMap model)
	{	
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		String userId = request.getParameter("userId");
		
		int result = dao.idcheck(userId);
		
		String message = null;
		
	    if(result > 0)
	    {	//사용할 수 있다. db에서 찾았는데없으니까
	        message = "success";
	    }
	    
	    else 
	    {
	    	//사용할 수 없다.
	        message = "fail";
	    }
	    
	    model.addAttribute("message", message);
	    
	    return message;
	}
	
	// 회원가입 시 이메일 유효성 검사
	@ResponseBody
	@RequestMapping(value = "/emailCheck.action", method=RequestMethod.POST)
	public String emailcheck(HttpServletRequest request, ModelMap model)
	{	
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		String userEmail = request.getParameter("userEmail");
		
		int result = dao.emailCheck(userEmail);
		
		String message = null;
		
	    if(result > 0)
	    {	//사용할 수 있다. db에서 찾았는데없으니까
	        message = "success";
	    }
	    
	    else 
	    {
	    	//사용할 수 없다.
	        message = "fail";
	    }
	    
	    return message;
	}
	
	// 인증번호 받기
	@RequestMapping(value = "/numbercheck.action", method = RequestMethod.POST)
	public String phonenumber()
	{
		return "/WEB-INF/views/1register.jsp";
		
	}
}
