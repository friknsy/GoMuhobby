package com.test.qnaBoard;

import java.util.ArrayList;

public interface IQnABoard_Reply_DAO
{
	public ArrayList<QnaBoardDTO> list(); 				//-- 전체 회원의 문의 게시글 조회
	public QnaBoardDTO read(int qna_num);				//-- 개별 게시물 조회
	public QnABoard_Reply_DTO reply(int qna_num); 	//-- 개별 게시물의 답변 조회
	public int add(QnABoard_Reply_DTO r); 				//-- 답변 작성
	public int modify(QnABoard_Reply_DTO r);			//-- 답변 수정
	public int remove(QnABoard_Reply_DTO r);			//-- 답변 삭제
	
	
}
