package com.portfoli.domain;

import java.io.Serializable;

public class Notice extends Board implements Serializable {
  private static final long serialVersionUID = 1L;
  private int categoryNumber;
  private String categoryName;

  @Override
  public String toString() {
    return "Notice [categoryNumber=" + categoryNumber + ", categoryName=" + categoryName + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + categoryNumber;
    result = prime * result + (categoryName == null ? 0 : categoryName.hashCode());
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
    if (categoryNumber != other.categoryNumber)
      return false;
    if (categoryName == null) {
      if (other.categoryName != null)
        return false;
    } else if (!categoryName.equals(other.categoryName))
      return false;
    return true;
  }
  public int getCategoryNumber() {
    return categoryNumber;
  }
  public Notice setCategoryNumber(int categoryNumber) {
    this.categoryNumber = categoryNumber;
    return this;
  }
  public String getCategoryName() {
    return categoryName;
  }
  public Notice setCategoryName(String categoryName) {
    this.categoryName = categoryName;
    return this;
  }
  @Override
  public Notice setPageSize(int pageSize) {
    this.pageSize = pageSize;
    return this;
  }
  @Override
  public Notice setStartIndex(int startIndex) {
    this.startIndex = startIndex;
    return this;
  }












}