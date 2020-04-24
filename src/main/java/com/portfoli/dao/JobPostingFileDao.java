package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.JobPostingFile;

public interface JobPostingFileDao {

  public int insert(JobPosting jobPosting) throws Exception;

  List<JobPostingFile> findAll(int jobPostingNumber) throws Exception;

  int deleteAll(int jobPostingNumber) throws Exception;

}
