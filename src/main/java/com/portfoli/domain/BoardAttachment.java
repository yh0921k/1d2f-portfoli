package com.portfoli.domain;

import java.io.Serializable;

public class BoardAttachment implements Serializable {
  private static final long serialVersionUID = 1L;
  
  private int attachmentNumber, boardNumber;
  private String fileName, filePath;
  
  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + attachmentNumber;
    result = prime * result + boardNumber;
    result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
    result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
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
    BoardAttachment other = (BoardAttachment) obj;
    if (attachmentNumber != other.attachmentNumber)
      return false;
    if (boardNumber != other.boardNumber)
      return false;
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
    return true;
  }
  @Override
  public String toString() {
    return "BoardAttachment [attachmentNumber=" + attachmentNumber + ", boardNumber=" + boardNumber
        + ", fileName=" + fileName + ", filePath=" + filePath + "]";
  }
  public int getAttachmentNumber() {
    return attachmentNumber;
  }
  public void setAttachmentNumber(int attachmentNumber) {
    this.attachmentNumber = attachmentNumber;
  }
  public int getBoardNumber() {
    return boardNumber;
  }
  public void setBoardNumber(int boardNumber) {
    this.boardNumber = boardNumber;
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

  

  
  
  
  
}