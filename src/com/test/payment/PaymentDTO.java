package com.test.payment;

public class PaymentDTO
{
	
	//주요 속성 구성
	private String c_open_num, c_title, c_addr, prof_name, c_open_date, c_open,time;
	//-- 클래스 개설예정번호, 클래스명, 상세주소, 강사이름, 개설날짜, 개설시간
	private String uniq_id_num, u_name, u_tel;
	//-- 고유식별번호, 회원이름, 회원전화번호
	private int c_price, c_runtime, pay_price;
	//-- 수강료, 소요시간
	

	// getter / setter 구성

	public int getC_price()
	{
		return c_price;
	}
	public int getC_runtime()
	{
		return c_runtime;
	}
	public int getPay_price()
	{
		return pay_price;
	}
	public void setPay_price(int pay_price)
	{
		this.pay_price = pay_price;
	}
	public void setC_runtime(int c_runtime)
	{
		this.c_runtime = c_runtime;
	}
	public void setC_price(int c_price)
	{
		this.c_price = c_price;
	}

	public String getC_open_num()
	{
		return c_open_num;
	}

	public void setC_open_num(String c_open_num)
	{
		this.c_open_num = c_open_num;
	}

	public String getC_title()
	{
		return c_title;
	}

	public void setC_title(String c_title)
	{
		this.c_title = c_title;
	}

	public String getC_addr()
	{
		return c_addr;
	}

	public void setC_addr(String c_addr)
	{
		this.c_addr = c_addr;
	}

	public String getProf_name()
	{
		return prof_name;
	}

	public void setProf_name(String prof_name)
	{
		this.prof_name = prof_name;
	}

	public String getC_open_date()
	{
		return c_open_date;
	}

	public void setC_open_date(String c_open_date)
	{
		this.c_open_date = c_open_date;
	}

	public String getC_open()
	{
		return c_open;
	}

	public void setC_open(String c_open)
	{
		this.c_open = c_open;
	}

	public String getTime()
	{
		return time;
	}

	public void setTime(String time)
	{
		this.time = time;
	}

	public String getUniq_id_num()
	{
		return uniq_id_num;
	}

	public void setUniq_id_num(String uniq_id_num)
	{
		this.uniq_id_num = uniq_id_num;
	}

	public String getU_name()
	{
		return u_name;
	}

	public void setU_name(String u_name)
	{
		this.u_name = u_name;
	}

	public String getU_tel()
	{
		return u_tel;
	}

	public void setU_tel(String u_tel)
	{
		this.u_tel = u_tel;
	}
	
	
	
	
	
}
