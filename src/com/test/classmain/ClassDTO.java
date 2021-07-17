package com.test.classmain;

public class ClassDTO
{
	// 주요 속성 구성
	private String c_info_num, p_info_num, c_title, c_info_date;
	//-- 클래스정보번호, 강사정보번호, 읍면동코드, 클래스명, 클래스정보등록일
	private int c_runtime, min_person, max_person, c_price;
	//-- 소요시간, 최소모집인원, 최대모집인원, 수강료
	private String c_detail_info, c_photo, c_video, c_addr;
	//-- 상세정보, 대표이미지, 영상URL, 장소
	private String uniq_id_num, town_name, music_cat_code, u_name;
	//-- 고유식별번호, 읍면동명, 음악 카테고리 코드
	private String user_nickname, u_tel, p_account;
	
	
	public String getUser_nickname()
	{
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}
	public String getU_tel()
	{
		return u_tel;
	}
	public void setU_tel(String u_tel)
	{
		this.u_tel = u_tel;
	}
	public String getP_account()
	{
		return p_account;
	}
	public void setP_account(String p_account)
	{
		this.p_account = p_account;
	}
	// getter / setter 구성
	public String getC_info_num()
	{
		return c_info_num;
	}
	public String getU_name()
	{
		return u_name;
	}
	public void setU_name(String u_name)
	{
		this.u_name = u_name;
	}
	public void setC_info_num(String c_info_num)
	{
		this.c_info_num = c_info_num;
	}
	public String getP_info_num()
	{
		return p_info_num;
	}
	public void setP_info_num(String p_info_num)
	{
		this.p_info_num = p_info_num;
	}
	public String getC_title()
	{
		return c_title;
	}
	public void setC_title(String c_title)
	{
		this.c_title = c_title;
	}
	public String getC_info_date()
	{
		return c_info_date;
	}
	public void setC_info_date(String c_info_date)
	{
		this.c_info_date = c_info_date;
	}
	public int getC_runtime()
	{
		return c_runtime;
	}
	public void setC_runtime(int c_runtime)
	{
		this.c_runtime = c_runtime;
	}
	public int getMin_person()
	{
		return min_person;
	}
	public void setMin_person(int min_person)
	{
		this.min_person = min_person;
	}
	public int getMax_person()
	{
		return max_person;
	}
	public void setMax_person(int max_person)
	{
		this.max_person = max_person;
	}
	public int getC_price()
	{
		return c_price;
	}
	public void setC_price(int c_price)
	{
		this.c_price = c_price;
	}
	public String getC_detail_info()
	{
		return c_detail_info;
	}
	public void setC_detail_info(String c_detail_info)
	{
		this.c_detail_info = c_detail_info;
	}
	public String getC_photo()
	{
		return c_photo;
	}
	public void setC_photo(String c_photo)
	{
		this.c_photo = c_photo;
	}
	public String getC_video()
	{
		return c_video;
	}
	public void setC_video(String c_video)
	{
		this.c_video = c_video;
	}
	public String getC_addr()
	{
		return c_addr;
	}
	public void setC_addr(String c_addr)
	{
		this.c_addr = c_addr;
	}
	public String getUniq_id_num()
	{
		return uniq_id_num;
	}
	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}
	public String getTown_name()
	{
		return town_name;
	}
	public void setTown_name(String town_name)
	{
		this.town_name = town_name;
	}
	public String getMusic_cat_code()
	{
		return music_cat_code;
	}
	public void setMusic_cat_code(String music_cat_code)
	{
		this.music_cat_code = music_cat_code;
	}
	
	
}
