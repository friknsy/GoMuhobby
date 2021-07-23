package com.test.classopen;

import java.util.ArrayList;

import com.test.classmain.ClassDTO;

public interface IClassOpenDAO
{
	public ClassDTO profinfo(String uniq_id_num);
	public ArrayList<ClassOpenDTO> cvlist();
	public String towncode(String town_name);
	
	/*
	public String reviewstar(String uniq_id_num); 
	public String classcount(String uniq_id_num);
	public String latelyclass(String uniq_id_num);
	*/
	
	public String membergrade(String uniq_id_num);
}
