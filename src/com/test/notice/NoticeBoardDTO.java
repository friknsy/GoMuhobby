package com.test.notice;

public class NoticeBoardDTO
{
	
	private String rownum, ntc_cat_code,ntc_cat_name; //공지사항분류번호, 공지사항분류이름
	
	private String ntc_num,a_num,uniq_id_num,user_nickname,ntc_title,ntc_content,ntc_hit,ntc_wrt_date; 
	// 공지번호, 관리자번호, 관리자고유식별변호, 관리자닉네임, 공지제목, 공지내용, 공지조회수, 공지작성일자
	private String searchKeyword;

	
	// getter/ setter 구성
	public String getNtc_cat_code()
	{
		return ntc_cat_code;
	}

	public void setNtc_cat_code(String ntc_cat_code)
	{
		this.ntc_cat_code = ntc_cat_code;
	}

	public String getNtc_cat_name()
	{
		return ntc_cat_name;
	}

	public void setNtc_cat_name(String ntc_cat_name)
	{
		this.ntc_cat_name = ntc_cat_name;
	}

	public String getNtc_num()
	{
		return ntc_num;
	}

	public void setNtc_num(String ntc_num)
	{
		this.ntc_num = ntc_num;
	}

	public String getA_num()
	{
		return a_num;
	}

	public void setA_num(String a_num)
	{
		this.a_num = a_num;
	}

	public String getUniq_id_num()
	{
		return uniq_id_num;
	}

	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}

	public String getUser_nickname()
	{
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}

	public String getNtc_title()
	{
		return ntc_title;
	}

	public void setNtc_title(String ntc_title)
	{
		this.ntc_title = ntc_title;
	}

	public String getNtc_content()
	{
		return ntc_content;
	}

	public void setNtc_content(String ntc_content)
	{
		this.ntc_content = ntc_content;
	}

	public String getNtc_hit()
	{
		return ntc_hit;
	}

	public void setNtc_hit(String ntc_hit)
	{
		this.ntc_hit = ntc_hit;
	}

	public String getNtc_wrt_date()
	{
		return ntc_wrt_date;
	}

	public void setNtc_wrt_date(String ntc_wrt_date)
	{
		this.ntc_wrt_date = ntc_wrt_date;
	}

	public String getRownum()
	{
		return rownum;
	}

	public void setRownum(String rownum)
	{
		this.rownum = rownum;
	}

	public String getSearchKeyword()
	{
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword)
	{
		this.searchKeyword = searchKeyword;
	}
	
	
	

	
	
	

}
