package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.EmploymentStatus;

public interface EmploymentStatusService {

  List<EmploymentStatus> get() throws Exception;

}
