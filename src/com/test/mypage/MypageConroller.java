package com.test.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageConroller
{	
	@RequestMapping(value="/mypageform.action",method=RequestMethod.GET)
	public String tomypage(Model model)
	{
		return "WEB-INF/views/4mypage.jsp";
	}
	
	@RequestMapping(value="/mypage.action",method=RequestMethod.GET)
	public String hello(Model model)
	{
		return "WEB-INF/views/4mypage.jsp";
	}
}
