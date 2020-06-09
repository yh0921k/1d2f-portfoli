package com.portfoli.domain;

import java.io.Serializable;

public class Visitor implements Serializable {
  private static final long serialVersionUID = 1L;

  private int visitNumber;
  private String visitIp;
  private String visitTime;
  private String visitRefer;
  private String visitAgent;

  @Override
  public String toString() {
    return "VisitCount [visitNumber=" + visitNumber + ", visitIp=" + visitIp + ", visitTime="
        + visitTime + ", visitRefer=" + visitRefer + ", visitAgent=" + visitAgent + "]";
  }

  public int getVisitNumber() {
    return visitNumber;
  }
  public void setVisitNumber(int visitNumber) {
    this.visitNumber = visitNumber;
  }
  public String getVisitIp() {
    return visitIp;
  }
  public void setVisitIp(String visitIp) {
    this.visitIp = visitIp;
  }

  public String getVisitTime() {
    return visitTime;
  }

  public void setVisitTime(String visitTime) {
    this.visitTime = visitTime;
  }
  public String getVisitRefer() {
    return visitRefer;
  }
  public void setVisitRefer(String visitRefer) {
    this.visitRefer = visitRefer;
  }
  public String getVisitAgent() {
    return visitAgent;
  }
  public void setVisitAgent(String visitAgent) {
    this.visitAgent = visitAgent;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((visitAgent == null) ? 0 : visitAgent.hashCode());
    result = prime * result + ((visitIp == null) ? 0 : visitIp.hashCode());
    result = prime * result + visitNumber;
    result = prime * result + ((visitRefer == null) ? 0 : visitRefer.hashCode());
    result = prime * result + ((visitTime == null) ? 0 : visitTime.hashCode());
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
    Visitor other = (Visitor) obj;
    if (visitAgent == null) {
      if (other.visitAgent != null)
        return false;
    } else if (!visitAgent.equals(other.visitAgent))
      return false;
    if (visitIp == null) {
      if (other.visitIp != null)
        return false;
    } else if (!visitIp.equals(other.visitIp))
      return false;
    if (visitNumber != other.visitNumber)
      return false;
    if (visitRefer == null) {
      if (other.visitRefer != null)
        return false;
    } else if (!visitRefer.equals(other.visitRefer))
      return false;
    if (visitTime == null) {
      if (other.visitTime != null)
        return false;
    } else if (!visitTime.equals(other.visitTime))
      return false;
    return true;
  }
}