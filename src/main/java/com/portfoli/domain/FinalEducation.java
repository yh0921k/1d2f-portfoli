package com.portfoli.domain;

import java.io.Serializable;

public class FinalEducation implements Serializable {

  private static final long serialVersionUID = 1L;

  int educationNumber;
  String category;

  public int getEducationNumber() {
    return educationNumber;
  }

  public void setEducationNumber(int educationNumber) {
    this.educationNumber = educationNumber;
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
    result = prime * result + educationNumber;
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
    FinalEducation other = (FinalEducation) obj;
    if (category == null) {
      if (other.category != null)
        return false;
    } else if (!category.equals(other.category))
      return false;
    if (educationNumber != other.educationNumber)
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "FinalEducation [educationNumber=" + educationNumber + ", category=" + category + "]";
  }

}
