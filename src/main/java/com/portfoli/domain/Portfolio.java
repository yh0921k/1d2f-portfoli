package com.portfoli.domain;

public class Portfolio extends Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;
  int generalMemberNumber;
  String homepage;
  String thumbnail;
  int recommendedCount;
  int readable;
  String memberName; //작성자명
  String id;       // 아이디
  int seekingFlag; // 구직여부

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
  public String getId() {
    return id;
  }
  public Portfolio setId(String id) {
    this.id = id;
    return this;
  }
  public int getSeekingFlag() {
    return seekingFlag;
  }
  public Portfolio setSeekingFlag(int seekingFlag) {
    this.seekingFlag = seekingFlag;
    return this;
  }











}
