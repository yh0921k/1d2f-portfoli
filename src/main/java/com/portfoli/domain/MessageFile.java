package com.portfoli.domain;

import java.io.Serializable;

public class MessageFile implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number;
  private int messageNumber;
  private String fileName;
  private String filePath;

  @Override
  public String toString() {
    return "MessageFile [number=" + number + ", messageNumber=" + messageNumber + ", fileName="
        + fileName + ", filePath=" + filePath + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
    result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
    result = prime * result + messageNumber;
    result = prime * result + number;
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
    MessageFile other = (MessageFile) obj;
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
    if (messageNumber != other.messageNumber)
      return false;
    if (number != other.number)
      return false;
    return true;
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public int getMessageNumber() {
    return messageNumber;
  }

  public void setMessageNumber(int messageNumber) {
    this.messageNumber = messageNumber;
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