package com.test.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentController
{
	@Autowired 
	private SqlSession sqlSession;
	
	
	// 결제 페이지 이동
	@RequestMapping(value = "/payment.action", method = RequestMethod.GET)
	public String ProfessorInfo(Model model, HttpServletRequest request)
	{
		String c_open_num = request.getParameter("c_open_num");
		String uniq_id_num = request.getParameter("uniq_id_num");
		
		System.out.println(c_open_num);
		System.out.println(uniq_id_num);
		
		IPaymentDAO dao = sqlSession.getMapper(IPaymentDAO.class);
		
		model.addAttribute("classInfo", dao.classInfo(c_open_num));
		model.addAttribute("memberInfo", dao.classInfo(uniq_id_num));
		
		return "/WEB-INF/views/Payment.jsp";
	}
	
	// 결제
	//@RequestMapping(value = "/")
	
	
	
}


