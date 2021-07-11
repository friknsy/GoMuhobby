/*==================================
 	Free_ForumController.java
 	- 컨트롤러(사용자 정의 컨트롤러)
 ==================================*/

package com.test.ff;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Free_ForumController
{
	@Autowired
	private SqlSession sqlSession;

	// 게시물 읽어오기
	@RequestMapping(value = "/fflist.action", method = RequestMethod.GET)
	public String list(ModelMap model)
	{
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);
		
		model.addAttribute("list", dao.list());
		
		return "WEB-INF/views/Free_Forum_List.jsp";
	}

	// 특정게시물 클릭시 이동
	@RequestMapping(value = "/ffread.action", method = RequestMethod.GET)
	public String read(HttpServletRequest request, ModelMap model)
	{
		String f_forum_code = request.getParameter("f_forum_code");
		
		/*
		   Free_ForumDTO dto = new Free_ForumDTO();
		   request.setAttribute("url", url);
		 */
		
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);
		dao.updateHitCount(f_forum_code);
		
		String uniqId = dao.uniqIdcheck(f_forum_code);
		
		request.setAttribute("uniqId", uniqId);
		
		model.addAttribute("read", dao.read(f_forum_code));

		model.addAttribute("list_Reply", dao.list_Reply(f_forum_code));

		return "WEB-INF/views/Free_Forum_Read.jsp";

	}

	// insertform 으로 이동
	@RequestMapping(value = "/ffinsertform.action")
	public String insertForm(ModelMap model)
	{
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);
		model.addAttribute("catlist", dao.catlist());

		return "WEB-INF/views/Free_Forum_Insert.jsp";
	}

	// insert action
	@RequestMapping(value = "/ffinsert.action", method = RequestMethod.POST)
	public String insert(Free_ForumDTO dto, HttpServletRequest request)
	{
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);
		
		String url = dto.getF_forum_video();
		
		String pattern = "(?<=watch\\?v=|/videos/|embed\\/)[^#\\&\\?]*";

	    Pattern compiledPattern = Pattern.compile(pattern);
	    Matcher matcher = compiledPattern.matcher(url);

	    if(matcher.find()){
	        url = matcher.group();
	    }
		
		//https://www.youtube.com/embed/a_tMEXd8Zow
	    
		dto.setF_forum_video(url);
		dao.insertBoard(dto);
		
		System.out.println(url + "확인");
		
		return "redirect:/fflist.action";

	}

	// delete action
	@RequestMapping(value = "/ffdelete.action", method = RequestMethod.GET)
	public String deleteFF(HttpServletRequest request, ModelMap model)
	{
		String f_forum_code = request.getParameter("f_forum_code");
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);

		dao.deleteFF(f_forum_code);

		return "redirect:/fflist.action";

	}

	// updateform
	@RequestMapping(value = "/ffupdateform.action", method = RequestMethod.GET)
	public String updateForm(HttpServletRequest request, Model model)
	{
		String f_forum_code = request.getParameter("f_forum_code");
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);

		model.addAttribute("read", dao.read(f_forum_code));
		model.addAttribute("catlist", dao.catlist());

		return "/WEB-INF/views/Free_Forum_Update.jsp";
	}

	// update.action
	@RequestMapping(value = "/ffupdate.action", method = RequestMethod.POST)
	public String updateFF(Free_ForumDTO dto, Model model) //, Model model
	{
		
		
		/*
		 * IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class); //String
		 * f_forum_code = dto.getF_forum_code();
		 * 
		 * "redirect:fflist.action";
		 */
		
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);
		dao.updateFF(dto);
		model.addAttribute("read", dao.read2(dto)); 
		return "WEB-INF/views/Free_Forum_Read.jsp";
	}

	
	
	// bookmark action
	@RequestMapping(value = "/ffbookmark.action", method = RequestMethod.GET)
	public String FFBookmark(Free_ForumDTO dto)
	{
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);

		dao.FFBookmark(dto);
		
		return "redirect:/fflist.action";

	}

	// 신고 버튼 action
	@RequestMapping(value = "/ffreportreg.action", method = RequestMethod.POST)
	@ResponseBody
	public String FFReport_reg(Free_ForumDTO dto)
	{
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);
		
		/*
		 * System.out.println("유저번호 : "+dto.getUniq_id_num());
		 * System.out.println("리포트 카테고리 번호 : "+dto.getReport_cat_num());
		 * System.out.println("신고 게시글 번호 : "+dto.getF_forum_code());
		 */
		
		
		//dto.setUniq_id_num("10");
		System.out.println(dto + " 전송은 되냐 ");
	
		Integer result = dao.FFReport_reg(dto); 

		return result > 0 ? "SUCCESS" : "FAIL"; 

	}

	// 댓글 업데이트
	@RequestMapping(value = "/replyupdate.action", method = RequestMethod.POST)
	@ResponseBody 
	public String replyUpdate(Free_ForumDTO dto, ModelMap model)
	{
		IFree_ForumDAO dao = sqlSession.getMapper(IFree_ForumDAO.class);

		dto.setF_reply_group(String.valueOf(dao.selectReplyGroup()));
		dto.setF_reply_index("1"); // 인덱스
		dto.setF_reply_step("0"); // 대댓글여부

		Integer replyUpdateResult=dao.replyUpdate(dto);
		return replyUpdateResult>0 ? "SUCCESS" : "FAIL";
	}

	
	// 신고 팝업 페이지
	@RequestMapping(value = "/reportPopup.action", method = RequestMethod.GET)
	public String pageReportPopup()
	{
		return "WEB-INF/views/08_2_popup.jsp";
	}
}
