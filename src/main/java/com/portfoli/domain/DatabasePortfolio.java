package com.portfoli.domain;

public class DatabasePortfolio implements java.io.Serializable {
  private static final long serialVersionUID = 1L;

  int boardNumber;
  int generalMemberNumber;
  int readable;
  String title;
  String homepage;
  String thumbnail;

  public int getBoardNumber() {
    return boardNumber;
  }

  public void setBoardNumber(int boardNumber) {
    this.boardNumber = boardNumber;
  }

  public int getGeneralMemberNumber() {
    return generalMemberNumber;
  }

  public void setGeneralMemberNumber(int generalMemberNumber) {
    this.generalMemberNumber = generalMemberNumber;
  }

  public int getReadable() {
    return readable;
  }

  public void setReadable(int readable) {
    this.readable = readable;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
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

  public static long getSerialversionuid() {
    return serialVersionUID;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + boardNumber;
    result = prime * result + generalMemberNumber;
    result = prime * result + ((homepage == null) ? 0 : homepage.hashCode());
    result = prime * result + readable;
    result = prime * result + ((thumbnail == null) ? 0 : thumbnail.hashCode());
    result = prime * result + ((title == null) ? 0 : title.hashCode());
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
    DatabasePortfolio other = (DatabasePortfolio) obj;
    if (boardNumber != other.boardNumber)
      return false;
    if (generalMemberNumber != other.generalMemberNumber)
      return false;
    if (homepage == null) {
      if (other.homepage != null)
        return false;
    } else if (!homepage.equals(other.homepage))
      return false;
    if (readable != other.readable)
      return false;
    if (thumbnail == null) {
      if (other.thumbnail != null)
        return false;
    } else if (!thumbnail.equals(other.thumbnail))
      return false;
    if (title == null) {
      if (other.title != null)
        return false;
    } else if (!title.equals(other.title))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "DatabasePortfolio [boardNumber=" + boardNumber + ", generalMemberNumber="
        + generalMemberNumber + ", readable=" + readable + ", title=" + title + ", homepage="
        + homepage + ", thumbnail=" + thumbnail + "]";
  }

}
