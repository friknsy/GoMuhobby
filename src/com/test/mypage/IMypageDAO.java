package com.test.mypage;

public interface IMypageDAO
{
	public String getNum(String uniq_id_num);
	
	//회원탈퇴1: 탈퇴테이블에 추가
	public int insertDropMember(MypageDTO dto);
	//회원탈퇴2: 회원테이블에서 삭제
	public int deleteMember(MypageDTO dto);
}
