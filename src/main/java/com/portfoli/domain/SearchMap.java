package com.portfoli.domain;

import java.io.Serializable;

public class SearchMap implements Serializable {
  private static final long serialVersionUID = 1L;
  private int number;
  private String keyword;
  private int startIndex;
  private int pageSize;

  public int getNumber() {
    return number;
  }

  public SearchMap setNumber(int number) {
    this.number = number;
    return this;
  }

  public String getKeyword() {
    return keyword;
  }

  public SearchMap setKeyword(String keyword) {
    this.keyword = keyword;
    return this;
  }

  public int getStartIndex() {
    return startIndex;
  }

  public SearchMap setStartIndex(int startIndex) {
    this.startIndex = startIndex;
    return this;
  }

  public int getPageSize() {
    return pageSize;
  }

  public SearchMap setPageSize(int pageSize) {
    this.pageSize = pageSize;
    return this;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (keyword == null ? 0 : keyword.hashCode());
    result = prime * result + number;
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    SearchMap other = (SearchMap) obj;
    if (keyword == null) {
      if (other.keyword != null) {
        return false;
      }
    } else if (!keyword.equals(other.keyword)) {
      return false;
    }
    if (number != other.number) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "SearchMap [number=" + number + ", keyword=" + keyword + ", startIndex=" + startIndex
        + ", pageSize=" + pageSize + "]";
  }



}
