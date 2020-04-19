package com.portfoli.domain;

import java.sql.Date;

public /*abstract*/ class Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;

  int number;
  String title;
  String content;
  int viewCount;
  Date registeredDate;
  String attachment;

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (attachment == null ? 0 : attachment.hashCode());
    result = prime * result + (content == null ? 0 : content.hashCode());
    result = prime * result + number;
    result = prime * result + (registeredDate == null ? 0 : registeredDate.hashCode());
    result = prime * result + (title == null ? 0 : title.hashCode());
    result = prime * result + viewCount;
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
    Board other = (Board) obj;
    if (attachment == null) {
      if (other.attachment != null)
        return false;
    } else if (!attachment.equals(other.attachment))
      return false;
    if (content == null) {
      if (other.content != null)
        return false;
    } else if (!content.equals(other.content))
      return false;
    if (number != other.number)
      return false;
    if (registeredDate == null) {
      if (other.registeredDate != null)
        return false;
    } else if (!registeredDate.equals(other.registeredDate))
      return false;
    if (title == null) {
      if (other.title != null)
        return false;
    } else if (!title.equals(other.title))
      return false;
    if (viewCount != other.viewCount)
      return false;
    return true;
  }
  @Override
  public String toString() {
    return "Board [number=" + number + ", title=" + title + ", content=" + content + ", viewCount="
        + viewCount + ", registeredDate=" + registeredDate + ", attachment=" + attachment + "]";
  }
  public int getNumber() {
    return number;
  }
  public void setNumber(int number) {
    this.number = number;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getViewCount() {
    return viewCount;
  }
  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }
  public String getAttachment() {
    return attachment;
  }
  public void setAttachment(String attachment) {
    this.attachment = attachment;
  }



}
