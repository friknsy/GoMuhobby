package com.test.professor_forum;

public class Prof_Forum_ReplyDTO
{
	// 주요 속성 구성
	private String p_reply_num, p_reply_content, p_reply_wrt_date;
	//-- 댓글번호, 댓글내용, 댓글작성일
	private String p_reply_step, p_reply_index, p_reply_group;
	//-- 계층, 댓글인덱스, 댓글그룹
	private String p_forum_num, uniq_id_num, user_nickname, u_photo;
	//-- 게시물번호, 고유식별번호, 닉네임, 프로필사진
	
	// getter / setter
	public String getP_reply_num()
	{
		return p_reply_num;
	}
	public String getU_photo()
	{
		return u_photo;
	}
	public void setU_photo(String u_photo)
	{
		this.u_photo = u_photo;
	}
	public void setP_reply_num(String p_reply_num)
	{
		this.p_reply_num = p_reply_num;
	}
	public String getP_reply_content()
	{
		return p_reply_content;
	}
	public void setP_reply_content(String p_reply_content)
	{
		this.p_reply_content = p_reply_content;
	}
	public String getP_reply_wrt_date()
	{
		return p_reply_wrt_date;
	}
	public void setP_reply_wrt_date(String p_reply_wrt_date)
	{
		this.p_reply_wrt_date = p_reply_wrt_date;
	}
	public String getP_reply_step()
	{
		return p_reply_step;
	}
	public void setP_reply_step(String p_reply_step)
	{
		this.p_reply_step = p_reply_step;
	}
	public String getP_reply_index()
	{
		return p_reply_index;
	}
	public void setP_reply_index(String p_reply_index)
	{
		this.p_reply_index = p_reply_index;
	}
	public String getP_reply_group()
	{
		return p_reply_group;
	}
	public void setP_reply_group(String p_reply_group)
	{
		this.p_reply_group = p_reply_group;
	}
	public String getP_forum_num()
	{
		return p_forum_num;
	}
	public void setP_forum_num(String p_forum_num)
	{
		this.p_forum_num = p_forum_num;
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
