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
}
