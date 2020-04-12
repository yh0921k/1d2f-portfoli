package com.portfoli.domain;

import java.io.Serializable;

public class CompanyMember extends Member implements Serializable {
  private static final long serialVersionUID = 1L;

  private String position;
  private Company company;

  @Override
  public String toString() {
    return "CompanyMember [position=" + position + ", company=" + company + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((company == null) ? 0 : company.hashCode());
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
    if (company == null) {
      if (other.company != null)
        return false;
    } else if (!company.equals(other.company))
      return false;
    if (position == null) {
      if (other.position != null)
        return false;
    } else if (!position.equals(other.position))
      return false;
    return true;
  }

  public String getPosition() {
    return position;
  }

  public void setPosition(String position) {
    this.position = position;
  }

  public Company getCompany() {
    return company;
  }

  public void setCompany(Company company) {
    this.company = company;
  }
}