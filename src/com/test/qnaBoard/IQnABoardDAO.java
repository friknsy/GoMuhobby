package com.test.qnaBoard;

import java.util.ArrayList;

public interface IQnABoardDAO
{
	public ArrayList<QnaBoardDTO> list(String uniq_id_num);
	public QnaBoardDTO read(int qna_num);
	public QnABoard_Reply_DTO reply(int qna_num); 	//-- 개별 게시물의 답변 조회
	public int add(QnaBoardDTO q);
	public int modify(QnaBoardDTO q);
	public int remove(QnaBoardDTO q);
	public int count();
	
	public ArrayList<QnABoardGroupDTO> grouplist();
	// 문의 분류 리스트
}
