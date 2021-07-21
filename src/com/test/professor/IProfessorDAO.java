package com.test.professor;

import java.util.ArrayList;

import com.test.professor_forum.Prof_CommDTO;

public interface IProfessorDAO
{
	public ArrayList<ProfessorDTO> list(); 			//-- 관리자 측에서 전체 강사 조회
	public ProfessorDTO read(String uqiq_id_num);
	public String searchName(String uniq_id_num);	//-- 회원 이름 검색
	public int add(ProfessorDTO p);
	public int modify(ProfessorDTO p);
	public int remove(ProfessorDTO p);	   			//-- 관리자 측에서 강사정보 삭제
	public int count();
	
	public String getNum(String uniq_id_num);
	//-- 해당 회원의 강사 번호를 얻어내는 메소드
	public int check(String p_info_num);			
	//-- 해당 강사의 커뮤니티가 존재하는지 체크
	public int create(String p_info_num);			//-- 강사 커뮤니티 생성
}
