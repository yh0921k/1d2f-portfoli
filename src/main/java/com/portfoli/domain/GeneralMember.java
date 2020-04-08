package com.portfoli.domain;

import java.io.Serializable;

public class GeneralMember extends Member implements Serializable {

  private static final long serialVersionUID = 1L;

  public GeneralMember() {
    super();
  }

  private int seekingFlag, career;
  private String photoFilePath, membereship;

  public int getSeekingFlag() {
    return seekingFlag;
  }

  public void setSeekingFlag(int seekingFlag) {
    this.seekingFlag = seekingFlag;
  }

  public int getCareer() {
    return career;
  }

  public void setCareer(int career) {
    this.career = career;
  }

  public String getPhotoFilePath() {
    return photoFilePath;
  }

  public void setPhotoFilePath(String photoFilePath) {
    this.photoFilePath = photoFilePath;
  }

  public String getMembereship() {
    return membereship;
  }

  public void setMembereship(String membereship) {
    this.membereship = membereship;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + career;
    result = prime * result + ((membereship == null) ? 0 : membereship.hashCode());
    result = prime * result + ((photoFilePath == null) ? 0 : photoFilePath.hashCode());
    result = prime * result + seekingFlag;
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
    GeneralMember other = (GeneralMember) obj;
    if (career != other.career)
      return false;
    if (membereship == null) {
      if (other.membereship != null)
        return false;
    } else if (!membereship.equals(other.membereship))
      return false;
    if (photoFilePath == null) {
      if (other.photoFilePath != null)
        return false;
    } else if (!photoFilePath.equals(other.photoFilePath))
      return false;
    if (seekingFlag != other.seekingFlag)
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "GeneralMember [seekingFlag=" + seekingFlag + ", career=" + career + ", photoFilePath="
        + photoFilePath + ", membereship=" + membereship + "]";
  }

}
