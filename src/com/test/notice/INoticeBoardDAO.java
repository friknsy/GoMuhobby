package com.test.notice;

import java.util.ArrayList;

public interface INoticeBoardDAO
{
	//공지사항 카테고리 받아옴
	public ArrayList<NoticeBoardDTO> getNoticeCat();
	// 공지사항 목록을 받아옴
	public ArrayList<NoticeBoardDTO> noticeList();
	// 공지사항을 작성함
	public int addNotice(NoticeBoardDTO dto);
	// 선택한 공지사항 세부내용을 가져옴
	public NoticeBoardDTO selectNotice(String ntc_num);
	// 선택한 공지사항을 삭제함
	public int deleteNotice(String ntc_num);
	// 선택한 공지사항을 업데이트함
	public int updateNotice(NoticeBoardDTO dto);
	// 수정한 해당 공지사항 세부내용을 가져옴(selectNotice 의 경우에는 num 을 get 방식으로 가져와야 해서 매개변수가 String 인데
	// post 방식으로 가져오는 것도 필요해서 기능은 같지만 또 만들었다.
	public NoticeBoardDTO selectNotice2(NoticeBoardDTO dto);
	
	// 선택한 공지사항의 조회수를 증가시켜줌
	public int hitNotice(String ntc_num);
	
	// 공지사항 목록에서 카테고리를 선택하면 해당 카테고리의 공지사항만 보여줌
	public ArrayList<NoticeBoardDTO> categorizedList(String ntc_cat_code);
	
	// 검색어로 공지사항을 검색함
	public ArrayList<NoticeBoardDTO> searchedList(NoticeBoardDTO dto); //dto에서 searchKeyword 값을 get해서 DB에서 찾아서 dto 목록들을 반환함

	
}
