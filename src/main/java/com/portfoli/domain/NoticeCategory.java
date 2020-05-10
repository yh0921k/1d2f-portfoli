package com.portfoli.domain;

import java.io.Serializable;

public class NoticeCategory implements Serializable {
  private static final long serialVersionUID = 1L;

  private int categoryNumber;
  private String name;
  private int startIndex;
  private int pageSize;

  @Override
  public String toString() {
    return "NoticeCategory [categoryNumber=" + categoryNumber + ", name=" + name + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + categoryNumber;
    result = prime * result + (name == null ? 0 : name.hashCode());
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
    if (categoryNumber != other.categoryNumber)
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    return true;
  }
  public int getCategoryNumber() {
    return categoryNumber;
  }
  public NoticeCategory setCategoryNumber(int categoryNumber) {
    this.categoryNumber = categoryNumber;
    return this;
  }
  public String getName() {
    return name;
  }
  public NoticeCategory setName(String name) {
    this.name = name;
    return this;
  }
  public int getPageSize() {
    return pageSize;
  }
  public NoticeCategory setPageSize(int pageSize) {
    this.pageSize = pageSize;
    return this;
  }
  public int getStartIndex() {
    return startIndex;
  }
  public NoticeCategory setStartIndex(int startIndex) {
    this.startIndex = startIndex;
    return this;
  }















}
