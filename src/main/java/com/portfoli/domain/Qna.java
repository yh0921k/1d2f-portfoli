package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;

public class Qna extends Board implements Serializable {
  private static final long serialVersionUID = 1L;
  private int memberNumber;
  private String writer;
  private int readable;
  private int emailNoti;
  private int smsNoti;
  private String answer;
  private Date answerDate;
  QnaCategory category;

  public int getMemberNumber() {
    return memberNumber;
  }

  public void setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public int getReadable() {
    return readable;
  }

  public void setReadable(int readable) {
    this.readable = readable;
  }

  public int getEmailNoti() {
    return emailNoti;
  }

  public void setEmailNoti(int emailNoti) {
    this.emailNoti = emailNoti;
  }

  public int getSmsNoti() {
    return smsNoti;
  }

  public void setSmsNoti(int smsNoti) {
    this.smsNoti = smsNoti;
  }

  public String getAnswer() {
    return answer;
  }

  public void setAnswer(String answer) {
    this.answer = answer;
  }

  public Date getAnswerDate() {
    return answerDate;
  }

  public void setAnswerDate(Date answerDate) {
    this.answerDate = answerDate;
  }

  public QnaCategory getCategory() {
    return category;
  }

  public void setCategory(QnaCategory category) {
    this.category = category;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((answer == null) ? 0 : answer.hashCode());
    result = prime * result + ((answerDate == null) ? 0 : answerDate.hashCode());
    result = prime * result + ((category == null) ? 0 : category.hashCode());
    result = prime * result + emailNoti;
    result = prime * result + memberNumber;
    result = prime * result + readable;
    result = prime * result + smsNoti;
    result = prime * result + ((writer == null) ? 0 : writer.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    Qna other = (Qna) obj;
    if (answer == null) {
      if (other.answer != null)
        return false;
    } else if (!answer.equals(other.answer))
      return false;
    if (answerDate == null) {
      if (other.answerDate != null)
        return false;
    } else if (!answerDate.equals(other.answerDate))
      return false;
    if (category == null) {
      if (other.category != null)
        return false;
    } else if (!category.equals(other.category))
      return false;
    if (emailNoti != other.emailNoti)
      return false;
    if (memberNumber != other.memberNumber)
      return false;
    if (readable != other.readable)
      return false;
    if (smsNoti != other.smsNoti)
      return false;
    if (writer == null) {
      if (other.writer != null)
        return false;
    } else if (!writer.equals(other.writer))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Qna [memberNumber=" + memberNumber + ", writer=" + writer + ", readable=" + readable
        + ", emailNoti=" + emailNoti + ", smsNoti=" + smsNoti + ", answer=" + answer
        + ", answerDate=" + answerDate + ", category=" + category + "]";
  }


}
