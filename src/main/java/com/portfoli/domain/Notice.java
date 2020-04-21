package com.portfoli.domain;

import java.io.Serializable;

public class Notice implements Serializable {
  private static final long serialVersionUID = 1L;

  private int noticeNumber;
  private Board board;
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((board == null) ? 0 : board.hashCode());
    result = prime * result + noticeNumber;
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
    Notice other = (Notice) obj;
    if (board == null) {
      if (other.board != null)
        return false;
    } else if (!board.equals(other.board))
      return false;
    if (noticeNumber != other.noticeNumber)
      return false;
    return true;
  }
  @Override
  public String toString() {
    return "Notice [noticeNumber=" + noticeNumber + ", board=" + board + "]";
  }
  public int getNoticeNumber() {
    return noticeNumber;
  }
  public void setNoticeNumber(int noticeNumber) {
    this.noticeNumber = noticeNumber;
  }
  public Board getBoard() {
    return board;
  }
  public void setBoard(Board board) {
    this.board = board;
  }

  
  








}
