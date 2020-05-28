package com.portfoli.domain;

import java.io.Serializable;

public class GeneralMemberEducationMajor implements Serializable {

  private static final long serialVersionUID = 1L;

  int generalMemberNumber;
  int educationNumber;
  int majorNumber;


  public int getGeneralMemberNumber() {
    return generalMemberNumber;
  }

  public void setGeneralMemberNumber(int generalMemberNumber) {
    this.generalMemberNumber = generalMemberNumber;
  }

  public int getEducationNumber() {
    return educationNumber;
  }

  public void setEducationNumber(int educationNumber) {
    this.educationNumber = educationNumber;
  }

  public int getMajorNumber() {
    return majorNumber;
  }

  public void setMajorNumber(int majorNumber) {
    this.majorNumber = majorNumber;
  }



  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + educationNumber;
    result = prime * result + generalMemberNumber;
    result = prime * result + majorNumber;
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
    GeneralMemberEducationMajor other = (GeneralMemberEducationMajor) obj;
    if (educationNumber != other.educationNumber)
      return false;
    if (generalMemberNumber != other.generalMemberNumber)
      return false;
    if (majorNumber != other.majorNumber)
      return false;
    return true;
  }



  @Override
  public String toString() {
    return "GeneralMemberEducationMajor [generalMemberNumber=" + generalMemberNumber
        + ", educationNumber=" + educationNumber + ", majorNumber=" + majorNumber + "]";
  }



}
