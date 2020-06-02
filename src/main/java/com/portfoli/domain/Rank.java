package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Rank implements Serializable {
  private static final long serialVersionUID = 1L;

  int number; // 포트폴리오 글번호
  String title; // 포트폴리오 제목
  String id; // 사용자 아이디
  String career; // 경력
  String homepage; // 사용자 홈페이지
  String thumbnail; // 썸네일 경로

  int readable; // 읽기여부
  int seekingFlag; // 구직여부
  int viewCount; // 조회수
  int likeCount; // 좋아요 수
  Date registeredDate; // 등록일
  List<Skill> skills; // 포트폴리오에 포함된 기술

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getCareer() {
    return career;
  }

  public void setCareer(String career) {
    this.career = career;
  }

  public String getHomepage() {
    return homepage;
  }

  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }

  public String getThumbnail() {
    return thumbnail;
  }

  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }

  public int getReadable() {
    return readable;
  }

  public void setReadable(int readable) {
    this.readable = readable;
  }

  public int getSeekingFlag() {
    return seekingFlag;
  }

  public void setSeekingFlag(int seekingFlag) {
    this.seekingFlag = seekingFlag;
  }

  public int getViewCount() {
    return viewCount;
  }

  public void setViewCount(int viewCount) {
    this.viewCount = viewCount;
  }

  public int getLikeCount() {
    return likeCount;
  }

  public void setLikeCount(int likeCount) {
    this.likeCount = likeCount;
  }

  public List<Skill> getSkill() {
    return skills;
  }

  public void setSkill(List<Skill> skills) {
    this.skills = skills;
  }

  public Date getRegisteredDate() {
    return registeredDate;
  }

  public void setRegisteredDate(Date registeredDate) {
    this.registeredDate = registeredDate;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((career == null) ? 0 : career.hashCode());
    result = prime * result + ((homepage == null) ? 0 : homepage.hashCode());
    result = prime * result + ((id == null) ? 0 : id.hashCode());
    result = prime * result + likeCount;
    result = prime * result + number;
    result = prime * result + readable;
    result = prime * result + ((registeredDate == null) ? 0 : registeredDate.hashCode());
    result = prime * result + seekingFlag;
    result = prime * result + ((skills == null) ? 0 : skills.hashCode());
    result = prime * result + ((thumbnail == null) ? 0 : thumbnail.hashCode());
    result = prime * result + ((title == null) ? 0 : title.hashCode());
    result = prime * result + viewCount;
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
    Rank other = (Rank) obj;
    if (career == null) {
      if (other.career != null) {
        return false;
      }
    } else if (!career.equals(other.career)) {
      return false;
    }
    if (homepage == null) {
      if (other.homepage != null) {
        return false;
      }
    } else if (!homepage.equals(other.homepage)) {
      return false;
    }
    if (id == null) {
      if (other.id != null) {
        return false;
      }
    } else if (!id.equals(other.id)) {
      return false;
    }
    if (likeCount != other.likeCount) {
      return false;
    }
    if (number != other.number) {
      return false;
    }
    if (readable != other.readable) {
      return false;
    }
    if (registeredDate == null) {
      if (other.registeredDate != null) {
        return false;
      }
    } else if (!registeredDate.equals(other.registeredDate)) {
      return false;
    }
    if (seekingFlag != other.seekingFlag) {
      return false;
    }
    if (skills == null) {
      if (other.skills != null) {
        return false;
      }
    } else if (!skills.equals(other.skills)) {
      return false;
    }
    if (thumbnail == null) {
      if (other.thumbnail != null) {
        return false;
      }
    } else if (!thumbnail.equals(other.thumbnail)) {
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
    return true;
  }

  @Override
  public String toString() {
    return "Rank [number=" + number + ", title=" + title + ", id=" + id + ", career=" + career
        + ", homepage=" + homepage + ", thumbnail=" + thumbnail + ", readable=" + readable
        + ", seekingFlag=" + seekingFlag + ", viewCount=" + viewCount + ", likeCount=" + likeCount
        + ", skills=" + skills + ", registeredDate=" + registeredDate + "]";
  }
}
