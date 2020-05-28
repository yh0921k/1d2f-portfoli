package com.portfoli.domain;

import java.io.Serializable;

public class Skill implements Serializable {
  private static final long serialVersionUID = 1L;
  int number;
  String name;

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
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
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + number;
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
    Skill other = (Skill) obj;
    if (name == null) {
      if (other.name != null) {
        return false;
      }
    } else if (!name.equals(other.name)) {
      return false;
    }
    if (number != other.number) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "Skill [number=" + number + ", name=" + name + "]";
  }

}
