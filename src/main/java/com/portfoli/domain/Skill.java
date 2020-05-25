package com.portfoli.domain;

import java.io.Serializable;

public class Skill implements Serializable {
  private static final long serialVersionUID = 1L;
  private int skillNumber; // 기술번호
  private String category; // 기술구분
  private String name; // 기술명
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((category == null) ? 0 : category.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + skillNumber;
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
    Skill other = (Skill) obj;
    if (category == null) {
      if (other.category != null)
        return false;
    } else if (!category.equals(other.category))
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (skillNumber != other.skillNumber)
      return false;
    return true;
  }
  @Override
  public String toString() {
    return "Skill [skillNumber=" + skillNumber + ", category=" + category + ", name=" + name + "]";
  }
  public int getSkillNumber() {
    return skillNumber;
  }
  public void setSkillNumber(int skillNumber) {
    this.skillNumber = skillNumber;
  }
  public String getCategory() {
    return category;
  }
  public void setCategory(String category) {
    this.category = category;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }

 
  
  
  
}