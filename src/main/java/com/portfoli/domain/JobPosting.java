package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;;

public class JobPosting implements Serializable {
  private static final long serialVersionUID = 1L;

  private int jobPostingNumber;
  private int companyMemberNumber;
  private String title;
  private String content;
  private int workPlaceNumber;
  private int minimumCareer;
  private int viewCount;
  private Date postingRegistration;
  private Date startDated;
  private Date endDated;
  private String job;
  private int yearSalary;
  private int readable;
  private int minimumEducationNumber;
  private EmploymentStatus employmentStatus;
  private Certificate certificate;
  private Major major;
  private District district;
  List<JobPostingFile> files;

  @Override
  public String toString() {
    return "JobPosting [jobPostingNumber=" + jobPostingNumber + ", companyMemberNumber="
        + companyMemberNumber + ", title=" + title + ", content=" + content + ", workPlaceNumber="
        + workPlaceNumber + ", minimumCareer=" + minimumCareer + ", viewCount=" + viewCount
        + ", postingRegistration=" + postingRegistration + ", startDated=" + startDated
        + ", endDated=" + endDated + ", job=" + job + ", yearSalary=" + yearSalary + ", readable="
        + readable + ", minimumEducationNumber=" + minimumEducationNumber + ", employmentStatus="
        + employmentStatus + ", certificate=" + certificate + ", major=" + major + ", district="
        + district + ", files=" + files + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((certificate == null) ? 0 : certificate.hashCode());
    result = prime * result + companyMemberNumber;
    result = prime * result + ((content == null) ? 0 : content.hashCode());
    result = prime * result + ((district == null) ? 0 : district.hashCode());
    result = prime * result + ((employmentStatus == null) ? 0 : employmentStatus.hashCode());
    result = prime * result + ((endDated == null) ? 0 : endDated.hashCode());
    result = prime * result + ((files == null) ? 0 : files.hashCode());
    result = prime * result + ((job == null) ? 0 : job.hashCode());
    result = prime * result + jobPostingNumber;
    result = prime * result + ((major == null) ? 0 : major.hashCode());
    result = prime * result + minimumCareer;
    result = prime * result + minimumEducationNumber;
    result = prime * result + ((postingRegistration == null) ? 0 : postingRegistration.hashCode());
    result = prime * result + readable;
    result = prime * result + ((startDated == null) ? 0 : startDated.hashCode());
    result = prime * result + ((title == null) ? 0 : title.hashCode());
    result = prime * result + viewCount;
    result = prime * result + workPlaceNumber;
    result = prime * result + yearSalary;
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
    JobPosting other = (JobPosting) obj;
    if (certificate == null) {
      if (other.certificate != null)
        return false;
    } else if (!certificate.equals(other.certificate))
      return false;
    if (companyMemberNumber != other.companyMemberNumber)
      return false;
    if (content == null) {
      if (other.content != null)
        return false;
    } else if (!content.equals(other.content))
      return false;
    if (district == null) {
      if (other.district != null)
        return false;
    } else if (!district.equals(other.district))
      return false;
    if (employmentStatus == null) {
      if (other.employmentStatus != null)
        return false;
    } else if (!employmentStatus.equals(other.employmentStatus))
      return false;
    if (endDated == null) {
      if (other.endDated != null)
        return false;
    } else if (!endDated.equals(other.endDated))
      return false;
    if (files == null) {
      if (other.files != null)
        return false;
    } else if (!files.equals(other.files))
      return false;
    if (job == null) {
      if (other.job != null)
        return false;
    } else if (!job.equals(other.job))
      return false;
    if (jobPostingNumber != other.jobPostingNumber)
      return false;
    if (major == null) {
      if (other.major != null)
        return false;
    } else if (!major.equals(other.major))
      return false;
    if (minimumCareer != other.minimumCareer)
      return false;
    if (minimumEducationNumber != other.minimumEducationNumber)
      return false;
    if (postingRegistration == null) {
      if (other.postingRegistration != null)
        return false;
    } else if (!postingRegistration.equals(other.postingRegistration))
      return false;
    if (readable != other.readable)
      return false;
    if (startDated == null) {
      if (other.startDated != null)
        return false;
    } else if (!startDated.equals(other.startDated))
      return false;
    if (title == null) {
      if (other.title != null)
        return false;
    } else if (!title.equals(other.title))
      return false;
    if (viewCount != other.viewCount)
      return false;
    if (workPlaceNumber != other.workPlaceNumber)
      return false;
    if (yearSalary != other.yearSalary)
      return false;
    return true;
  }

  public Major getMajor() {
    return major;
  }

  public void setMajor(Major major) {
    this.major = major;
  }

  public Certificate getCertificate() {
    return certificate;
  }

  public void setCertificate(Certificate certificate) {
    this.certificate = certificate;
  }

  public int getJobPostingNumber() {
    return jobPostingNumber;
  }

  public void setJobPostingNumber(int jobPostingNumber) {
    this.jobPostingNumber = jobPostingNumber;
  }

  public int getCompanyMemberNumber() {
    return companyMemberNumber;
  }

  public void setCompanyMemberNumber(int companyMemberNumber) {
    this.companyMemberNumber = companyMemberNumber;
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

  public int getWorkPlaceNumber() {
    return workPlaceNumber;
  }

  public void setWorkPlaceNumber(int workPlaceNumber) {
    this.workPlaceNumber = workPlaceNumber;
  }

  public int getMinimumCareer() {
    return minimumCareer;
  }

  public void setMinimumCareer(int minimumCareer) {
    this.minimumCareer = minimumCareer;
  }

  public int getViewCount() {
    return viewCount;
  }

  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }

  public Date getPostingRegistration() {
    return postingRegistration;
  }

  public void setPostingRegistration(Date postingRegistration) {
    this.postingRegistration = postingRegistration;
  }

  public Date getStartDated() {
    return startDated;
  }

  public void setStartDated(Date startDated) {
    this.startDated = startDated;
  }

  public Date getEndDated() {
    return endDated;
  }

  public void setEndDated(Date endDated) {
    this.endDated = endDated;
  }

  public String getJob() {
    return job;
  }

  public void setJob(String job) {
    this.job = job;
  }

  public int getYearSalary() {
    return yearSalary;
  }

  public void setYearSalary(int yearSalary) {
    this.yearSalary = yearSalary;
  }

  public int getReadable() {
    return readable;
  }

  public void setReadable(int readable) {
    this.readable = readable;
  }

  public int getMinimumEducationNumber() {
    return minimumEducationNumber;
  }

  public void setMinimumEducationNumber(int minimumEducationNumber) {
    this.minimumEducationNumber = minimumEducationNumber;
  }

  public EmploymentStatus getEmploymentStatus() {
    return employmentStatus;
  }

  public void setEmploymentStatus(EmploymentStatus employmentStatus) {
    this.employmentStatus = employmentStatus;
  }

  public District getDistrict() {
    return district;
  }

  public void setDistrict(District district) {
    this.district = district;
  }

  public List<JobPostingFile> getFiles() {
    return files;
  }

  public void setFiles(List<JobPostingFile> files) {
    this.files = files;
  }

}
