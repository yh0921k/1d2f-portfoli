package com.portfoli.domain;

import java.io.Serializable;

public class GeneralMemberEducation implements Serializable {

  private static final long serialVersionUID = 1L;

  int generalMemberNumber;
  int educationNumber;
  String schoolName;
  FinalEducation finalEducation;



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



  public String getSchoolName() {
    return schoolName;
  }



  public void setSchoolName(String schoolName) {
    this.schoolName = schoolName;
  }



  public FinalEducation getFinalEducation() {
    return finalEducation;
  }



  public void setFinalEducation(FinalEducation finalEducation) {
    this.finalEducation = finalEducation;
  }



  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + educationNumber;
    result = prime * result + ((finalEducation == null) ? 0 : finalEducation.hashCode());
    result = prime * result + generalMemberNumber;
    result = prime * result + ((schoolName == null) ? 0 : schoolName.hashCode());
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
    GeneralMemberEducation other = (GeneralMemberEducation) obj;
    if (educationNumber != other.educationNumber)
      return false;
    if (finalEducation == null) {
      if (other.finalEducation != null)
        return false;
    } else if (!finalEducation.equals(other.finalEducation))
      return false;
    if (generalMemberNumber != other.generalMemberNumber)
      return false;
    if (schoolName == null) {
      if (other.schoolName != null)
        return false;
    } else if (!schoolName.equals(other.schoolName))
      return false;
    return true;
  }



  @Override
  public String toString() {
    return "GeneralMemberEducation [generalMemberNumber=" + generalMemberNumber
        + ", educationNumber=" + educationNumber + ", schoolName=" + schoolName
        + ", finalEducation=" + finalEducation + "]";
  }



}
