package com.portfoli.domain;

import java.io.Serializable;

public class AdminLog implements Serializable {
  private static final long serialVersionUID = 1L;

  String date;
  String time;
  String ipAddr;
  String user;
  String req;

  public AdminLog(String date, String time, String ipAddr, String user, String req) {
    this.date = date;
    this.time = time;
    this.ipAddr = ipAddr;
    this.user = user;
    this.req = req;
  }

  public String getDate() {
    return date;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public String getTime() {
    return time;
  }

  public void setTime(String time) {
    this.time = time;
  }

  public String getIpAddr() {
    return ipAddr;
  }

  public void setIpAddr(String ipAddr) {
    this.ipAddr = ipAddr;
  }

  public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }

  public String getReq() {
    return req;
  }

  public void setReq(String req) {
    this.req = req;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((date == null) ? 0 : date.hashCode());
    result = prime * result + ((ipAddr == null) ? 0 : ipAddr.hashCode());
    result = prime * result + ((req == null) ? 0 : req.hashCode());
    result = prime * result + ((time == null) ? 0 : time.hashCode());
    result = prime * result + ((user == null) ? 0 : user.hashCode());
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
    AdminLog other = (AdminLog) obj;
    if (date == null) {
      if (other.date != null)
        return false;
    } else if (!date.equals(other.date))
      return false;
    if (ipAddr == null) {
      if (other.ipAddr != null)
        return false;
    } else if (!ipAddr.equals(other.ipAddr))
      return false;
    if (req == null) {
      if (other.req != null)
        return false;
    } else if (!req.equals(other.req))
      return false;
    if (time == null) {
      if (other.time != null)
        return false;
    } else if (!time.equals(other.time))
      return false;
    if (user == null) {
      if (other.user != null)
        return false;
    } else if (!user.equals(other.user))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Log [date=" + date + ", time=" + time + ", ipAddr=" + ipAddr + ", user=" + user
        + ", req=" + req + "]";
  }

}
