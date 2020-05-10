package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;

public class QNA extends Board implements Serializable {
  private static final long serialVersionUID = 1L;
  private int memberNumber;
  private int categoryNumber;
  private int readable;
  private int emailNoti;
  private int smsNoti;
  private String answerContent;
  private Date answerDate;
  
  @Override
  public String toString() {
    return "QNA [memberNumber=" + memberNumber + ", categoryNumber=" + categoryNumber
        + ", readable=" + readable + ", emailNoti=" + emailNoti + ", smsNoti=" + smsNoti
        + ", answerContent=" + answerContent + ", answerDate=" + answerDate + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((answerContent == null) ? 0 : answerContent.hashCode());
    result = prime * result + ((answerDate == null) ? 0 : answerDate.hashCode());
    result = prime * result + categoryNumber;
    result = prime * result + emailNoti;
    result = prime * result + memberNumber;
    result = prime * result + readable;
    result = prime * result + smsNoti;
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
    QNA other = (QNA) obj;
    if (answerContent == null) {
      if (other.answerContent != null)
        return false;
    } else if (!answerContent.equals(other.answerContent))
      return false;
    if (answerDate == null) {
      if (other.answerDate != null)
        return false;
    } else if (!answerDate.equals(other.answerDate))
      return false;
    if (categoryNumber != other.categoryNumber)
      return false;
    if (emailNoti != other.emailNoti)
      return false;
    if (memberNumber != other.memberNumber)
      return false;
    if (readable != other.readable)
      return false;
    if (smsNoti != other.smsNoti)
      return false;
    return true;
  }
  public int getMemberNumber() {
    return memberNumber;
  }
  public QNA setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
    return this;
  }
  public int getCategoryNumber() {
    return categoryNumber;
  }
  public QNA setCategoryNumber(int categoryNumber) {
    this.categoryNumber = categoryNumber;
    return this;
  }
  public int getReadable() {
    return readable;
  }
  public QNA setReadable(int readable) {
    this.readable = readable;
    return this;
  }
  public int getEmailNoti() {
    return emailNoti;
  }
  public QNA setEmailNoti(int emailNoti) {
    this.emailNoti = emailNoti;
    return this;
  }
  public int getSmsNoti() {
    return smsNoti;
  }
  public QNA setSmsNoti(int smsNoti) {
    this.smsNoti = smsNoti;
    return this;
  }
  public String getAnswerContent() {
    return answerContent;
  }
  public QNA setAnswerContent(String answerContent) {
    this.answerContent = answerContent;
    return this;
  }
  public Date getAnswerDate() {
    return answerDate;
  }
  public QNA setAnswerDate(Date answerDate) {
    this.answerDate = answerDate;
    return this;
  }









}