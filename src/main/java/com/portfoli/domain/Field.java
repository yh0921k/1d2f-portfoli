package com.portfoli.domain;

import java.io.Serializable;
import java.util.List;

public class Field implements Serializable {
  private static final long serialVersionUID = 1L;

  int number;
  String name;
  List<Skill> list;

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

  public List<Skill> getList() {
    return list;
  }

  public void setList(List<Skill> list) {
    this.list = list;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((list == null) ? 0 : list.hashCode());
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
    Field other = (Field) obj;
    if (list == null) {
      if (other.list != null) {
        return false;
      }
    } else if (!list.equals(other.list)) {
      return false;
    }
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
    return "Field [number=" + number + ", name=" + name + ", list=" + list + "]";
  }


}
