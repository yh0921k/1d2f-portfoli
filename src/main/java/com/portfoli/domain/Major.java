package com.portfoli.domain;

import java.io.Serializable;

public class Major implements Serializable {

  private static final long serialVersionUID = 1L;

  int majorNumber;
  String name;

  public Major setMajor(Major major) {
    this.majorNumber = major.majorNumber;
    this.name = major.name;
    return this;
  }


  public int getMajorNumber() {
    return majorNumber;
  }


  public void setMajorNumber(int majorNumber) {
    this.majorNumber = majorNumber;
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
    result = prime * result + majorNumber;
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
    Major other = (Major) obj;
    if (majorNumber != other.majorNumber)
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
    return "Major [majorNumber=" + majorNumber + ", name=" + name + "]";
  }

}
