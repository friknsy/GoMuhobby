package com.test.mybatis;

public class QA_forumDTO
{
	// 주요 속성 구성
	private String rn, qa_forum_code, qa_forum_title, qa_forum_content, qa_forum_wrt_date;
	private String user_nickname, uniq_id_num;
	
	// getter / setter
	public String getUniq_id_num()
	{
		return uniq_id_num;
	}
	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}
	private int qa_forum_hit, bkm_count;
	
	public String getRn()
	{
		return rn;
	}
	public void setRn(String rn)
	{
		this.rn = rn;
	}
	public String getQa_forum_code()
	{
		return qa_forum_code;
	}
	public void setQa_forum_code(String qa_forum_code)
	{
		this.qa_forum_code = qa_forum_code;
	}
	public String getQa_forum_title()
	{
		return qa_forum_title;
	}
	public void setQa_forum_title(String qa_forum_title)
	{
		this.qa_forum_title = qa_forum_title;
	}
	public String getQa_forum_content()
	{
		return qa_forum_content;
	}
	public void setQa_forum_content(String qa_forum_content)
	{
		this.qa_forum_content = qa_forum_content;
	}
	public String getQa_forum_wrt_date()
	{
		return qa_forum_wrt_date;
	}
	public void setQa_forum_wrt_date(String qa_forum_wrt_date)
	{
		this.qa_forum_wrt_date = qa_forum_wrt_date;
	}
	
	public int getQa_forum_hit()
	{
		return qa_forum_hit;
	}
	public void setQa_forum_hit(int qa_forum_hit)
	{
		this.qa_forum_hit = qa_forum_hit;
	}
	public String getUser_nickname()
	{
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}
	public int getBkm_count()
	{
		return bkm_count;
	}
	public void setBkm_count(int bkm_count)
	{
		this.bkm_count = bkm_count;
	}
	
	
	

	
	
}
