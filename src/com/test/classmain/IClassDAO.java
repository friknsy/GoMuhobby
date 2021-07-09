package com.test.classmain;

import java.util.ArrayList;

public interface IClassDAO
{
	public ArrayList<ClassDTO> listAll();		// 전체 
	public ArrayList<ClassDTO> listNew();		// 신규
	public ArrayList<ClassDTO> listRegion();	// 지역
	public ArrayList<ClassDTO> listMusic();		// 음악
	
	public int countAll();
	public int countRegion();
	public int countMusic();
}
