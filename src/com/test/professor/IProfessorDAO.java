package com.test.professor;

import java.util.ArrayList;

public interface IProfessorDAO
{
	public ArrayList<ProfessorDTO> list(); //-- 관리자 측에서 전체 강사 조회
	public ProfessorDTO read(String uqiq_id_num);
	public String searchName(String uniq_id_num);	//-- 회원 이름 검색
	public int add(ProfessorDTO p);
	public int modify(ProfessorDTO p);
	public int remove(ProfessorDTO p);	   //-- 관리자 측에서 강사정보 삭제
	public int count();
}
