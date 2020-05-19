package com.portfoli.dao;

import com.portfoli.domain.Certificate;

public interface CertificateDao {

  String[] findAll();

  Certificate findByName(String name);

}
