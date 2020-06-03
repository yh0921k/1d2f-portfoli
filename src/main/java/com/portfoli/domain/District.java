package com.portfoli.domain;

import java.io.Serializable;

public class District implements Serializable {
  private static final long serialVersionUID = 1L;

  private int districtNumber;
  private int cityNumber;
  private String cityName;
  private String name;

  public int getDistrictNumber() {
    return districtNumber;
  }

  public District setDistrictNumber(int districtNumber) {
    this.districtNumber = districtNumber;
    return this;
  }

  public int getCityNumber() {
    return cityNumber;
  }

  public String getCityName() {
    return cityName;
  }

  public District setCityName(String cityName) {
    this.cityName = cityName;
    return this;
  }

  public District setCityNumber(int cityNumber) {
    this.cityNumber = cityNumber;
    return this;
  }

  public String getName() {
    return name;
  }

  public District setName(String name) {
    this.name = name;
    return this;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (cityName == null ? 0 : cityName.hashCode());
    result = prime * result + cityNumber;
    result = prime * result + districtNumber;
    result = prime * result + (name == null ? 0 : name.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    District other = (District) obj;
    if (cityName == null) {
      if (other.cityName != null) {
        return false;
      }
    } else if (!cityName.equals(other.cityName)) {
      return false;
    }
    if (cityNumber != other.cityNumber) {
      return false;
    }
    if (districtNumber != other.districtNumber) {
      return false;
    }
    if (name == null) {
      if (other.name != null) {
        return false;
      }
    } else if (!name.equals(other.name)) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "District [districtNumber=" + districtNumber + ", cityNumber=" + cityNumber
        + ", cityName=" + cityName + ", name=" + name + "]";
  }



}
