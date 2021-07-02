//MemberMain.java
// - 컨트롤러


package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberMain
{
	// mybatis 객체 의존성(자동) 주입!!!!
	@Autowired
	private SqlSession sqlSession;
	
	// memberlist.action 요청이 들어오면 처리하도록
	@RequestMapping(value="/memberlist.action", method = RequestMethod.GET)	
	public String memberList(ModelMap model) // Model 을 사용해도 상관없다
	{
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class); // IMemberDAO 타입으로 안정적으로 형변환
		
		model.addAttribute("count",dao.count());
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/views/MemberList.jsp";
	}
	
	@RequestMapping(value = "/memberinsert.action", method = RequestMethod.POST)
	public String memberInsert(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.add(m);
		
		 return "redirect:memberlist.action";

	}
	
	
	@RequestMapping(value = "/memberdelete.action", method = RequestMethod.GET) // 앞에서 mid 값을 get 방식으로 넘겨줬다.
	public String memberDelete(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(m);
		
		return "redirect:memberlist.action";
		
	}
	
	
	@RequestMapping(value = "/memberupdate.action", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return "redirect:memberlist.action";
		
	}
	
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main()
	{
		return "/WEB-INF/views/3mainpage.jsp";
		
	}
}
