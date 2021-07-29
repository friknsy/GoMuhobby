package com.test.mypage;

public interface IChPwdDAO
{
	// 현재비밀번호가 맞는지 아닌지 확인, 맞으면 1 아니면 0 을 반환한다. 
	public String chekPwd(ChPwdDTO dto);
	// 비밀번호 업데이트
	public int changePwd(ChPwdDTO dto);

}
