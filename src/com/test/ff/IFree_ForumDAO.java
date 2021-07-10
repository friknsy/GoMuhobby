/*======================
 	IFree_ForumDAO.java
 	- 인터페이스
 	- 주요메소드 선언
 ======================*/

package com.test.ff;

import java.util.ArrayList;


public interface IFree_ForumDAO
{
	// 게시글 출력
	public ArrayList<Free_ForumDTO> list();
	
	// 게시글 입력
	public int insertBoard(Free_ForumDTO dto);
	
	// 게시물 읽어오기
	public Free_ForumDTO read(String f_forum_code);
	
	// 게시물 읽어오기2
	public Free_ForumDTO read2(Free_ForumDTO dto);
	
	// 조회 수 증가 
	public void updateHitCount(String f_forum_code);
	
	// 북마크 수 증가
	public void updateBookMarkCount(String f_forum_code);
	
	// 업데이트
	public int updateFF(Free_ForumDTO dto);
	
	// 삭제
	public int deleteFF(String f_forum_code);
	
	// 음악카테고리
	public ArrayList<Free_ForumDTO> catlist();
	
	// 북마크
	public int FFBookmark(Free_ForumDTO dto);
	
	// 신고 
	public int FFReport_reg(Free_ForumDTO dto);
	
	// 댓글출력
	public ArrayList<Free_ForumDTO> list_Reply(String f_forum_code);
	
	// 댓글 업데이트 
	public int replyUpdate(Free_ForumDTO dto);
	
	//  F_REPLY_GROUP +1
	public int selectReplyGroup();
	
	//  댓글 가져오기
	public Free_ForumDTO selectReply(Free_ForumDTO dto);
	
	// 게시글 작성자의 고유식별번호
	public String uniqIdcheck(String f_forum_code);
}
