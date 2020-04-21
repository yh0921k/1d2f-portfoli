package com.portfoli.domain;

import java.io.Serializable;

public class Notice extends Board implements Serializable {
  private static final long serialVersionUID = 1L;

  private int noticeNumber;

  @Override
  public String toString() {
    return "Notice [noticeNumber=" + noticeNumber + "] " + super.toString();
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + noticeNumber;
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
    Notice other = (Notice) obj;
    if (noticeNumber != other.noticeNumber)
      return false;
    return true;
  }

  public int getNoticeNumber() {
    return noticeNumber;
  }

  public void setNoticeNumber(int noticeNumber) {
    this.noticeNumber = noticeNumber;
  }







}
