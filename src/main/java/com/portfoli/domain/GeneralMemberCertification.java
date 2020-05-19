package com.portfoli.domain;

import java.io.Serializable;

public class GeneralMemberCertification implements Serializable {

  private static final long serialVersionUID = 1L;

  int memberNumber;
  int certificateNumber;
  String issueDate, expireDate;
  Certificate certificate;

  public int getMemberNumber() {
    return memberNumber;
  }

  public void setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
  }

  public int getCertificateNumber() {
    return certificateNumber;
  }

  public void setCertificateNumber(int certificateNumber) {
    this.certificateNumber = certificateNumber;
  }

  public String getIssueDate() {
    return issueDate.substring(0, 10);
  }

  public void setIssueDate(String issueDate) {
    this.issueDate = issueDate;
  }

  public String getExpireDate() {
    if(expireDate != null) {
    return expireDate.substring(0, 10);
    } else {
      return "";
    }
  }

  public void setExpireDate(String expireDate) {
    this.expireDate = expireDate;
  }

  public Certificate getCertificate() {
    return certificate;
  }

  public void setCertificate(Certificate certificate) {
    this.certificate = certificate;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((certificate == null) ? 0 : certificate.hashCode());
    result = prime * result + certificateNumber;
    result = prime * result + ((expireDate == null) ? 0 : expireDate.hashCode());
    result = prime * result + ((issueDate == null) ? 0 : issueDate.hashCode());
    result = prime * result + memberNumber;
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
    GeneralMemberCertification other = (GeneralMemberCertification) obj;
    if (certificate == null) {
      if (other.certificate != null)
        return false;
    } else if (!certificate.equals(other.certificate))
      return false;
    if (certificateNumber != other.certificateNumber)
      return false;
    if (expireDate == null) {
      if (other.expireDate != null)
        return false;
    } else if (!expireDate.equals(other.expireDate))
      return false;
    if (issueDate == null) {
      if (other.issueDate != null)
        return false;
    } else if (!issueDate.equals(other.issueDate))
      return false;
    if (memberNumber != other.memberNumber)
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "GeneralMemberCertification [memberNumber=" + memberNumber + ", certificateNumber="
        + certificateNumber + ", issueDate=" + issueDate + ", expireDate=" + expireDate
        + ", certificate=" + certificate + "]";
  }


}
