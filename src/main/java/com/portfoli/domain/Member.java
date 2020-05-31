package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

  private static final long serialVersionUID = 1L;

  private int number, smsYN, emailYN, type;
  private String id, password, name, postNumber, basicAddress, detailAddress, email, tel, userkey, provider, photoFilePath;
  private Date createDate;

  public int getNumber() {
    return number;
  }

  public Member setNumber(int number) {
    this.number = number;
    return this;
  }

  public int getSmsYN() {
    return smsYN;
  }

  public Member setSmsYN(int smsYN) {
    this.smsYN = smsYN;
    return this;
  }

  public int getEmailYN() {
    return emailYN;
  }

  public Member setEmailYN(int emailYN) {
    this.emailYN = emailYN;
    return this;
  }

  public int getType() {
    return type;
  }

  public Member setType(int type) {
    this.type = type;
    return this;
  }

  public String getId() {
    return id;
  }

  public Member setId(String id) {
    this.id = id;
    return this;
  }

  public String getPassword() {
    return password;
  }

  public Member setPassword(String password) {
    this.password = password;
    return this;
  }

  public String getName() {
    return name;
  }

  public Member setName(String name) {
    this.name = name;
    return this;
  }

  public String getPostNumber() {
    return postNumber;
  }

  public Member setPostNumber(String postNumber) {
    this.postNumber = postNumber;
    return this;
  }

  public String getBasicAddress() {
    return basicAddress;
  }

  public Member setBasicAddress(String basicAddress) {
    this.basicAddress = basicAddress;
    return this;
  }

  public String getDetailAddress() {
    return detailAddress;
  }

  public Member setDetailAddress(String detailAddress) {
    this.detailAddress = detailAddress;
    return this;
  }

  public String getEmail() {
    return email;
  }

  public Member setEmail(String email) {
    this.email = email;
    return this;
  }

  public String getTel() {
    return tel;
  }

  public Member setTel(String tel) {
    this.tel = tel;
    return this;
  }

  public String getUserkey() {
    return userkey;
  }

  public Member setUserkey(String userkey) {
    this.userkey = userkey;
    return this;
  }

  public String getProvider() {
    return provider;
  }

  public Member setProvider(String provider) {
    this.provider = provider;
    return this;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public Member setCreateDate(Date createDate) {
    this.createDate = createDate;
    return this;
  }

  public String getPhotoFilePath() {
    return photoFilePath;
  }

  public Member setPhotoFilePath(String photoFilePath) {
    this.photoFilePath = photoFilePath;
    return this;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + (basicAddress == null ? 0 : basicAddress.hashCode());
    result = prime * result + (createDate == null ? 0 : createDate.hashCode());
    result = prime * result + (detailAddress == null ? 0 : detailAddress.hashCode());
    result = prime * result + (email == null ? 0 : email.hashCode());
    result = prime * result + emailYN;
    result = prime * result + (id == null ? 0 : id.hashCode());
    result = prime * result + (name == null ? 0 : name.hashCode());
    result = prime * result + number;
    result = prime * result + (password == null ? 0 : password.hashCode());
    result = prime * result + (photoFilePath == null ? 0 : photoFilePath.hashCode());
    result = prime * result + (postNumber == null ? 0 : postNumber.hashCode());
    result = prime * result + (provider == null ? 0 : provider.hashCode());
    result = prime * result + smsYN;
    result = prime * result + (tel == null ? 0 : tel.hashCode());
    result = prime * result + type;
    result = prime * result + (userkey == null ? 0 : userkey.hashCode());
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