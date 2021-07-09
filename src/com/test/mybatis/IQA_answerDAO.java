package com.test.mybatis;

import java.util.ArrayList;

public interface IQA_answerDAO
{
	public ArrayList<QA_answerDTO> read(String qa_forum_code);
	public int add(QA_answerDTO a);
	public int remove(QA_answerDTO a);
	public int count(int qa_forum_code);
	public String answercheck(String qa_answ_code);
}
