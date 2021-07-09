
//MemberDTO.java
// - 데이터 저장 및 전송 전용 객체

package com.test.mybatis1;

public class MemberDTO
{
	
	// 주요 속성 구성 후 getter/ setter 메소드 구성
	private String mid, name, telephone;

	public String getMid()
	{
		return mid;
	}

	public void setMid(String mid)
	{
		this.mid = mid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTelephone()
	{
		return telephone;
	}

	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	
	

}
