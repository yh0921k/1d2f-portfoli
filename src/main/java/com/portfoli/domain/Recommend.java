package com.portfoli.domain;

import java.io.Serializable;
import java.util.List;

public class Recommend implements Serializable {
  private static final long serialVersionUID = 1L;

  int memberNumber;
  String name;

  int career;

  int educationNumber;
  String educationName;

  int seekingFlag;
  List<Portfolio> portfolios;
  List<District> districts;
  List<Skill> skills;

  public int getMemberNumber() {
    return memberNumber;
  }

  public void setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getCareer() {
    return career;
  }

  public void setCareer(int career) {
    this.career = career;
  }

  public int getEducationNumber() {
    return educationNumber;
  }

  public void setEducationNumber(int educationNumber) {
    this.educationNumber = educationNumber;
  }

  public String getEducationName() {
    return educationName;
  }

  public void setEducationName(String educationName) {
    this.educationName = educationName;
  }

  public int getSeekingFlag() {
    return seekingFlag;
  }

  public void setSeekingFlag(int seekingFlag) {
    this.seekingFlag = seekingFlag;
  }

  public List<Portfolio> getPortfolios() {
    return portfolios;
  }

  public void setPortfolios(List<Portfolio> portfolios) {
    this.portfolios = portfolios;
  }

  public List<District> getDistricts() {
    return districts;
  }

  public void setDistricts(List<District> districts) {
    this.districts = districts;
  }

  public List<Skill> getSkills() {
    return skills;
  }

  public void setSkills(List<Skill> skills) {
    this.skills = skills;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + career;
    result = prime * result + ((districts == null) ? 0 : districts.hashCode());
    result = prime * result + ((educationName == null) ? 0 : educationName.hashCode());
    result = prime * result + educationNumber;
    result = prime * result + memberNumber;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((portfolios == null) ? 0 : portfolios.hashCode());
    result = prime * result + seekingFlag;
    result = prime * result + ((skills == null) ? 0 : skills.hashCode());
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
    Recommend other = (Recommend) obj;
    if (career != other.career) {
      return false;
    }
    if (districts == null) {
      if (other.districts != null) {
        return false;
      }
    } else if (!districts.equals(other.districts)) {
      return false;
    }
    if (educationName == null) {
      if (other.educationName != null) {
        return false;
      }
    } else if (!educationName.equals(other.educationName)) {
      return false;
    }
    if (educationNumber != other.educationNumber) {
      return false;
    }
    if (memberNumber != other.memberNumber) {
      return false;
    }
    if (name == null) {
      if (other.name != null) {
        return false;
      }
    } else if (!name.equals(other.name)) {
      return false;
    }
    if (portfolios == null) {
      if (other.portfolios != null) {
        return false;
      }
    } else if (!portfolios.equals(other.portfolios)) {
      return false;
    }
    if (seekingFlag != other.seekingFlag) {
      return false;
    }
    if (skills == null) {
      if (other.skills != null) {
        return false;
      }
    } else if (!skills.equals(other.skills)) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "Recommend [memberNumber=" + memberNumber + ", name=" + name + ", career=" + career
        + ", educationNumber=" + educationNumber + ", educationName=" + educationName
        + ", seekingFlag=" + seekingFlag + ", portfolios=" + portfolios + ", districts=" + districts
        + ", skills=" + skills + "]";
  }
}
