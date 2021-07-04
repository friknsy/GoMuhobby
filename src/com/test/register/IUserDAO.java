package com.test.register;

public interface IUserDAO
{
	public int add1(UserDTO u);
	public int add2(UserDTO u);
	public int idcheck(String id);
	public int nickNameCheck(String nick);
	public int emailCheck(String email);
	public String uniqIdget();
}
