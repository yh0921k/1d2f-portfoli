package com.portfoli.domain;

import java.io.Serializable;

public class CompanyRequiredCertificate extends Certificate implements Serializable {
  private static final long serialVersionUID = 1L;

  private int jobPostingNumber;

  public CompanyRequiredCertificate() {}

  public CompanyRequiredCertificate(int certificateNumber, int jobPostingNumber) {
    this.certificateNumber = certificateNumber;
    this.jobPostingNumber = jobPostingNumber;
  }

  @Override
  public String toString() {
    return "CompanyRequiredCertificate [certificateNumber=" + certificateNumber
        + ", jobPostingNumber=" + jobPostingNumber + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + certificateNumber;
    result = prime * result + jobPostingNumber;
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
    CompanyRequiredCertificate other = (CompanyRequiredCertificate) obj;
    if (certificateNumber != other.certificateNumber)
      return false;
    if (jobPostingNumber != other.jobPostingNumber)
      return false;
    return true;
  }

  public int getJobPostingNumber() {
    return jobPostingNumber;
  }

  public void setJobPostingNumber(int jobPostingNumber) {
    this.jobPostingNumber = jobPostingNumber;
  }

}
