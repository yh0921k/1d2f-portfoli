package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.JobPosting;

public interface JobPostingService {

  void add(JobPosting jobPosting) throws Exception;

  List<JobPosting> list() throws Exception;

  List<JobPosting> list2(int lastNo) throws Exception;

  List<JobPosting> myList(int userNumber) throws Exception;

  List<JobPosting> myPostingList(int memberNumber) throws Exception;

  int ListCnt(JobPosting jobPosting) throws Exception;

  void delete(int no) throws Exception;

  JobPosting get(int no) throws Exception;

  JobPosting get(String title) throws Exception;

  List<JobPosting> search(String keyword) throws Exception;

  void update(JobPosting jobPosting) throws Exception;

  int plusCnt(int jobPostingNumber) throws Exception;

  List<JobPosting> findDeadline(int memberNumber) throws Exception;

}
