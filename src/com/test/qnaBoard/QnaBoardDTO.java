package com.test.qnaBoard;

public class QnaBoardDTO
{
   // 주요 속성 구성
   private String rn, qna_num, qna_title, qna_content, qna_wrt_date; 
   //-- 게시글 번호, 문의번호, 제목, 내용, 작성일
   private String uniq_id_num, user_nickname, qna_cat_name, qna_cat_code, qna_proc;
   //-- 고유식별번호, 닉네임, 카테고리, 답변여부
   
   // getter / setter 구성
   public String getQna_cat_code()
   {
      return qna_cat_code;
   }
   public void setQna_cat_code(String qna_cat_code)
   {
      this.qna_cat_code = qna_cat_code;
   }
   public String getRn()
   {
      return rn;
   }
   public void setRn(String rn)
   {
      this.rn = rn;
   }
   public String getQna_num()
   {
      return qna_num;
   }
   public void setQna_num(String qna_num)
   {
      this.qna_num = qna_num;
   }
   public String getQna_title()
   {
      return qna_title;
   }
   public void setQna_title(String qna_title)
   {
      this.qna_title = qna_title;
   }
   public String getQna_content()
   {
      return qna_content;
   }
   public void setQna_content(String qna_content)
   {
      this.qna_content = qna_content;
   }
   public String getQna_wrt_date()
   {
      return qna_wrt_date;
   }
   public void setQna_wrt_date(String qna_wrt_date)
   {
      this.qna_wrt_date = qna_wrt_date;
   }
   public String getUniq_id_num()
   {
      return uniq_id_num;
   }
   public void setUniq_id_num(String uniq_id_num)
   {
      this.uniq_id_num = uniq_id_num;
   }
   public String getUser_nickname()
   {
      return user_nickname;
   }
   public void setUser_nickname(String user_nickname)
   {
      this.user_nickname = user_nickname;
   }
   public String getQna_cat_name()
   {
      return qna_cat_name;
   }
   public void setQna_cat_name(String qna_cat_name)
   {
      this.qna_cat_name = qna_cat_name;
   }
   public String getQna_proc()
   {
      return qna_proc;
   }
   public void setQna_proc(String qna_proc)
   {
      this.qna_proc = qna_proc;
   }
}