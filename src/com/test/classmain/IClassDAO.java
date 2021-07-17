package com.test.classmain;

import java.util.ArrayList;

public interface IClassDAO
{
	public ArrayList<ClassDTO> listAll();		// 전체 
	public ArrayList<ClassDTO> listNew();		// 신규
	public ArrayList<ClassDTO> listRegion(String uniq_id_num);	// 지역
	public ArrayList<ClassDTO> listMusic(String uniq_id_num);		// 음악
	
	public int countAll();
	public int countRegion();
	public int countMusic();
}
