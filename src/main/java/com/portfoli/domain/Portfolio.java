package com.portfoli.domain;

public class Portfolio extends Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;
  int generalMemberNumber;
  String homepage;
  String thumbnail;
  int recommendedCount;
  int readable;
  String memberName; //작성자명
  int memberNumber; //작성자ID
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + generalMemberNumber;
    result = prime * result + ((homepage == null) ? 0 : homepage.hashCode());
    result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
    result = prime * result + memberNumber;
    result = prime * result + readable;
    result = prime * result + recommendedCount;
    result = prime * result + ((thumbnail == null) ? 0 : thumbnail.hashCode());
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
    Portfolio other = (Portfolio) obj;
    if (generalMemberNumber != other.generalMemberNumber)
      return false;
    if (homepage == null) {
      if (other.homepage != null)
        return false;
    } else if (!homepage.equals(other.homepage))
      return false;
    if (memberName == null) {
      if (other.memberName != null)
        return false;
    } else if (!memberName.equals(other.memberName))
      return false;
    if (memberNumber != other.memberNumber)
      return false;
    if (readable != other.readable)
      return false;
    if (recommendedCount != other.recommendedCount)
      return false;
    if (thumbnail == null) {
      if (other.thumbnail != null)
        return false;
    } else if (!thumbnail.equals(other.thumbnail))
      return false;
    return true;
  }
  @Override
  public String toString() {
    return "Portfolio [generalMemberNumber=" + generalMemberNumber + ", homepage=" + homepage
        + ", thumbnail=" + thumbnail + ", recommendedCount=" + recommendedCount + ", readable="
        + readable + ", memberName=" + memberName + ", memberNumber=" + memberNumber + "]";
  }
  public int getGeneralMemberNumber() {
    return generalMemberNumber;
  }
  public Portfolio setGeneralMemberNumber(int generalMemberNumber) {
    this.generalMemberNumber = generalMemberNumber;
    return this;
  }
  public String getHomepage() {
    return homepage;
  }
  public Portfolio setHomepage(String homepage) {
    this.homepage = homepage;
    return this;
  }
  public String getThumbnail() {
    return thumbnail;
  }
  public Portfolio setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
    return this;
  }
  public int getRecommendedCount() {
    return recommendedCount;
  }
  public Portfolio setRecommendedCount(int recommendedCount) {
    this.recommendedCount = recommendedCount;
    return this;
  }
  public int getReadable() {
    return readable;
  }
  public Portfolio setReadable(int readable) {
    this.readable = readable;
    return this;
  }
  public String getMemberName() {
    return memberName;
  }
  public Portfolio setMemberName(String memberName) {
    this.memberName = memberName;
    return this;
  }
  public int getMemberNumber() {
    return memberNumber;
  }
  public Portfolio setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
    return this;
  }









}
