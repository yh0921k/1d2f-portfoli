package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.GeneralMemberCertification;

public interface GeneralMemberCertificationDao {

  List<GeneralMemberCertification> findCerts(int memberNumber);

}
