package com.test.professor_forum;

import java.util.ArrayList;


public interface IProf_ForumDAO
{
	public ArrayList<Prof_ForumDTO> list(String p_comm_code); 
	//-- 커뮤니티 글 전체 불러오기
	public Prof_ForumDTO read(String p_forum_num);	
	//-- 게시물 내용 불러오기
	
	public int add (Prof_ForumDTO f);
	public int modify (Prof_ForumDTO f);
	public int remove (String p_forum_num);
	public int count(String p_comm_code);
	
	public String getNum(String uniq_id_num);
}
