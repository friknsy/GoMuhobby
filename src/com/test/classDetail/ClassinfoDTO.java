package com.test.classDetail;

public class ClassinfoDTO
{
	// 클래스 상세 정보
	private String c_info_num,p_info_num, town_code,c_title,c_info_date,c_runtime,min_person,max_person,c_detail_info,c_photo,c_video,c_addr,c_price,u_name;
	// 해당 클래스의 카테고리와 프로필자기소개
	private String music_cat_small, u_info; 
	
	// 해당 클래스 회차들 PK번호,시간,신청인원 가져오기
	private String c_open_num, c_open_date, payments;
	
	// 해당 클래스 댓글 가져오기
	private String review_num,pay_num,review_content, review_star,review_wrt_date,uniq_id_num, u_photo;
	
	// 편의사항 가져오기
	private String cv_name;
	
	// 강사의 평균 별점, 총진행회차, 총후기개수 가져오기
	private String staravg, total_class_unit, total_review_unit;
	
	// 해당클래스의 질문과 답변 가져오기
	private String c_qa_num, c_qa_content, c_qa_wrt_date, p_answ_content, p_answ_wrt_date, user_nickname, p_answ_num;
	
	
	
	public String getC_info_num()
	{
		return c_info_num;
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

	public String getTown_code()
	{
		return town_code;
	}

	public void setTown_code(String town_code)
	{
		this.town_code = town_code;
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

	public String getC_runtime()
	{
		return c_runtime;
	}

	public void setC_runtime(String c_runtime)
	{
		this.c_runtime = c_runtime;
	}

	public String getMin_person()
	{
		return min_person;
	}

	public void setMin_person(String min_person)
	{
		this.min_person = min_person;
	}

	public String getMax_person()
	{
		return max_person;
	}

	public void setMax_person(String max_person)
	{
		this.max_person = max_person;
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

	public String getC_price()
	{
		return c_price;
	}

	public void setC_price(String c_price)
	{
		this.c_price = c_price;
	}

	public String getU_name()
	{
		return u_name;
	}

	public void setU_name(String u_name)
	{
		this.u_name = u_name;
	}

	public String getMusic_cat_small()
	{
		return music_cat_small;
	}

	public void setMusic_cat_small(String music_cat_small)
	{
		this.music_cat_small = music_cat_small;
	}

	public String getU_info()
	{
		return u_info;
	}

	public void setU_info(String u_info)
	{
		this.u_info = u_info;
	}

	public String getC_open_date()
	{
		return c_open_date;
	}

	public void setC_open_date(String c_open_date)
	{
		this.c_open_date = c_open_date;
	}

	public String getPayments()
	{
		return payments;
	}

	public void setPayments(String payments)
	{
		this.payments = payments;
	}

	public String getC_open_num()
	{
		return c_open_num;
	}

	public void setC_open_num(String c_open_num)
	{
		this.c_open_num = c_open_num;
	}

	public String getReview_num()
	{
		return review_num;
	}

	public void setReview_num(String review_num)
	{
		this.review_num = review_num;
	}

	public String getPay_num()
	{
		return pay_num;
	}

	public void setPay_num(String pay_num)
	{
		this.pay_num = pay_num;
	}

	public String getReview_content()
	{
		return review_content;
	}

	public void setReview_content(String review_content)
	{
		this.review_content = review_content;
	}

	public String getReview_star()
	{
		return review_star;
	}

	public void setReview_star(String review_star)
	{
		this.review_star = review_star;
	}

	public String getReview_wrt_date()
	{
		return review_wrt_date;
	}

	public void setReview_wrt_date(String review_wrt_date)
	{
		this.review_wrt_date = review_wrt_date;
	}

	public String getUniq_id_num()
	{
		return uniq_id_num;
	}

	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}

	public String getU_photo()
	{
		return u_photo;
	}

	public void setU_photo(String u_photo)
	{
		this.u_photo = u_photo;
	}

	public String getCv_name()
	{
		return cv_name;
	}

	public void setCv_name(String cv_name)
	{
		this.cv_name = cv_name;
	}

	public String getStaravg()
	{
		return staravg;
	}

	public void setStaravg(String staravg)
	{
		this.staravg = staravg;
	}

	public String getC_qa_num()
	{
		return c_qa_num;
	}

	public void setC_qa_num(String c_qa_num)
	{
		this.c_qa_num = c_qa_num;
	}

	public String getC_qa_content()
	{
		return c_qa_content;
	}

	public void setC_qa_content(String c_qa_content)
	{
		this.c_qa_content = c_qa_content;
	}

	public String getC_qa_wrt_date()
	{
		return c_qa_wrt_date;
	}

	public void setC_qa_wrt_date(String c_qa_wrt_date)
	{
		this.c_qa_wrt_date = c_qa_wrt_date;
	}

	public String getP_answ_content()
	{
		return p_answ_content;
	}

	public void setP_answ_content(String p_answ_content)
	{
		this.p_answ_content = p_answ_content;
	}

	public String getP_answ_wrt_date()
	{
		return p_answ_wrt_date;
	}

	public void setP_answ_wrt_date(String p_answ_wrt_date)
	{
		this.p_answ_wrt_date = p_answ_wrt_date;
	}

	public String getUser_nickname()
	{
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}

	public String getP_answ_num()
	{
		return p_answ_num;
	}

	public void setP_answ_num(String p_answ_num)
	{
		this.p_answ_num = p_answ_num;
	}

	public String getTotal_class_unit()
	{
		return total_class_unit;
	}

	public void setTotal_class_unit(String total_class_unit)
	{
		this.total_class_unit = total_class_unit;
	}

	public String getTotal_review_unit()
	{
		return total_review_unit;
	}

	public void setTotal_review_unit(String total_review_unit)
	{
		this.total_review_unit = total_review_unit;
	}
	

}
