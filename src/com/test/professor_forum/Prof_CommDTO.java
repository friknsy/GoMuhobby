package com.test.professor_forum;

public class Prof_CommDTO
{
	// 주요 속성 구성
	private String p_comm_code, p_comm_date, p_info_num;
	//-- 커뮤니티코드, 개설날짜, 강사정보번호
	private String uniq_id_num, user_nickname;
	//-- 강사 고유식별번호, 강사 닉네임
	
	// getter / setter
	public String getP_comm_code()
	{
		return p_comm_code;
	}
	public void setP_comm_code(String p_comm_code)
	{
		this.p_comm_code = p_comm_code;
	}
	public String getP_comm_date()
	{
		return p_comm_date;
	}
	public void setP_comm_date(String p_comm_date)
	{
		this.p_comm_date = p_comm_date;
	}
	public String getP_info_num()
	{
		return p_info_num;
	}
	public void setP_info_num(String p_info_num)
	{
		this.p_info_num = p_info_num;
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
