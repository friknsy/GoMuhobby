package com.test.professor_forum;

import java.util.ArrayList;

public interface IProf_Forum_ReplyDAO
{
	public ArrayList<IProf_Forum_ReplyDAO> list();
	public Prof_ForumDTO read();
	public int add (Prof_Forum_ReplyDTO r);
	public int modify (IProf_Forum_ReplyDAO r);
	public int remove (IProf_Forum_ReplyDAO r);
	public int count();
	
}
