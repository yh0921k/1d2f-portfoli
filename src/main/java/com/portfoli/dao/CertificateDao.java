package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Certificate;

public interface CertificateDao {

  String[] findAll();

  Certificate findByName(String name);

  List<Certificate> findAll2();

}
