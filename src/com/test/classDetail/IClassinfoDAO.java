package com.test.classDetail;

import java.util.ArrayList;

public interface IClassinfoDAO
{	
	//선택한 클래스의 상세 내용을 반환
	public ClassinfoDTO classDetail(String c_info_num);
	
	// 해당 클래스의 카테고리와 프로필자기소개
	public ClassinfoDTO getCatandIntroduction(String c_info_num);

}
