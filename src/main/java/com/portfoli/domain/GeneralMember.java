package com.portfoli.domain;

import java.io.Serializable;

public class GeneralMember extends Member implements Serializable {

  private static final long serialVersionUID = 1L;

  private int number, seekingFlag, career;
  private String membership;

  public GeneralMember() {
    super();
  }

  @Override
  public int getNumber() {
    return number;
  }

  @Override
  public GeneralMember setNumber(int number) {
    this.number = number;
    return this;
  }

  public int getSeekingFlag() {
    return seekingFlag;
  }

  public GeneralMember setSeekingFlag(int seekingFlag) {
    this.seekingFlag = seekingFlag;
    return this;
  }

  public int getCareer() {
    return career;
  }

  public GeneralMember setCareer(int career) {
    this.career = career;
    return this;
  }

  public String getMembereship() {
    return membership;
  }

  public GeneralMember setMembereship(String membereship) {
    this.membership = membereship;
    return this;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + career;
    result = prime * result + (membership == null ? 0 : membership.hashCode());
    result = prime * result + number;
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
    if (membership == null) {
      if (other.membership != null)
        return false;
    } else if (!membership.equals(other.membership))
      return false;
    if (number != other.number)
      return false;
    if (seekingFlag != other.seekingFlag)
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "GeneralMember [number=" + number + ", type=" + super.getType() + ", smsYN="
        + super.getSmsYN() + ", emailYN=" + super.getEmailYN() + ", id=" + super.getId()
        + ", password=" + super.getPassword() + ", name=" + super.getName() + ", postNumber="
        + super.getPostNumber() + ", basicAddress=" + super.getBasicAddress() + ", detailAddress="
        + super.getDetailAddress() + ", email=" + super.getEmail() + ", tel=" + super.getTel()
        + ", createDate=" + super.getCreateDate() + ", seekingFlag=" + seekingFlag + ", career="
        + career + ", membereship=" + membership + "]";
  }

}
