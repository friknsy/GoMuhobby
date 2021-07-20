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
		u.setUniq_id_num(dao.uniqIdget());
		
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
		
		String nickName = request.getParameter("nickName1");
		
		/* System.out.println(nickName); */
		
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
	public String phonenumber(HttpServletRequest request, ModelMap model)
	{	
		/*
		 *  String sphone1 =
		 * request.getParameter("sphone1"); String sphone2 =
		 * request.getParameter("sphone2"); String sphone3 =
		 * request.getParameter("sphone3"); String msg = request.getParameter("msg");
		 * 
		 * 
		 */
		String actionval = request.getParameter("actionval");
		String phonenumber = request.getParameter("phonenumber");
		String sphone1 = request.getParameter("sphone1");
		String sphone2 = request.getParameter("sphone2");
		String sphone3 = request.getParameter("sphone3");
		String msg = request.getParameter("msg");
		
		request.setAttribute("actionval", actionval);
		request.setAttribute("phonenumber", phonenumber);
		request.setAttribute("sphone1", sphone1);
		request.setAttribute("sphone2", sphone2);
		request.setAttribute("sphone3", sphone3);
		request.setAttribute("msg", msg);
		
		/*{rphone=01040207429}
		model.addAttribute("rphone", phonenumber);
		model.addAttribute("sphone1", sphone1);
		model.addAttribute("sphone2", sphone2);
		model.addAttribute("sphone3", sphone3);
		model.addAttribute("msg", msg);
		*/
		
		/*
		mav.addObject("sphone1", sphone1); mav.addObject("sphone2", sphone2);
		mav.addObject("sphone3", sphone3); mav.addObject("msg", msg);
		*/ 
		
		// System.out.println("난가" + (model.addAttribute("rphone", phonenumber)));
		
		return "/WEB-INF/views/1register.jsp";
	}
}
