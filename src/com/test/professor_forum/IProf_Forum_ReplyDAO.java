package com.test.professor_forum;

import java.util.ArrayList;

import com.test.mypage.MypageDTO;

public interface IProf_Forum_ReplyDAO
{
	//public ArrayList<Prof_Forum_ReplyDTO> list();
	/*
	public Prof_Forum_ReplyDTO read();
	public int add (Prof_Forum_ReplyDTO r);
	public int modify (Prof_Forum_ReplyDTO r);
	public int remove (Prof_Forum_ReplyDTO r);
	public int count();
	*/
	
	// 댓글목록 가져오기
	public ArrayList<Prof_Forum_ReplyDTO> getReplyList();
	
	// 다음그룹번호 가져오기
	public String getNextGroup(String p_forum_num);
	
	// 다음인덱스번호 가져오기
	public String getNextIndex(String p_forum_num, String p_reply_group);
	
	// 부모댓글달기
	public int writeReply(Prof_Forum_ReplyDTO dto);
	
	// 자식댓글달기
	public int writeChildReply(Prof_Forum_ReplyDTO dto);
	
	// 부모 댓글 삭제
	public int deleteReply(String p_reply_group);
	
	// 자식 댓글 삭제
	public int deleteChildReply(String p_reply_num);
	
}
