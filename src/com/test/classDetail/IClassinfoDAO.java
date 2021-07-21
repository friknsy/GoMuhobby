package com.test.classDetail;

import java.util.ArrayList;

public interface IClassinfoDAO
{	
	//선택한 클래스의 상세 내용을 반환
	public ClassinfoDTO classDetail(String c_info_num);
	
	// 해당 클래스의 음악카테고리와 프로필자기소개
	public ClassinfoDTO getCatandIntroduction(String c_info_num);
	
	// 강사의 누적 회차
	public int getTotalClasses(String c_info_num);
	
	// 강사의 누적 리뷰수
	public int getTotalReviews(String c_info_num);
	
	// 개설된 클래스회차 가져오기
	public ArrayList<ClassinfoDTO> getClassDates(String c_info_num);
	
	// 해당 클래스의 리뷰 가져오기
	public ArrayList<ClassinfoDTO> getReviews(String c_info_num);
	
	// 해당 클래스의 편의사항 가져오기
	public ArrayList<ClassinfoDTO> getCV(String c_info_num);
	
	// 해당 클래스 강사의 프로필사진 가져오기
	public ClassinfoDTO getProfPhoto(String c_info_num);
	
	// 해당 클래스 강사의 평균 별점 가져오기
	public int getStarAvg(String c_info_num);
	
	// 해당 클래스의 질문과 답변 가져오기
	public ArrayList<ClassinfoDTO> getQnA(String c_info_num);
	
	// 해당 클래스의 질문에 답변하기
	public int classQnaInsert(ClassinfoDTO dto);
	
	// 해당 클래스의 답변을 수정하기
	public int classQnaUpdate(ClassinfoDTO dto);
	
	// 해당 클래스의 답변을 삭제하기
	public int classQnaDelete(String p_answ_num);
	
	// 해당 클래스의 질문 등록하기
	public int classQuestionInsert(ClassinfoDTO dto);
	
	// 해당 클래스의 질문  삭제하기
	public int classQuestionDelete(String c_qa_num);
	
	// 해당 클래스의 질문 수정하기
	public int classQuestionUpdate(ClassinfoDTO dto);
	
	// 강사번호로 이름,사진,총회차, 총후기, 총별점, 강사소개 가져오기
	public ClassinfoDTO getProfInfos(String p_info_num);
	
	// 강사번호로 강사 전체리뷰 가져오기 (리뷰내용,별점,날짜,수업제목,작성자이름,프로필사진)
	public ArrayList<ClassinfoDTO> getProfReviews(String p_info_num);
 	
	
	
}
