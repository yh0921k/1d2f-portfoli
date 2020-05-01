package com.portfoli.domain;

import java.io.Serializable;

public class Notice extends Board implements Serializable {
  private static final long serialVersionUID = 1L;
  private int noticeNumber;
  private String categoryName;
  
  @Override
  public String toString() {
    return "Notice [noticeNumber=" + noticeNumber + ", categoryName=" + categoryName + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((categoryName == null) ? 0 : categoryName.hashCode());
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
    if (categoryName == null) {
      if (other.categoryName != null)
        return false;
    } else if (!categoryName.equals(other.categoryName))
      return false;
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
  public String getCategoryName() {
    return categoryName;
  }
  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  

  
  
  

  
  








}