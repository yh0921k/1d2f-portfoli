package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.EmploymentStatus;

public interface EmploymentStatusDao {

  List<EmploymentStatus> findAll() throws Exception;

}
