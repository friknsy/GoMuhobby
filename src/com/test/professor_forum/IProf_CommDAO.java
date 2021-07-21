package com.test.professor_forum;

import java.util.ArrayList;

public interface IProf_CommDAO
{
	public ArrayList<Prof_CommDTO> list();	//-- 모든 강사 커뮤니티 조회
	public int count();						//-- 총 강사 커뮤니티 카운트
	
		
}
