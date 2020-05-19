package com.portfoli.domain;

import java.io.Serializable;

public class ReportCategory implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number;
  private String category;

  @Override
  public String toString() {
    return "ReportCategory [number=" + number + ", category=" + category + "]";
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((category == null) ? 0 : category.hashCode());
    result = prime * result + number;
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
    ReportCategory other = (ReportCategory) obj;
    if (category == null) {
      if (other.category != null)
        return false;
    } else if (!category.equals(other.category))
      return false;
    if (number != other.number)
      return false;
    return true;
  }
}