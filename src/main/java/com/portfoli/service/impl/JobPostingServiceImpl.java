package com.portfoli.service.impl;

import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.JobPostingDao;
import com.portfoli.dao.JobPostingFileDao;
import com.portfoli.domain.JobPosting;
import com.portfoli.service.JobPostingService;

@Component
public class JobPostingServiceImpl implements JobPostingService {

  TransactionTemplate transactionTemplate;
  JobPostingDao jobPostingDao;
  JobPostingFileDao jobPostingFileDao;

  public JobPostingServiceImpl(//
      PlatformTransactionManager txManager, //
      JobPostingDao jobPostingDao, //
      JobPostingFileDao jobPostingFileDao) {
    this.transactionTemplate = new TransactionTemplate(txManager);
    this.jobPostingDao = jobPostingDao;
    this.jobPostingFileDao = jobPostingFileDao;
  }

  @Transactional
  @Override
  public void add(JobPosting jobPosting) throws Exception {
    if (jobPostingDao.insert(jobPosting) == 0) {
      throw new Exception("게시글 등록에 실패했습니다.");
    }
    jobPostingFileDao.insert(jobPosting);
  }

  @Override
  public List<JobPosting> list() throws Exception {
    return jobPostingDao.findAll();
  }

  @Override
  public List<JobPosting> list2(int lastNo) throws Exception {
    return jobPostingDao.findMore(lastNo);
  }

  @Transactional
  @Override
  public void delete(int no) throws Exception {
    jobPostingFileDao.deleteAll(no);
    if (jobPostingDao.delete(no) == 0) {
      throw new Exception("해당 번호의 게시글이 없습니다.");
    }
  }

  @Override
  public JobPosting get(int no) throws Exception {
    return jobPostingDao.findByNo(no);
  }

  @Transactional
  @Override
  public void update(JobPosting jobPosting) throws Exception {
    if (jobPostingDao.update(jobPosting) == 0) {
      System.out.println(jobPosting);
      throw new Exception("게시글 수정에 실패했습니다.");
    }
    if (jobPosting.getFiles() != null) {
      jobPostingFileDao.deleteAll(jobPosting.getJobPostingNumber());
      jobPostingFileDao.insert(jobPosting);
    }
  }

  @Override
  public List<JobPosting> search(String keyword) throws Exception {
    return jobPostingDao.findByKeyword(keyword);
  }

  @Override
  public int plusCnt(int jobPostingNumber) throws Exception {
    System.out.println("plusCnt 호출!");
    return jobPostingDao.plusCnt(jobPostingNumber);
  }
}
