package com.portfoli.domain;

import java.io.Serializable;

public class CompanyRequiredMajor extends Major implements Serializable {
  private static final long serialVersionUID = 1L;

  private int jobPostingNumber;

  public CompanyRequiredMajor() {}

  public CompanyRequiredMajor(int majorNumber, int jobPostingNumber) {
    this.majorNumber = majorNumber;
    this.jobPostingNumber = jobPostingNumber;
  }

  @Override
  public String toString() {
    return "CompanyRequiredMajor [jobPostingNumber=" + jobPostingNumber + ", majorNumber="
        + majorNumber + ", name=" + name + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = super.hashCode();
    result = prime * result + jobPostingNumber;
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
    CompanyRequiredMajor other = (CompanyRequiredMajor) obj;
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
