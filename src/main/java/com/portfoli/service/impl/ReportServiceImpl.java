package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.portfoli.dao.BoardAttachmentDao;
import com.portfoli.dao.BoardDao;
import com.portfoli.dao.ReportCategoryDao;
import com.portfoli.dao.ReportDao;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.domain.Report;
import com.portfoli.domain.ReportCategory;
import com.portfoli.service.ReportService;

@Component
public class ReportServiceImpl implements ReportService {
  @Autowired
  BoardDao boardDao;

  @Autowired
  ReportDao reportDao;

  @Autowired
  BoardAttachmentDao boardAttachmentDao;

  @Autowired
  ReportCategoryDao reportCategoryDao;

  @Override
  public int add(Report report) throws Exception {
    boardDao.insert(report);
    reportDao.insert(report);

    List<BoardAttachment> attachments = report.getAttachments();
    if (attachments != null) {
      for (BoardAttachment attachment : attachments) {
        attachment.setBoardNumber(report.getNumber());
        boardAttachmentDao.insert(attachment);
      }
    }

    return 1;
  }

  @Override
  public List<Report> list(int userNumber, int pageNumber, int pageSize) throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("userNumber", userNumber);
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    return reportDao.findAllByReporterNumber(param);
  }

  @Override
  public int listCount(int userNumber) throws Exception {
    return reportDao.count(userNumber);
  }

  @Override
  public List<ReportCategory> reportCategorie() throws Exception {
    return reportCategoryDao.findAll();
  }
}