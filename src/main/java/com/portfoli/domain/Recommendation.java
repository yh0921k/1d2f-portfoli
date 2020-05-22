package com.portfoli.domain;

public class Recommendation extends Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;
  Member member;
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((member == null) ? 0 : member.hashCode());
    return result;
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    Recommendation other = (Recommendation) obj;
    if (member == null) {
      if (other.member != null)
        return false;
    } else if (!member.equals(other.member))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Recommendation [member=" + member + ", number=" + number + ", title=" + title
        + ", content=" + content + ", viewCount=" + viewCount + ", registeredDate=" + registeredDate
        + ", startIndex=" + startIndex + ", pageSize=" + pageSize + "]";
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }


  






}
