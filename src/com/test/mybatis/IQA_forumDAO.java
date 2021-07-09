package com.test.mybatis;

import java.util.ArrayList;


public interface IQA_forumDAO
{

	public ArrayList<QA_forumDTO> qlist();
	public QA_forumDTO qread(String qa_forum_code);
	public int qadd(QA_forumDTO q);
	public int qmodify(QA_forumDTO q);
	public int qremove(QA_forumDTO q);
	public int updateHit(String qa_forum_code);
	public int qcount();
	public int qbkm(QA_forumDTO q);
	
}
