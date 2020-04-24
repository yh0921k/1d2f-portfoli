package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Message implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number;
  private int senderNumber;
  private int receiverNumber;
  private String title;
  private String content;
  private Date sendDate;
  private Date receiveDate;
  private int senderDelete;
  private int receiverDelete;
  private List<MessageFile> files;

  private Member member;

  @Override
  public String toString() {
    return "Message [number=" + number + ", senderNumber=" + senderNumber + ", receiverNumber="
        + receiverNumber + ", title=" + title + ", content=" + content + ", sendDate=" + sendDate
        + ", receiveDate=" + receiveDate + ", senderDelete=" + senderDelete + ", receiverDelete="
        + receiverDelete + ", files=" + files + ", member=" + member + "]";
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public int getSenderNumber() {
    return senderNumber;
  }

  public void setSenderNumber(int senderNumber) {
    this.senderNumber = senderNumber;
  }

  public int getReceiverNumber() {
    return receiverNumber;
  }

  public void setReceiverNumber(int receiverNumber) {
    this.receiverNumber = receiverNumber;
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

  public Date getSendDate() {
    return sendDate;
  }

  public void setSendDate(Date sendDate) {
    this.sendDate = sendDate;
  }

  public Date getReceiveDate() {
    return receiveDate;
  }

  public void setReceiveDate(Date receiveDate) {
    this.receiveDate = receiveDate;
  }

  public int getSenderDelete() {
    return senderDelete;
  }

  public void setSenderDelete(int senderDelete) {
    this.senderDelete = senderDelete;
  }

  public int getReceiverDelete() {
    return receiverDelete;
  }

  public void setReceiverDelete(int receiverDelete) {
    this.receiverDelete = receiverDelete;
  }

  public List<MessageFile> getFiles() {
    return files;
  }

  public void setFiles(List<MessageFile> files) {
    this.files = files;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((content == null) ? 0 : content.hashCode());
    result = prime * result + ((files == null) ? 0 : files.hashCode());
    result = prime * result + ((member == null) ? 0 : member.hashCode());
    result = prime * result + number;
    result = prime * result + ((receiveDate == null) ? 0 : receiveDate.hashCode());
    result = prime * result + receiverDelete;
    result = prime * result + receiverNumber;
    result = prime * result + ((sendDate == null) ? 0 : sendDate.hashCode());
    result = prime * result + senderDelete;
    result = prime * result + senderNumber;
    result = prime * result + ((title == null) ? 0 : title.hashCode());
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
    Message other = (Message) obj;
    if (content == null) {
      if (other.content != null)
        return false;
    } else if (!content.equals(other.content))
      return false;
    if (files == null) {
      if (other.files != null)
        return false;
    } else if (!files.equals(other.files))
      return false;
    if (member == null) {
      if (other.member != null)
        return false;
    } else if (!member.equals(other.member))
      return false;
    if (number != other.number)
      return false;
    if (receiveDate == null) {
      if (other.receiveDate != null)
        return false;
    } else if (!receiveDate.equals(other.receiveDate))
      return false;
    if (receiverDelete != other.receiverDelete)
      return false;
    if (receiverNumber != other.receiverNumber)
      return false;
    if (sendDate == null) {
      if (other.sendDate != null)
        return false;
    } else if (!sendDate.equals(other.sendDate))
      return false;
    if (senderDelete != other.senderDelete)
      return false;
    if (senderNumber != other.senderNumber)
      return false;
    if (title == null) {
      if (other.title != null)
        return false;
    } else if (!title.equals(other.title))
      return false;
    return true;
  }
}