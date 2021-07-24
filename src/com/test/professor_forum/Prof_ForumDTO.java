package com.test.professor_forum;

public class Prof_ForumDTO
{
	// 주요 속성 구성
	private String p_forum_num, p_forum_content, p_forum_wrt_date;
	//-- 게시물번호, 내용, 작성일
	private String p_comm_code, uniq_id_num, user_nickname, u_photo;
	//-- 커뮤니티코드, 고유식별번호, 닉네임
	
	// getter / setter
	public String getU_photo()
	{
		return u_photo;
	}
	public void setU_photo(String u_photo)
	{
		this.u_photo = u_photo;
	}
	public String getP_forum_num()
	{
		return p_forum_num;
	}
	public void setP_forum_num(String p_forum_num)
	{
		this.p_forum_num = p_forum_num;
	}
	public String getP_forum_content()
	{
		return p_forum_content;
	}
	public void setP_forum_content(String p_forum_content)
	{
		this.p_forum_content = p_forum_content;
	}
	public String getP_forum_wrt_date()
	{
		return p_forum_wrt_date;
	}
	public void setP_forum_wrt_date(String p_forum_wrt_date)
	{
		this.p_forum_wrt_date = p_forum_wrt_date;
	}
	public String getP_comm_code()
	{
		return p_comm_code;
	}
	public void setP_comm_code(String p_comm_code)
	{
		this.p_comm_code = p_comm_code;
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
	
	
	
}
