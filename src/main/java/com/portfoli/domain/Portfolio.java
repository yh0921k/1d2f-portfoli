package com.portfoli.domain;

import java.util.List;

public class Portfolio extends Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;
  String homepage;
  String thumbnail;
  int recommendedCount;
  int readable;
  // 작성자의 id, 이름, 재직여부, 프로필사진, 멤버십, 이메일을 보관함
  GeneralMember member;
  List<Skill> skill;

  @Override
  public String toString() {
    return "Portfolio [homepage=" + homepage + ", thumbnail=" + thumbnail + ", recommendedCount="
        + recommendedCount + ", readable=" + readable + ", member=" + member + ", skill=" + skill
        + "] Board" + super.toString() + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + ((homepage == null) ? 0 : homepage.hashCode());
    result = prime * result + ((member == null) ? 0 : member.hashCode());
    result = prime * result + readable;
    result = prime * result + recommendedCount;
    result = prime * result + ((skill == null) ? 0 : skill.hashCode());
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
    if (homepage == null) {
      if (other.homepage != null)
        return false;
    } else if (!homepage.equals(other.homepage))
      return false;
    if (member == null) {
      if (other.member != null)
        return false;
    } else if (!member.equals(other.member))
      return false;
    if (readable != other.readable)
      return false;
    if (recommendedCount != other.recommendedCount)
      return false;
    if (skill == null) {
      if (other.skill != null)
        return false;
    } else if (!skill.equals(other.skill))
      return false;
    if (thumbnail == null) {
      if (other.thumbnail != null)
        return false;
    } else if (!thumbnail.equals(other.thumbnail))
      return false;
    return true;
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
  public GeneralMember getMember() {
    return this.member;
  }
  public Portfolio setMember(GeneralMember member) {
    this.member = member;
    return this;
  }
  public List<Skill> getSkill() {
    return skill;
  }
  public void setSkill(List<Skill> skill) {
    this.skill = skill;
  }






}
