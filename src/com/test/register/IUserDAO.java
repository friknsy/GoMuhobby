package com.test.register;

public interface IUserDAO
{
	public int add1(UserDTO u);
	public int add2(UserDTO u);
	public int idcheck(String id);
	
	// 매개변수 param01 param02  | arg01 arg02
	public int pwcheck(UserDTO u);
	
	public int nickNameCheck(String nick);
	public int emailCheck(String email);
	public String uniqIdget();
	public String logincheck(UserDTO u);
}
