package com.portfoli.domain;

import java.io.Serializable;
import java.util.Date;

public class Banner implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number;
  private int companyNumber;
  private String title;
  private String filePath;
  private String url;
  private Date registeredDate;
  private Date startDate;
  private Date endDate;
  private boolean activateYN;

  @Override
  public String toString() {
    return "Banner [number=" + number + ", companyNumber=" + companyNumber + ", title=" + title
        + ", filePath=" + filePath + ", url=" + url + ", registeredDate=" + registeredDate
        + ", startDate=" + startDate + ", endDate=" + endDate + ", activateYN=" + activateYN + "]";
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public int getCompanyNumber() {
    return companyNumber;
  }

  public void setCompanyNumber(int companyNumber) {
    this.companyNumber = companyNumber;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public Date getRegisteredDate() {
    return registeredDate;
  }

  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public Date getEndDate() {
    return endDate;
  }

  public void setEndDate(Date endDate) {
    this.endDate = endDate;
  }

  public boolean isActivateYN() {
    return activateYN;
  }

  public void setActivateYN(boolean activateYN) {
    this.activateYN = activateYN;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (activateYN ? 1231 : 1237);
    result = prime * result + companyNumber;
    result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
    result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
    result = prime * result + number;
    result = prime * result + ((registeredDate == null) ? 0 : registeredDate.hashCode());
    result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
    result = prime * result + ((title == null) ? 0 : title.hashCode());
    result = prime * result + ((url == null) ? 0 : url.hashCode());
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
    Banner other = (Banner) obj;
    if (activateYN != other.activateYN)
      return false;
    if (companyNumber != other.companyNumber)
      return false;
    if (endDate == null) {
      if (other.endDate != null)
        return false;
    } else if (!endDate.equals(other.endDate))
      return false;
    if (filePath == null) {
      if (other.filePath != null)
        return false;
    } else if (!filePath.equals(other.filePath))
      return false;
    if (number != other.number)
      return false;
    if (registeredDate == null) {
      if (other.registeredDate != null)
        return false;
    } else if (!registeredDate.equals(other.registeredDate))
      return false;
    if (startDate == null) {
      if (other.startDate != null)
        return false;
    } else if (!startDate.equals(other.startDate))
      return false;
    if (title == null) {
      if (other.title != null)
        return false;
    } else if (!title.equals(other.title))
      return false;
    if (url == null) {
      if (other.url != null)
        return false;
    } else if (!url.equals(other.url))
      return false;
    return true;
  }
}