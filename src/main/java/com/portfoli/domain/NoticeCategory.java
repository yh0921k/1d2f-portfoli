package com.portfoli.domain;

import java.io.Serializable;

public class NoticeCategory implements Serializable {
  private static final long serialVersionUID = 1L;

  private int noticeNumber;
  private String name;
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + noticeNumber;
    return result;
  }
  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    NoticeCategory other = (NoticeCategory) obj;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (noticeNumber != other.noticeNumber)
      return false;
    return true;
  }
  @Override
  public String toString() {
    return "NoticeCategory [noticeNumber=" + noticeNumber + ", name=" + name + "]";
  }
  public int getNoticeNumber() {
    return noticeNumber;
  }
  public void setNoticeNumber(int noticeNumber) {
    this.noticeNumber = noticeNumber;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }

  

  
  








}
