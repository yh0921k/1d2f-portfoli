package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Certificate;
import com.portfoli.domain.GeneralMemberCertification;

public interface CertificateService {

  String[] list() throws Exception;

  List<GeneralMemberCertification> getMemberCerts(int number);

  Certificate getByName(String name) throws Exception;

  void insertCertsByMemberNumber(List<GeneralMemberCertification> certs, int memberNumber)
      throws Exception;


}
