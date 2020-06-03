package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.JobPosting;

public interface JobPostingDao {

  public int insert(JobPosting jobPosting) throws Exception;

  public List<JobPosting> findAll() throws Exception;

  public List<JobPosting> myPostingList(int memberNumber) throws Exception;

  public List<JobPosting> findAllByUserNumber(int userNumber) throws Exception;

  public int ListCnt() throws Exception;

  public List<JobPosting> findMore(int lastNo) throws Exception;

  public JobPosting findByNo(int no) throws Exception;

  public JobPosting findByTitle(String title) throws Exception;

  public int update(JobPosting jobPosting) throws Exception;

  public int delete(int no) throws Exception;

  List<JobPosting> findByKeyword(String keyword) throws Exception;

  int plusCnt(int jobPostingNumber) throws Exception;

  public List<JobPosting> findDeadline(int memberNumber) throws Exception;

  public List<JobPosting> findRecommendedEmployerList(Map<String, Integer> map) throws Exception;

}
