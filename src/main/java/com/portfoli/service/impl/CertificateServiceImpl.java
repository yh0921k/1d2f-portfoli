package com.portfoli.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.CertificateDao;
import com.portfoli.dao.GeneralMemberCertificationDao;
import com.portfoli.domain.GeneralMemberCertification;
import com.portfoli.service.CertificateService;

@Component
public class CertificateServiceImpl implements CertificateService{
  
  @Autowired
  CertificateDao certificateDao;
  
  @Autowired
  GeneralMemberCertificationDao generalMemberCertificationDao;

  @Override
  public String[] list() throws Exception {
    String[] certs = certificateDao.findAll();
    if(certs.length == 0) {
      throw new Exception("자격 정보 불러오는 도중 에러 발생");
    }
    return certs;
  }

  @Override
  public List<GeneralMemberCertification> getMemberCerts(int memberNumber) {
    return generalMemberCertificationDao.findCerts(memberNumber);
  }

}
