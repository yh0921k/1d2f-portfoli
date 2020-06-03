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
  private String minimumCareer;
  private int viewCount;
  private Date postingRegistration;
  private Date startDated;
  private Date endDated;
  private String job;
  private int yearSalary;
  private int readable;
  private String tel;
  private int minimumEducationNumber;
  private EmploymentStatus employmentStatus;
  private Certificate certificate;
  private Major major;
  private District district;
  private FinalEducation finalEducation;
  private CompanyMember companyMember;
  private Member member;
  private Company company;
  private Field field;
  private Skill skill;
  // 페이징 관련 임시변수
  protected int startIndex;
  protected int pageSize;

  List<JobPostingFile> files;

  @Override
  public String toString() {
    return "JobPosting [jobPostingNumber=" + jobPostingNumber + ", companyMemberNumber="
        + companyMemberNumber + ", title=" + title + ", content=" + content + ", workPlaceNumber="
        + workPlaceNumber + ", minimumCareer=" + minimumCareer + ", viewCount=" + viewCount
        + ", postingRegistration=" + postingRegistration + ", startDated=" + startDated
        + ", endDated=" + endDated + ", job=" + job + ", yearSalary=" + yearSalary + ", readable="
        + readable + ", tel=" + tel + ", minimumEducationNumber=" + minimumEducationNumber
        + ", employmentStatus=" + employmentStatus + ", certificate=" + certificate + ", major="
        + major + ", district=" + district + ", finalEducation=" + finalEducation
        + ", companyMember=" + companyMember + ", member=" + member + ", company=" + company
        + ", field=" + field + ", skill=" + skill + ", files=" + files + "]";
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (certificate == null ? 0 : certificate.hashCode());
    result = prime * result + (company == null ? 0 : company.hashCode());
    result = prime * result + (companyMember == null ? 0 : companyMember.hashCode());
    result = prime * result + companyMemberNumber;
    result = prime * result + (content == null ? 0 : content.hashCode());
    result = prime * result + (district == null ? 0 : district.hashCode());
    result = prime * result + (employmentStatus == null ? 0 : employmentStatus.hashCode());
    result = prime * result + (endDated == null ? 0 : endDated.hashCode());
    result = prime * result + (field == null ? 0 : field.hashCode());
    result = prime * result + (files == null ? 0 : files.hashCode());
    result = prime * result + (finalEducation == null ? 0 : finalEducation.hashCode());
    result = prime * result + (job == null ? 0 : job.hashCode());
    result = prime * result + jobPostingNumber;
    result = prime * result + (major == null ? 0 : major.hashCode());
    result = prime * result + (member == null ? 0 : member.hashCode());
    result = prime * result + (minimumCareer == null ? 0 : minimumCareer.hashCode());
    result = prime * result + minimumEducationNumber;
    result = prime * result + (postingRegistration == null ? 0 : postingRegistration.hashCode());
    result = prime * result + readable;
    result = prime * result + (skill == null ? 0 : skill.hashCode());
    result = prime * result + (startDated == null ? 0 : startDated.hashCode());
    result = prime * result + (tel == null ? 0 : tel.hashCode());
    result = prime * result + (title == null ? 0 : title.hashCode());
    result = prime * result + viewCount;
    result = prime * result + workPlaceNumber;
    result = prime * result + yearSalary;
    return result;
  }



  @Override
  public boolean equals(Object obj) {
    if (this == obj) {
      return true;
    }
    if (obj == null) {
      return false;
    }
    if (getClass() != obj.getClass()) {
      return false;
    }
    JobPosting other = (JobPosting) obj;
    if (certificate == null) {
      if (other.certificate != null) {
        return false;
      }
    } else if (!certificate.equals(other.certificate)) {
      return false;
    }
    if (company == null) {
      if (other.company != null) {
        return false;
      }
    } else if (!company.equals(other.company)) {
      return false;
    }
    if (companyMember == null) {
      if (other.companyMember != null) {
        return false;
      }
    } else if (!companyMember.equals(other.companyMember)) {
      return false;
    }
    if (companyMemberNumber != other.companyMemberNumber) {
      return false;
    }
    if (content == null) {
      if (other.content != null) {
        return false;
      }
    } else if (!content.equals(other.content)) {
      return false;
    }
    if (district == null) {
      if (other.district != null) {
        return false;
      }
    } else if (!district.equals(other.district)) {
      return false;
    }
    if (employmentStatus == null) {
      if (other.employmentStatus != null) {
        return false;
      }
    } else if (!employmentStatus.equals(other.employmentStatus)) {
      return false;
    }
    if (endDated == null) {
      if (other.endDated != null) {
        return false;
      }
    } else if (!endDated.equals(other.endDated)) {
      return false;
    }
    if (field == null) {
      if (other.field != null) {
        return false;
      }
    } else if (!field.equals(other.field)) {
      return false;
    }
    if (files == null) {
      if (other.files != null) {
        return false;
      }
    } else if (!files.equals(other.files)) {
      return false;
    }
    if (finalEducation == null) {
      if (other.finalEducation != null) {
        return false;
      }
    } else if (!finalEducation.equals(other.finalEducation)) {
      return false;
    }
    if (job == null) {
      if (other.job != null) {
        return false;
      }
    } else if (!job.equals(other.job)) {
      return false;
    }
    if (jobPostingNumber != other.jobPostingNumber) {
      return false;
    }
    if (major == null) {
      if (other.major != null) {
        return false;
      }
    } else if (!major.equals(other.major)) {
      return false;
    }
    if (member == null) {
      if (other.member != null) {
        return false;
      }
    } else if (!member.equals(other.member)) {
      return false;
    }
    if (minimumCareer == null) {
      if (other.minimumCareer != null) {
        return false;
      }
    } else if (!minimumCareer.equals(other.minimumCareer)) {
      return false;
    }
    if (minimumEducationNumber != other.minimumEducationNumber) {
      return false;
    }
    if (postingRegistration == null) {
      if (other.postingRegistration != null) {
        return false;
      }
    } else if (!postingRegistration.equals(other.postingRegistration)) {
      return false;
    }
    if (readable != other.readable) {
      return false;
    }
    if (skill == null) {
      if (other.skill != null) {
        return false;
      }
    } else if (!skill.equals(other.skill)) {
      return false;
    }
    if (startDated == null) {
      if (other.startDated != null) {
        return false;
      }
    } else if (!startDated.equals(other.startDated)) {
      return false;
    }
    if (tel == null) {
      if (other.tel != null) {
        return false;
      }
    } else if (!tel.equals(other.tel)) {
      return false;
    }
    if (title == null) {
      if (other.title != null) {
        return false;
      }
    } else if (!title.equals(other.title)) {
      return false;
    }
    if (viewCount != other.viewCount) {
      return false;
    }
    if (workPlaceNumber != other.workPlaceNumber) {
      return false;
    }
    if (yearSalary != other.yearSalary) {
      return false;
    }
    return true;
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

  public String getMinimumCareer() {
    return minimumCareer;
  }

  public void setMinimumCareer(String minimumCareer) {
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

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
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

  public Certificate getCertificate() {
    return certificate;
  }

  public void setCertificate(Certificate certificate) {
    this.certificate = certificate;
  }

  public Major getMajor() {
    return major;
  }

  public void setMajor(Major major) {
    this.major = major;
  }

  public District getDistrict() {
    return district;
  }

  public void setDistrict(District district) {
    this.district = district;
  }

  public FinalEducation getFinalEducation() {
    return finalEducation;
  }

  public void setFinalEducation(FinalEducation finalEducation) {
    this.finalEducation = finalEducation;
  }

  public CompanyMember getCompanyMember() {
    return companyMember;
  }

  public void setCompanyMember(CompanyMember companyMember) {
    this.companyMember = companyMember;
  }

  public Member getMember() {
    return member;
  }

  public void setMember(Member member) {
    this.member = member;
  }

  public Company getCompany() {
    return company;
  }

  public void setCompany(Company company) {
    this.company = company;
  }

  public Field getField() {
    return field;
  }

  public void setField(Field field) {
    this.field = field;
  }

  public Skill getSkill() {
    return skill;
  }

  public void setSkill(Skill skill) {
    this.skill = skill;
  }

  public List<JobPostingFile> getFiles() {
    return files;
  }

  public void setFiles(List<JobPostingFile> files) {
    this.files = files;
  }
  public int getStartIndex() {
    return startIndex;
  }
  public JobPosting setStartIndex(int startIndex) {
    this.startIndex = startIndex;
    return this;
  }
  public int getPageSize() {
    return pageSize;
  }
  public JobPosting setPageSize(int pageSize) {
    this.pageSize = pageSize;
    return this;
  }

}
