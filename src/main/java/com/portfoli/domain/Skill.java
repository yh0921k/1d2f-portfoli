package com.portfoli.domain;

import java.io.Serializable;

public class Skill implements Serializable {
  private static final long serialVersionUID = 1L;
  int number; // 기술번호
  int fieldNumber; // 분야번호
  String name; // 기술이름

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

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
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
    return "Skill [number=" + number + ", fieldNumber=" + fieldNumber + ", name=" + name + "]";
  }


}
