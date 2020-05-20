package com.portfoli.domain;

import java.io.Serializable;

public class Certificate implements Serializable {

  private static final long serialVersionUID = 1L;

  int certificateNumber;
  String agency, name;

  public Certificate setCertificate(Certificate certificate) {
    this.certificateNumber = certificate.certificateNumber;
    this.agency = certificate.agency;
    this.name = certificate.name;
    return this;
  }

  public int getCertificateNumber() {
    return certificateNumber;
  }

  public void setCertificateNumber(int certificateNumber) {
    this.certificateNumber = certificateNumber;
  }

  public String getAgency() {
    return agency;
  }

  public void setAgency(String agency) {
    this.agency = agency;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((agency == null) ? 0 : agency.hashCode());
    result = prime * result + certificateNumber;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
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
    Certificate other = (Certificate) obj;
    if (agency == null) {
      if (other.agency != null)
        return false;
    } else if (!agency.equals(other.agency))
      return false;
    if (certificateNumber != other.certificateNumber)
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    return true;
  }

  @Override
  public String toString() {
    return "Certificate [certificateNumber=" + certificateNumber + ", agency=" + agency + ", name="
        + name + "]";
  }

}
