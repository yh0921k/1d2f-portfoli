package com.portfoli.domain;

import java.io.Serializable;

public class Skill implements Serializable {
  private static final long serialVersionUID = 1L;
  // 기술번호 (소분류)
  int number;
  // 기술이름 (소분류)
  String name;
  // 분야번호 (대분류)
  int fieldNumber;
  // 분야이름 (대분류)
  String fieldName;

  public int getNumber() {
    return number;
  }
  public Skill setNumber(int number) {
    this.number = number;
    return this;
  }
  public String getName() {
    return name;
  }
  public Skill setName(String name) {
    this.name = name;
    return this;
  }
  public int getFieldNumber() {
    return fieldNumber;
  }
  public Skill setFieldNumber(int fieldNumber) {
    this.fieldNumber = fieldNumber;
    return this;
  }
  public String getFieldName() {
    return fieldName;
  }
  public Skill setFieldName(String fieldName) {
    this.fieldName = fieldName;
    return this;
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (fieldName == null ? 0 : fieldName.hashCode());
    result = prime * result + fieldNumber;
    result = prime * result + (name == null ? 0 : name.hashCode());
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
    if (fieldName == null) {
      if (other.fieldName != null) {
        return false;
      }
    } else if (!fieldName.equals(other.fieldName)) {
      return false;
    }
    if (fieldNumber != other.fieldNumber) {
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
    return "Skill [number=" + number + ", name=" + name + ", fieldNumber=" + fieldNumber
        + ", fieldName=" + fieldName + "]";
  }



}
