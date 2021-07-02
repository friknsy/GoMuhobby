//MemberMain.java
// - 컨트롤러


package com.test.register;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
