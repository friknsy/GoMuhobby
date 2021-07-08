package com.test.qnaBoard;

public class QnABoard_Reply_DTO
{
	// 주요 속성 구성
	private String qna_answ_num, a_num, qna_num;	//-- 답변번호, 관리자번호, 게시글번호
	private String uniq_id_num, qna_answ_title, qna_answ_content, qna_answ_wrt_date;	//-- 제목, 내용, 날짜
	
	
	// getter / setter 구성
	public String getUniq_id_num()
	{
		return uniq_id_num;
	}
	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}
	
	public String getQna_answ_num()
	{
		return qna_answ_num;
	}
	public void setQna_answ_num(String qna_answ_num)
	{
		this.qna_answ_num = qna_answ_num;
	}
	public String getA_num()
	{
		return a_num;
	}
	public void setA_num(String a_num)
	{
		this.a_num = a_num;
	}
	public String getQna_num()
	{
		return qna_num;
	}
	public void setQna_num(String qna_num)
	{
		this.qna_num = qna_num;
	}
	public String getQna_answ_title()
	{
		return qna_answ_title;
	}
	public void setQna_answ_title(String qna_answ_title)
	{
		this.qna_answ_title = qna_answ_title;
	}
	public String getQna_answ_content()
	{
		return qna_answ_content;
	}
	public void setQna_answ_content(String qna_answ_content)
	{
		this.qna_answ_content = qna_answ_content;
	}
	public String getQna_answ_wrt_date()
	{
		return qna_answ_wrt_date;
	}
	public void setQna_answ_wrt_date(String qna_answ_wrt_date)
	{
		this.qna_answ_wrt_date = qna_answ_wrt_date;
	}
	
	
	
}
