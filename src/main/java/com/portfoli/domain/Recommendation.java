package com.portfoli.domain;

import java.sql.Date;

public class Recommendation extends Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;
  Portfolio portfolio;
  Member member;
  int count;
  Date startDate;
  Date endDate;

  @Override
  public String toString() {
    return "Recommendation [portfolio=" + portfolio + ", member=" + member + ", count=" + count
        + ", startDate=" + startDate + ", endDate=" + endDate + "] + " + super.toString();
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + count;
    result = prime * result + (endDate == null ? 0 : endDate.hashCode());
    result = prime * result + (member == null ? 0 : member.hashCode());
    result = prime * result + (portfolio == null ? 0 : portfolio.hashCode());
    result = prime * result + (startDate == null ? 0 : startDate.hashCode());
    return result;
  }
  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (!super.equals(obj)) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    Recommendation other = (Recommendation) obj;
    if (count != other.count) {
      return false;
    }
    if (endDate == null) {
      if (other.endDate != null) {
        return false;
      }
    } else if (!endDate.equals(other.endDate)) {
      return false;
    }
    if (member == null) {
      if (other.member != null) {
        return false;
      }
    } else if (!member.equals(other.member)) {
      return false;
    }
    if (portfolio == null) {
      if (other.portfolio != null) {
        return false;
      }
    } else if (!portfolio.equals(other.portfolio)) {
      return false;
    }
    if (startDate == null) {
      if (other.startDate != null) {
        return false;
      }
    } else if (!startDate.equals(other.startDate)) {
      return false;
    }
    return true;
  }
  public Member getMember() {
    return member;
  }
  public Recommendation setMember(Member member) {
    this.member = member;
    return this;
  }
  public int getCount() {
    return count;
  }
  public Recommendation setCount(int count) {
    this.count = count;
    return this;
  }
  public Date getStartDate() {
    return startDate;
  }
  public Recommendation setStartDate(Date startDate) {
    this.startDate = startDate;
    return this;
  }
  public Date getEndDate() {
    return endDate;
  }
  public Recommendation setEndDate(Date endDate) {
    this.endDate = endDate;
    return this;
  }
  public Portfolio getPortfolio() {
    return portfolio;
  }
  public Recommendation setPortfolio(Portfolio portfolio) {
    this.portfolio = portfolio;
    return this;
  }







}
