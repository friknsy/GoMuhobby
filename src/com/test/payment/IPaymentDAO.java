package com.test.payment;

public interface IPaymentDAO
{
	public PaymentDTO classInfo(String c_open_num); // 클래스 정보
	public PaymentDTO memberInfo(String uniq_id_num); // 신청자 정보
	public int add(PaymentDTO p);	//-- 신청 (결제)
	
	 
}
