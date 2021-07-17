package com.test.admin;

public class AdminDTO
{
	
	private String rnum, qna_num, qna_cat_name, qna_title, user_nickname, qna_wrt_date, qna_proc; // 번호, 문의번호, 문의분류상세, 문의제목, 문의글작성자. 문의날짜, 문의처리여부
	private String /* rnum, */ qa_forum_title, report_cat_content,/* user_nickname, */ qa_report_reg_date, proc_check, qa_report_reg_code, qa_forum_code; 
	//게시글 신고 - 번호,게시물제목, 신고사유, 신고자, 신고일자, 처리상태,게시물번호, 신고번호 (rnum 과 user_nickname 은 겹쳐서 기존 변수 사용)
	
	private String /*rnum,*/ uniq_id_num, u_join_date, u_id, u_name, u_email, u_tel, u_drop_date;
	// 회원 계정 조회 - 번호, 고유식별번호, 가입일, 아이디, 이름, 이메일, 전화번호, 탈퇴일자 (rnum은 기존 변수 사용)
	private String a_num , report_proc_cat_code;
	// 자유게시판 게시글 신고목록
	private String f_report_reg_code, f_report_reg_date, f_forum_code, f_forum_title, processing;
	

	public String getRnum()
	{
		return rnum;
	}

	public String getUniq_id_num()
	{
		return uniq_id_num;
	}

	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}

	public String getU_join_date()
	{
		return u_join_date;
	}

	public void setU_join_date(String u_join_date)
	{
		this.u_join_date = u_join_date;
	}

	public String getU_id()
	{
		return u_id;
	}

	public void setU_id(String u_id)
	{
		this.u_id = u_id;
	}

	public String getU_name()
	{
		return u_name;
	}

	public void setU_name(String u_name)
	{
		this.u_name = u_name;
	}

	public String getU_email()
	{
		return u_email;
	}

	public void setU_email(String u_email)
	{
		this.u_email = u_email;
	}

	public String getU_tel()
	{
		return u_tel;
	}

	public void setU_tel(String u_tel)
	{
		this.u_tel = u_tel;
	}



	public String getU_drop_date()
	{
		return u_drop_date;
	}

	public void setU_drop_date(String u_drop_date)
	{
		this.u_drop_date = u_drop_date;
	}

	public String getQa_forum_title()
	{
		return qa_forum_title;
	}

	public void setQa_forum_title(String qa_forum_title)
	{
		this.qa_forum_title = qa_forum_title;
	}

	public String getReport_cat_content()
	{
		return report_cat_content;
	}

	public void setReport_cat_content(String report_cat_content)
	{
		this.report_cat_content = report_cat_content;
	}

	public String getQa_report_reg_date()
	{
		return qa_report_reg_date;
	}

	public void setQa_report_reg_date(String qa_report_reg_date)
	{
		this.qa_report_reg_date = qa_report_reg_date;
	}

	public String getProc_check()
	{
		return proc_check;
	}

	public void setProc_check(String proc_check)
	{
		this.proc_check = proc_check;
	}

	public String getQa_report_reg_code()
	{
		return qa_report_reg_code;
	}

	public void setQa_report_reg_code(String qa_report_reg_code)
	{
		this.qa_report_reg_code = qa_report_reg_code;
	}

	public String getQa_forum_code()
	{
		return qa_forum_code;
	}

	public void setQa_forum_code(String qa_forum_code)
	{
		this.qa_forum_code = qa_forum_code;
	}

	public void setRnum(String rnum)
	{
		this.rnum = rnum;
	}

	public String getQna_num()
	{
		return qna_num;
	}

	public void setQna_num(String qna_num)
	{
		this.qna_num = qna_num;
	}

	public String getQna_cat_name()
	{
		return qna_cat_name;
	}

	public void setQna_cat_name(String qna_cat_name)
	{
		this.qna_cat_name = qna_cat_name;
	}

	public String getQna_title()
	{
		return qna_title;
	}

	public void setQna_title(String qna_title)
	{
		this.qna_title = qna_title;
	}

	public String getUser_nickname()
	{
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}

	public String getQna_wrt_date()
	{
		return qna_wrt_date;
	}

	public void setQna_wrt_date(String qna_wrt_date)
	{
		this.qna_wrt_date = qna_wrt_date;
	}

	public String getQna_proc()
	{
		return qna_proc;
	}

	public void setQna_proc(String qna_proc)
	{
		this.qna_proc = qna_proc;
	}

	public String getA_num()
	{
		return a_num;
	}

	public void setA_num(String a_num)
	{
		this.a_num = a_num;
	}

	public String getReport_proc_cat_code()
	{
		return report_proc_cat_code;
	}

	public void setReport_proc_cat_code(String report_proc_cat_code)
	{
		this.report_proc_cat_code = report_proc_cat_code;
	}

	public String getF_report_reg_code()
	{
		return f_report_reg_code;
	}

	public void setF_report_reg_code(String f_report_reg_code)
	{
		this.f_report_reg_code = f_report_reg_code;
	}

	public String getF_report_reg_date()
	{
		return f_report_reg_date;
	}

	public void setF_report_reg_date(String f_report_reg_date)
	{
		this.f_report_reg_date = f_report_reg_date;
	}

	public String getF_forum_code()
	{
		return f_forum_code;
	}

	public void setF_forum_code(String f_forum_code)
	{
		this.f_forum_code = f_forum_code;
	}

	public String getF_forum_title()
	{
		return f_forum_title;
	}

	public void setF_forum_title(String f_forum_title)
	{
		this.f_forum_title = f_forum_title;
	}

	public String getProcessing()
	{
		return processing;
	}

	public void setProcessing(String processing)
	{
		this.processing = processing;
	}

	
	
	

}
