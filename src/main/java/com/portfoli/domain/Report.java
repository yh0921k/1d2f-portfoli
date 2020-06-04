package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Report extends Board implements Serializable {
  private static final long serialVersionUID = 1L;

  private int reporterNumber;
  private int targetNumber;
  private Member member;
  private List<BoardAttachment> attachments;
  private ReportCategory reportCategory;
  private int handleCategory;
  private Date handleDate;
  private String handleContent;

  private int ref, reStep;

  @Override
  public String toString() {
    return "Report [reporterNumber=" + reporterNumber + ", targetNumber=" + targetNumber
        + ", member=" + member + ", attachments=" + attachments + ", reportCategory="
        + reportCategory + ", handleCategory=" + handleCategory + ", handleDate=" + handleDate
        + ", handleContent=" + handleContent + ", ref=" + ref + ", reStep=" + reStep + "]";
  }

  public int getReporterNumber() {
    return reporterNumber;
  }

  public void setReporterNumber(int reporterNumber) {
    this.reporterNumber = reporterNumber;
  }

  public int getTargetNumber() {
    return targetNumber;
  }

  public void setTargetNumber(int targetNumber) {
    this.targetNumber = targetNumber;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  public List<BoardAttachment> getAttachments() {
    return attachments;
  }

  public void setAttachments(List<BoardAttachment> attachments) {
    this.attachments = attachments;
  }

  public ReportCategory getReportCategory() {
    return reportCategory;
  }

  public void setReportCategory(ReportCategory reportCategory) {
    this.reportCategory = reportCategory;
  }

  public int getHandleCategory() {
    return handleCategory;
  }

  public void setHandleCategory(int handleCategory) {
    this.handleCategory = handleCategory;
  }

  public Date getHandleDate() {
    return handleDate;
  }

  public void setHandleDate(Date handleDate) {
    this.handleDate = handleDate;
  }

  public String getHandleContent() {
    return handleContent;
  }

  public void setHandleContent(String handleContent) {
    this.handleContent = handleContent;
  }

  public int getRef() {
    return ref;
  }

  public void setRef(int ref) {
    this.ref = ref;
  }

  public int getReStep() {
    return reStep;
  }

  public void setReStep(int reStep) {
    this.reStep = reStep;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + handleCategory;
    result = prime * result + ((attachments == null) ? 0 : attachments.hashCode());
    result = prime * result + ((handleContent == null) ? 0 : handleContent.hashCode());
    result = prime * result + ((handleDate == null) ? 0 : handleDate.hashCode());
    result = prime * result + ((member == null) ? 0 : member.hashCode());
    result = prime * result + reStep;
    result = prime * result + ref;
    result = prime * result + ((reportCategory == null) ? 0 : reportCategory.hashCode());
    result = prime * result + reporterNumber;
    result = prime * result + targetNumber;
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
    Report other = (Report) obj;
    if (handleCategory != other.handleCategory)
      return false;
    if (attachments == null) {
      if (other.attachments != null)
        return false;
    } else if (!attachments.equals(other.attachments))
      return false;
    if (handleContent == null) {
      if (other.handleContent != null)
        return false;
    } else if (!handleContent.equals(other.handleContent))
      return false;
    if (handleDate == null) {
      if (other.handleDate != null)
        return false;
    } else if (!handleDate.equals(other.handleDate))
      return false;
    if (member == null) {
      if (other.member != null)
        return false;
    } else if (!member.equals(other.member))
      return false;
    if (reStep != other.reStep)
      return false;
    if (ref != other.ref)
      return false;
    if (reportCategory == null) {
      if (other.reportCategory != null)
        return false;
    } else if (!reportCategory.equals(other.reportCategory))
      return false;
    if (reporterNumber != other.reporterNumber)
      return false;
    if (targetNumber != other.targetNumber)
      return false;
    return true;
  }
}