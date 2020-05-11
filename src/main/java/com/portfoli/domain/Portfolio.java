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
  String fileName; // 첨부파일명
  String filePath; // 첨부파일
  String id;       // 아이디
  int seekingFlag; // 구직여부

  @Override
  public String toString() {
    return "Portfolio [generalMemberNumber=" + generalMemberNumber + ", homepage=" + homepage
        + ", thumbnail=" + thumbnail + ", recommendedCount=" + recommendedCount + ", readable="
        + readable + ", memberName=" + memberName + ", memberNumber=" + memberNumber + ", fileName="
        + fileName + ", filePath=" + filePath + ", id=" + id + ", seekingFlag=" + seekingFlag + "]";
  }
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + (fileName == null ? 0 : fileName.hashCode());
    result = prime * result + (filePath == null ? 0 : filePath.hashCode());
    result = prime * result + generalMemberNumber;
    result = prime * result + (homepage == null ? 0 : homepage.hashCode());
    result = prime * result + (id == null ? 0 : id.hashCode());
    result = prime * result + (memberName == null ? 0 : memberName.hashCode());
    result = prime * result + memberNumber;
    result = prime * result + readable;
    result = prime * result + recommendedCount;
    result = prime * result + seekingFlag;
    result = prime * result + (thumbnail == null ? 0 : thumbnail.hashCode());
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
    if (fileName == null) {
      if (other.fileName != null)
        return false;
    } else if (!fileName.equals(other.fileName))
      return false;
    if (filePath == null) {
      if (other.filePath != null)
        return false;
    } else if (!filePath.equals(other.filePath))
      return false;
    if (generalMemberNumber != other.generalMemberNumber)
      return false;
    if (homepage == null) {
      if (other.homepage != null)
        return false;
    } else if (!homepage.equals(other.homepage))
      return false;
    if (id == null) {
      if (other.id != null)
        return false;
    } else if (!id.equals(other.id))
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
    if (seekingFlag != other.seekingFlag)
      return false;
    if (thumbnail == null) {
      if (other.thumbnail != null)
        return false;
    } else if (!thumbnail.equals(other.thumbnail))
      return false;
    return true;
  }
  public int getGeneralMemberNumber() {
    return generalMemberNumber;
  }
  public void setGeneralMemberNumber(int generalMemberNumber) {
    this.generalMemberNumber = generalMemberNumber;
  }
  public String getHomepage() {
    return homepage;
  }
  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }
  public String getThumbnail() {
    return thumbnail;
  }
  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }
  public int getRecommendedCount() {
    return recommendedCount;
  }
  public void setRecommendedCount(int recommendedCount) {
    this.recommendedCount = recommendedCount;
  }
  public int getReadable() {
    return readable;
  }
  public void setReadable(int readable) {
    this.readable = readable;
  }
  public String getMemberName() {
    return memberName;
  }
  public void setMemberName(String memberName) {
    this.memberName = memberName;
  }
  public int getMemberNumber() {
    return memberNumber;
  }
  public void setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
  }
  public String getFileName() {
    return fileName;
  }
  public void setFileName(String fileName) {
    this.fileName = fileName;
  }
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public int getSeekingFlag() {
    return seekingFlag;
  }
  public void setSeekingFlag(int seekingFlag) {
    this.seekingFlag = seekingFlag;
  }











}
