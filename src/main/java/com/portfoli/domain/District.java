package com.portfoli.domain;

import java.io.Serializable;

public class District implements Serializable {
  private static final long serialVersionUID = 1L;

  private int districtNumber;
  private int cityNumber;
  private String name;

  public int getDistrictNumber() {
    return districtNumber;
  }

  public void setDistrictNumber(int districtNumber) {
    this.districtNumber = districtNumber;
  }

  public int getCityNumber() {
    return cityNumber;
  }

  public void setCityNumber(int cityNumber) {
    this.cityNumber = cityNumber;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + cityNumber;
    result = prime * result + districtNumber;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
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
    District other = (District) obj;
    if (cityNumber != other.cityNumber)
      return false;
    if (districtNumber != other.districtNumber)
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    return true;
  }



  @Override
  public String toString() {
    return "District [districtNumber=" + districtNumber + ", cityNumber=" + cityNumber + ", name="
        + name + "]";
  }


}
