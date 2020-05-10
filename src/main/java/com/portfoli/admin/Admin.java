package com.portfoli.admin;

import java.io.Serializable;

public class Admin implements Serializable {
  private static final long serialVersionUID = 1L;

  int number;
  String id;
  String password;
  String ipAddress;
  String AccessTime;

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
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

  public String getIpAddress() {
    return ipAddress;
  }

  public void setIpAddress(String ipAddress) {
    this.ipAddress = ipAddress;
  }

  public String getAccessTime() {
    return AccessTime;
  }

  public void setAccessTime(String accessTime) {
    AccessTime = accessTime;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((AccessTime == null) ? 0 : AccessTime.hashCode());
    result = prime * result + ((id == null) ? 0 : id.hashCode());
    result = prime * result + ((ipAddress == null) ? 0 : ipAddress.hashCode());
    result = prime * result + number;
    result = prime * result + ((password == null) ? 0 : password.hashCode());
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
    Admin other = (Admin) obj;
    if (AccessTime == null) {
      if (other.AccessTime != null)
        return false;
    } else if (!AccessTime.equals(other.AccessTime))
      return false;
    if (id == null) {
      if (other.id != null)
        return false;
    } else if (!id.equals(other.id))
      return false;
    if (ipAddress == null) {
      if (other.ipAddress != null)
        return false;
    } else if (!ipAddress.equals(other.ipAddress))
      return false;
    if (number != other.number)
      return false;
    if (password == null) {
      if (other.password != null)
        return false;
    } else if (!password.equals(other.password))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Admin [number=" + number + ", id=" + id + ", password=" + password + ", ipAddress="
        + ipAddress + ", AccessTime=" + AccessTime + "]";
  }
}
