package com.test.professor_forum;

import java.util.ArrayList;

public interface IProf_ForumDAO
{
	public ArrayList<Prof_ForumDTO> list();
	public Prof_ForumDTO read();
	public int add (Prof_ForumDTO f);
	public int modify (Prof_ForumDTO f);
	public int remove (Prof_ForumDTO f);
	public int count();
}
