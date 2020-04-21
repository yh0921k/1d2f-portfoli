package com.portfoli.domain;

import java.io.Serializable;

public class CompanyMember extends Member implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number, companyNumber;
  private String position;

  @Override
  public int getNumber() {
    return number;
  }

  @Override
  public void setNumber(int number) {
    this.number = number;
  }

  public int getCompanyNumber() {
    return companyNumber;
  }

  public void setCompanyNumber(int companyNumber) {
    this.companyNumber = companyNumber;
  }

  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + companyNumber;
    result = prime * result + number;
    result = prime * result + ((position == null) ? 0 : position.hashCode());
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
    CompanyMember other = (CompanyMember) obj;
    if (companyNumber != other.companyNumber)
      return false;
    if (number != other.number)
      return false;
    if (position == null) {
      if (other.position != null)
        return false;
    } else if (!position.equals(other.position))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "CompanyMember [number=" + number + ", companyNumber=" + companyNumber + ", position="
        + position + "]";
  }


}
