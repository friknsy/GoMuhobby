package com.test.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController
{	
	
	@Autowired SqlSession sqlSession;
	
	@RequestMapping(value="/mypageform.action",method=RequestMethod.GET)
	public String tomypage(Model model, HttpServletRequest request)
	{
		IMypageDAO dao = sqlSession.getMapper(IMypageDAO.class);
		
		HttpSession session = request.getSession();
		
		// 강사번호 얻어내서 마이페이지로 넘기기
		String uniq_id_num = (String)session.getAttribute("uniqueId");
		System.out.println("고유식별번호 체크" + uniq_id_num);
		model.addAttribute("p_info_num", dao.getNum(uniq_id_num));
		
		return "WEB-INF/views/4mypage.jsp";
	}
	
	@RequestMapping(value="/mypagemyclass.action",method=RequestMethod.GET)
	public String mypagemyclass(Model model)
	{	
		// 깃  올리기 용
		return "WEB-INF/views/6mypagemyclass.jsp";
	}
	
	@RequestMapping(value="/mypageyourclass.action",method=RequestMethod.GET)
	public String mypageyourclass(Model model)
	{
		return "WEB-INF/views/7mypageyourclass.jsp";
	}
}
