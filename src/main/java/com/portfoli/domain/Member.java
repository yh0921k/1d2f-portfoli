package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

  private static final long serialVersionUID = 1L;

  private int number, smsYN, emailYN, type;
  private String id, password, name, postNumber, basicAddress, detailAddress, email, tel, userkey,
  provider, photoFilePath;
  private Date createDate;

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public int getSmsYN() {
    return smsYN;
  }

  public void setSmsYN(int smsYN) {
    this.smsYN = smsYN;
  }

  public int getEmailYN() {
    return emailYN;
  }

  public void setEmailYN(int emailYN) {
    this.emailYN = emailYN;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPostNumber() {
    return postNumber;
  }

  public void setPostNumber(String postNumber) {
    this.postNumber = postNumber;
  }

  public String getBasicAddress() {
    return basicAddress;
  }

  public void setBasicAddress(String basicAddress) {
    this.basicAddress = basicAddress;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public void setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getUserkey() {
    return userkey;
  }

  public void setUserkey(String userkey) {
    this.userkey = userkey;
  }

  public String getProvider() {
    return provider;
  }

  public void setProvider(String provider) {
    this.provider = provider;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public String getPhotoFilePath() {
    return photoFilePath;
  }

  public void setPhotoFilePath(String photoFilePath) {
    this.photoFilePath = photoFilePath;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((basicAddress == null) ? 0 : basicAddress.hashCode());
    result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
    result = prime * result + ((detailAddress == null) ? 0 : detailAddress.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + emailYN;
    result = prime * result + ((id == null) ? 0 : id.hashCode());
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + number;
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((photoFilePath == null) ? 0 : photoFilePath.hashCode());
    result = prime * result + ((postNumber == null) ? 0 : postNumber.hashCode());
    result = prime * result + ((provider == null) ? 0 : provider.hashCode());
    result = prime * result + smsYN;
    result = prime * result + ((tel == null) ? 0 : tel.hashCode());
    result = prime * result + type;
    result = prime * result + ((userkey == null) ? 0 : userkey.hashCode());
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
    Member other = (Member) obj;
    if (basicAddress == null) {
      if (other.basicAddress != null)
        return false;
    } else if (!basicAddress.equals(other.basicAddress))
      return false;
    if (createDate == null) {
      if (other.createDate != null)
        return false;
    } else if (!createDate.equals(other.createDate))
      return false;
    if (detailAddress == null) {
      if (other.detailAddress != null)
        return false;
    } else if (!detailAddress.equals(other.detailAddress))
      return false;
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    if (emailYN != other.emailYN)
      return false;
    if (id == null) {
      if (other.id != null)
        return false;
    } else if (!id.equals(other.id))
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (number != other.number)
      return false;
    if (password == null) {
      if (other.password != null)
        return false;
    } else if (!password.equals(other.password))
      return false;
    if (photoFilePath == null) {
      if (other.photoFilePath != null)
        return false;
    } else if (!photoFilePath.equals(other.photoFilePath))
      return false;
    if (postNumber == null) {
      if (other.postNumber != null)
        return false;
    } else if (!postNumber.equals(other.postNumber))
      return false;
    if (provider == null) {
      if (other.provider != null)
        return false;
    } else if (!provider.equals(other.provider))
      return false;
    if (smsYN != other.smsYN)
      return false;
    if (tel == null) {
      if (other.tel != null)
        return false;
    } else if (!tel.equals(other.tel))
      return false;
    if (type != other.type)
      return false;
    if (userkey == null) {
      if (other.userkey != null)
        return false;
    } else if (!userkey.equals(other.userkey))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Member [number=" + number + ", smsYN=" + smsYN + ", emailYN=" + emailYN + ", type="
        + type + ", id=" + id + ", password=" + password + ", name=" + name + ", postNumber="
        + postNumber + ", basicAddress=" + basicAddress + ", detailAddress=" + detailAddress
        + ", email=" + email + ", tel=" + tel + ", userkey=" + userkey + ", provider=" + provider
        + ", photoFilePath=" + photoFilePath + ", createDate=" + createDate + "]";
  }
}