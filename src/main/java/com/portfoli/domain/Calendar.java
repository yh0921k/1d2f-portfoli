package com.portfoli.domain;

import java.io.Serializable;

public class Calendar implements Serializable {

  private static final long serialVersionUID = 1L;

  int scheduleNumber, generalMemberNumber;
  String title, description, className, start, end;

  public int getScheduleNumber() {
    return scheduleNumber;
  }

  public void setScheduleNumber(int scheduleNumber) {
    this.scheduleNumber = scheduleNumber;
  }

  public int getGeneralMemberNumber() {
    return generalMemberNumber;
  }

  public void setGeneralMemberNumber(int generalMemberNumber) {
    this.generalMemberNumber = generalMemberNumber;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getClassName() {
    return className;
  }

  public void setClassName(String className) {
    this.className = className;
  }

  public String getStart() {
    return start;
  }

  public void setStart(String start) {
    this.start = start;
  }

  public String getEnd() {
    return end;
  }

  public void setEnd(String end) {
    this.end = end;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((className == null) ? 0 : className.hashCode());
    result = prime * result + ((description == null) ? 0 : description.hashCode());
    result = prime * result + ((end == null) ? 0 : end.hashCode());
    result = prime * result + generalMemberNumber;
    result = prime * result + scheduleNumber;
    result = prime * result + ((start == null) ? 0 : start.hashCode());
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
    Calendar other = (Calendar) obj;
    if (className == null) {
      if (other.className != null)
        return false;
    } else if (!className.equals(other.className))
      return false;
    if (description == null) {
      if (other.description != null)
        return false;
    } else if (!description.equals(other.description))
      return false;
    if (end == null) {
      if (other.end != null)
        return false;
    } else if (!end.equals(other.end))
      return false;
    if (generalMemberNumber != other.generalMemberNumber)
      return false;
    if (scheduleNumber != other.scheduleNumber)
      return false;
    if (start == null) {
      if (other.start != null)
        return false;
    } else if (!start.equals(other.start))
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
    return "Calendar [scheduleNumber=" + scheduleNumber + ", generalMemberNumber="
        + generalMemberNumber + ", title=" + title + ", description=" + description + ", className="
        + className + ", start=" + start + ", end=" + end + "]";
  }


}
