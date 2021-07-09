/*=================
 * 
 *Sample.java
 *- 컨트롤러 객체
 * ---------------*/


package com.test.mybatis1;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SampleController
{
	@RequestMapping(value="/hello.action",method=RequestMethod.GET)
	public String hello(Model model)
	{
		
		model.addAttribute("message","Hello Spring Annotation + MVC + mybatis Framework");
		
		
		
		return "WEB-INF/views/Hello.jsp";
		
	}

}
