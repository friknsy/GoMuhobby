package com.test.admin;

import java.util.ArrayList;

public interface IAdminDAO
{
	// 오늘 방문자 수를 반환
	public int getTodayVisit(String todayDate);
	
	// 전체 누적 방문자 수를 반환
	public int getTotalVisit();

	// 답변대기중인 문의목록을 반환함
	public ArrayList<AdminDTO> yetQna();
	
	//------------- 지금 이렇게 방문자수랑 대기중인 목록을 받아옴.----------------------
	
	//------------- QnA 신고접수내역 가져오기----------------------
	public ArrayList<AdminDTO> qaReportList();
	
	//------------- 회원 계정 목록 가져오기 ----------------------
	public ArrayList<AdminDTO> memberList();
	
	//-------------- 탈퇴 회원 목록 가져오기
	public ArrayList<AdminDTO> quitList();
	
	// ------------- 탈퇴회원 목록에서 회원목록으로 데이터이동(=계정복구)-------------------
	
	public int memberRecovery(String uniq_id_num);
	
	
	// -------------- 탈퇴회원 목록에서 삭제(복구계정 삭제)---------------------------------
	public int dropMemberDelete(String uniq_id_num);
	
	//-------------- 고유식별번호로 회원 이름 검색 --------------------------------------
	
	public AdminDTO searchName(String uniq_id_num);
	
	//--------------- 회원 이름 변경 ----------------------------------------------------
	public int modifyName(AdminDTO dto);
	
	//--------------- 신고처리 하기 ------------------------------------------------------
	public int reportProcessing(AdminDTO dto); //신고처리 테이블에 데이터삽입
	
	// -------------- FF 신고접수내역 가져오기 ---------------------------------------------
	public ArrayList<AdminDTO> ffReportList();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------------환불신청내역 가져오기 ------------------------------------------------
	public ArrayList<AdminRefundDTO> refundRequestList();
	
	
	
	

	

}
