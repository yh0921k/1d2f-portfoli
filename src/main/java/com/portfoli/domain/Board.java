package com.portfoli.domain;

import java.sql.Date;

public /*abstract*/ class Board implements java.io.Serializable{
  private static final long serialVersionUID = 1L;
  int number;
  String title;
  String content;
  int viewCount;
  Date registeredDate;
  protected int startIndex;
  protected int pageSize;

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
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
        + viewCount + ", registeredDate=" + registeredDate + "]";
  }
  public int getNumber() {
    return number;
  }
  public Board setNumber(int number) {
    this.number = number;
    return this;
  }
  public String getTitle() {
    return title;
  }
  public Board setTitle(String title) {
    this.title = title;
    return this;
  }
  public String getContent() {
    return content;
  }
  public Board setContent(String content) {
    this.content = content;
    return this;
  }
  public int getViewCount() {
    return viewCount;
  }
  public Board setViewCount(int viewCount) {
    this.viewCount = viewCount;
    return this;
  }
  public Date getRegisteredDate() {
    return registeredDate;
  }
  public Board setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
    return this;
  }
  public Board setBoard(Board board) {
    this.number = board.number;
    this.title = board.title;
    this.content = board.content;
    this.viewCount = board.viewCount;
    this.registeredDate = board.registeredDate;
    return this;
  }
  public int getPageSize() {
    return pageSize;
  }
  public Board setPageSize(int pageSize) {
    this.pageSize = pageSize;
    return this;
  }
  public int getStartIndex() {
    return startIndex;
  }
  public Board setStartIndex(int startIndex) {
    this.startIndex = startIndex;
    return this;
  }








}
