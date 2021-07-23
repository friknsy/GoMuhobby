package com.test.mypage;

public class MypageDTO
{
	String p_info_num;	// 강사 번호
	String uniq_id_num, drop_reason_code; // 고유식별번호, 탈퇴사유코드

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

	public String getDrop_reason_code()
	{
		return drop_reason_code;
	}

	public void setDrop_reason_code(String drop_reason_code)
	{
		this.drop_reason_code = drop_reason_code;
	}
	
	
	
	
}
