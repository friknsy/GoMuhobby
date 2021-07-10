/*======================
 	Free_ForumDTO.java
 ======================*/

package com.test.ff;

public class Free_ForumDTO
{
	// ○ 주요 속성 구성
	private String f_forum_code, uniq_id_num, music_cat_code,music_cat_large, user_nickname;
	//-- 게시물번호, 회원번호, 음악카테고리 번호
	private String f_forum_title, f_forum_content, f_forum_wrt_date, f_forum_photo, f_forum_video;
	//-- 게시물제목, 게시물내용, 게시물 작성일, 사진업로드, 동영상업로드
	private String f_forum_state, f_forum_hit;
	//-- 삭제여부, 조회수
	private String f_report_reg_code, qa_report_reg_date, report_cat_num, report_cat_content ;
	//-- 신고 
	private String f_reply_code, f_reply_step, f_reply_index, f_reply_group, f_reply_content, f_reply_wrt_date, f_reply_wrt_user;
	//-- 댓글코드, 대댓글여부, 인덱스, 댓글그룹, 댓글내용, 댓글날짜, 댓글작성자
	
	
	// getter(), setter() 구성
	public String getF_forum_code()
	{
		return f_forum_code;
	}
	public void setF_forum_code(String f_forum_code)
	{
		this.f_forum_code = f_forum_code;
	}
	public String getUniq_id_num()
	{
		return uniq_id_num;
	}
	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}
	public String getMusic_cat_code()
	{
		return music_cat_code;
	}
	public void setMusic_cat_code(String music_cat_code)
	{
		this.music_cat_code = music_cat_code;
	}
	public String getF_forum_title()
	{
		return f_forum_title;
	}
	public void setF_forum_title(String f_forum_title)
	{
		this.f_forum_title = f_forum_title;
	}
	public String getF_forum_content()
	{
		return f_forum_content;
	}
	public void setF_forum_content(String f_forum_content)
	{
		this.f_forum_content = f_forum_content;
	}
	public String getF_forum_wrt_date()
	{
		return f_forum_wrt_date;
	}
	public void setF_forum_wrt_date(String f_forum_wrt_date)
	{
		this.f_forum_wrt_date = f_forum_wrt_date;
	}
	public String getF_forum_photo()
	{
		return f_forum_photo;
	}
	public void setF_forum_phot(String f_forum_photo)
	{
		this.f_forum_photo = f_forum_photo;
	}
	public String getF_forum_video()
	{
		return f_forum_video;
	}
	public void setF_forum_video(String f_forum_video)
	{
		this.f_forum_video = f_forum_video;
	}
	public String getF_forum_state()
	{
		return f_forum_state;
	}
	public void setF_forum_state(String f_forum_state)
	{
		this.f_forum_state = f_forum_state;
	}
	public String getF_forum_hit()
	{
		return f_forum_hit;
	}
	public void setF_forum_hit(String f_forum_hit)
	{
		this.f_forum_hit = f_forum_hit;
	}
	public String getUser_nickname()
	{
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname)
	{
		this.user_nickname = user_nickname;
	}
	public String getMusic_cat_large()
	{
		return music_cat_large;
	}
	public void setMusic_cat_large(String music_cat_large)
	{
		this.music_cat_large = music_cat_large;
	}
	public String getF_report_reg_code()
	{
		return f_report_reg_code;
	}
	public void setF_report_reg_code(String f_report_reg_code)
	{
		this.f_report_reg_code = f_report_reg_code;
	}
	public String getQa_report_reg_date()
	{
		return qa_report_reg_date;
	}
	public void setQa_report_reg_date(String qa_report_reg_date)
	{
		this.qa_report_reg_date = qa_report_reg_date;
	}
	public String getReport_cat_num()
	{
		return report_cat_num;
	}
	public void setReport_cat_num(String report_cat_num)
	{
		this.report_cat_num = report_cat_num;
	}
	public void setF_forum_photo(String f_forum_photo)
	{
		this.f_forum_photo = f_forum_photo;
	}
	
	public String getReport_cat_content()
	{
		return report_cat_content;
	}
	public void setReport_cat_content(String report_cat_content)
	{
		this.report_cat_content = report_cat_content;
	}
	
	public String getF_reply_code()
	{
		return f_reply_code;
	}
	public void setF_reply_code(String f_reply_code)
	{
		this.f_reply_code = f_reply_code;
	}
	public String getF_reply_step()
	{
		return f_reply_step;
	}
	public void setF_reply_step(String f_reply_step)
	{
		this.f_reply_step = f_reply_step;
	}
	public String getF_reply_index()
	{
		return f_reply_index;
	}
	public void setF_reply_index(String f_reply_index)
	{
		this.f_reply_index = f_reply_index;
	}
	public String getF_reply_group()
	{
		return f_reply_group;
	}
	public void setF_reply_group(String f_reply_group)
	{
		this.f_reply_group = f_reply_group;
	}
	public String getF_reply_content()
	{
		return f_reply_content;
	}
	public void setF_reply_content(String f_reply_content)
	{
		this.f_reply_content = f_reply_content;
	}
	public String getF_reply_wrt_date()
	{
		return f_reply_wrt_date;
	}
	public void setF_reply_wrt_date(String f_reply_wrt_date)
	{
		this.f_reply_wrt_date = f_reply_wrt_date;
	}
	public String getF_reply_wrt_user(){
		return f_reply_wrt_user;
	}
	public void setF_reply_wrt_user(String f_reply_wrt_user){
		this.f_reply_wrt_user = f_reply_wrt_user;
	}
	
	@Override
	public String toString()
	{
		return "Free_ForumDTO [f_forum_code=" + f_forum_code + ", uniq_id_num=" + uniq_id_num + ", music_cat_code="
				+ music_cat_code + ", music_cat_large=" + music_cat_large + ", user_nickname=" + user_nickname
				+ ", f_forum_title=" + f_forum_title + ", f_forum_content=" + f_forum_content + ", f_forum_wrt_date="
				+ f_forum_wrt_date + ", f_forum_photo=" + f_forum_photo + ", f_forum_video=" + f_forum_video
				+ ", f_forum_state=" + f_forum_state + ", f_forum_hit=" + f_forum_hit + ", f_report_reg_code="
				+ f_report_reg_code + ", qa_report_reg_date=" + qa_report_reg_date + ", report_cat_num="
				+ report_cat_num + ", report_cat_content=" + report_cat_content + ", f_reply_code=" + f_reply_code
				+ ", f_reply_step=" + f_reply_step + ", f_reply_index=" + f_reply_index + ", f_reply_group="
				+ f_reply_group + ", f_reply_content=" + f_reply_content + ", f_reply_wrt_date=" + f_reply_wrt_date
				+ "]";
	}
}
