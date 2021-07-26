package com.test.professor_forum;

import java.util.ArrayList;

public interface IProf_Forum_ReplyDAO
{
	public ArrayList<Prof_Forum_ReplyDTO> list();
	public Prof_Forum_ReplyDTO read();
	public int add (Prof_Forum_ReplyDTO r);
	public int modify (Prof_Forum_ReplyDTO r);
	public int remove (Prof_Forum_ReplyDTO r);
	public int count();
	
}
