package com.portfoli.domain;

import java.io.Serializable;

public class Company implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number;
  private String businessRegistrationNumber;
  private String name;
  private String tel;

  @Override
  public String toString() {
    return "Company [number=" + number + ", businessRegistrationNumber="
        + businessRegistrationNumber + ", name=" + name + ", tel=" + tel + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result
        + ((businessRegistrationNumber == null) ? 0 : businessRegistrationNumber.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + number;
    result = prime * result + ((tel == null) ? 0 : tel.hashCode());
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
    Company other = (Company) obj;
    if (businessRegistrationNumber == null) {
      if (other.businessRegistrationNumber != null)
        return false;
    } else if (!businessRegistrationNumber.equals(other.businessRegistrationNumber))
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (number != other.number)
      return false;
    if (tel == null) {
      if (other.tel != null)
        return false;
    } else if (!tel.equals(other.tel))
      return false;
    return true;
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public String getBusinessRegistrationNumber() {
    return businessRegistrationNumber;
  }

  public void setBusinessRegistrationNumber(String businessRegistrationNumber) {
    this.businessRegistrationNumber = businessRegistrationNumber;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }
}