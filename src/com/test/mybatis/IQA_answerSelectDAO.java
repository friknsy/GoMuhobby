package com.test.mybatis;

public interface IQA_answerSelectDAO
{
	public int add(QA_answerSelectDTO s);
	public int remove(QA_answerSelectDTO s);
	public int select(int qa_forum_code);
}
