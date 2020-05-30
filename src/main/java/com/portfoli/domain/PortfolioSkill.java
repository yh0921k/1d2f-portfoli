package com.portfoli.domain;

import java.io.Serializable;

public class PortfolioSkill implements Serializable {
  private static final long serialVersionUID = 1L;

  int boardNumber;
  int memberSkillNumber;

  public int getBoardNumber() {
    return boardNumber;
  }

  public void setBoardNumber(int boardNumber) {
    this.boardNumber = boardNumber;
  }

  public int getMemberSkillNumber() {
    return memberSkillNumber;
  }

  public void setMemberSkillNumber(int memberSkillNumber) {
    this.memberSkillNumber = memberSkillNumber;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + boardNumber;
    result = prime * result + memberSkillNumber;
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
    PortfolioSkill other = (PortfolioSkill) obj;
    if (boardNumber != other.boardNumber) {
      return false;
    }
    if (memberSkillNumber != other.memberSkillNumber) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "PortfolioSkill [boardNumber=" + boardNumber + ", memberSkillNumber=" + memberSkillNumber
        + "]";
  }


}
