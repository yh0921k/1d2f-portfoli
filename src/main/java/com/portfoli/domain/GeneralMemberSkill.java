package com.portfoli.domain;

import java.io.Serializable;

public class GeneralMemberSkill implements Serializable {

  private static final long serialVersionUID = 1L;

  int memberSkillNumber;
  int generalMemberNumber;
  int skillNumber;
  int level;

  public int getMemberSkillNumber() {
    return memberSkillNumber;
  }

  public void setMemberSkillNumber(int memberSkillNumber) {
    this.memberSkillNumber = memberSkillNumber;
  }

  public int getGeneralMemberNumber() {
    return generalMemberNumber;
  }

  public void setGeneralMemberNumber(int generalMemberNumber) {
    this.generalMemberNumber = generalMemberNumber;
  }

  public int getSkillNumber() {
    return skillNumber;
  }

  public void setSkillNumber(int skillNumber) {
    this.skillNumber = skillNumber;
  }

  public int getLevel() {
    return level;
  }

  public void setLevel(int level) {
    this.level = level;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + generalMemberNumber;
    result = prime * result + level;
    result = prime * result + memberSkillNumber;
    result = prime * result + skillNumber;
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
    GeneralMemberSkill other = (GeneralMemberSkill) obj;
    if (generalMemberNumber != other.generalMemberNumber) {
      return false;
    }
    if (level != other.level) {
      return false;
    }
    if (memberSkillNumber != other.memberSkillNumber) {
      return false;
    }
    if (skillNumber != other.skillNumber) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "GeneralMemberSkill [memberSkillNumber=" + memberSkillNumber + ", generalMemberNumber="
        + generalMemberNumber + ", skillNumber=" + skillNumber + ", level=" + level + "]";
  }



}
