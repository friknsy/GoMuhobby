package com.test.register;

public interface IUserDAO
{
	// 매개변수 param01 param02  | arg01 arg02 로 넘겨주면 매개변수 값 mybatis에서 인지 함!! 
	public int add1(UserDTO u);
	public int add2(UserDTO u);
	public int idcheck(String id);
	public int pwcheck(UserDTO u);
	public int nickNameCheck(String nick);
	public int emailCheck(String email);
	public String uniqIdget();
	public String logincheck(UserDTO u);
	public String uniqueId(String id);
	public int admincheck(String ui);
	
	// 로그인 시 방문이력 입력
	public int loginhit(String uniqueId);
	
	// 프로필사진 변경
	public int profileChange(String param1, String param2); //고유식별번호와 파일명 매개변수로 넘겨줌
	
	
}
