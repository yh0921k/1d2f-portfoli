package com.portfoli.domain;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable {
  private static final long serialVersionUID = 1L;

  private int number;
  private int memberNumber;
  private String productName;
  private int price;
  private String method;
  private String status;
  private Date payDate;

  @Override
  public String toString() {
    return "Payment [number=" + number + ", memberNumber=" + memberNumber + ", productName="
        + productName + ", price=" + price + ", method=" + method + ", status=" + status
        + ", payDate=" + payDate + "]";
  }

  public int getNumber() {
    return number;
  }

  public void setNumber(int number) {
    this.number = number;
  }

  public int getMemberNumber() {
    return memberNumber;
  }

  public void setMemberNumber(int memberNumber) {
    this.memberNumber = memberNumber;
  }

  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public String getMethod() {
    return method;
  }

  public void setMethod(String method) {
    this.method = method;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public Date getPayDate() {
    return payDate;
  }

  public void setPayDate(Date payDate) {
    this.payDate = payDate;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + memberNumber;
    result = prime * result + ((method == null) ? 0 : method.hashCode());
    result = prime * result + number;
    result = prime * result + ((payDate == null) ? 0 : payDate.hashCode());
    result = prime * result + price;
    result = prime * result + ((productName == null) ? 0 : productName.hashCode());
    result = prime * result + ((status == null) ? 0 : status.hashCode());
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
    Payment other = (Payment) obj;
    if (memberNumber != other.memberNumber)
      return false;
    if (method == null) {
      if (other.method != null)
        return false;
    } else if (!method.equals(other.method))
      return false;
    if (number != other.number)
      return false;
    if (payDate == null) {
      if (other.payDate != null)
        return false;
    } else if (!payDate.equals(other.payDate))
      return false;
    if (price != other.price)
      return false;
    if (productName == null) {
      if (other.productName != null)
        return false;
    } else if (!productName.equals(other.productName))
      return false;
    if (status == null) {
      if (other.status != null)
        return false;
    } else if (!status.equals(other.status))
      return false;
    return true;
  }
}