package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.BoardDao;
import com.portfoli.dao.FaqDao;
import com.portfoli.domain.Faq;
import com.portfoli.service.FaqService;

@Component
public class FaqServiceImpl implements FaqService {

  BoardDao boardDao;
  FaqDao faqDao;
  TransactionTemplate transactionTemplate;

  public FaqServiceImpl(BoardDao boardDao, FaqDao faqDao, PlatformTransactionManager pftxManager) {
    this.boardDao = boardDao;
    this.faqDao = faqDao;
    this.transactionTemplate = new TransactionTemplate(pftxManager);
  }


  @Override
  public List<Faq> list(int pageNumber, int pageSize) throws Exception {
    HashMap<String, Object> param = new HashMap<>();
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    List<Faq> faqList = faqDao.findAll(param);
    if (faqList.size() < 0)
      throw new Exception("Q&A 불러오기 실패");
    return faqList;
  }

  @Override
  public List<Faq> listForUser(int pageNumber, int pageSize) throws Exception {
    HashMap<String, Object> param = new HashMap<>();
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    List<Faq> faqList = faqDao.findAllforUser(param);
    if (faqList.size() < 0)
      throw new Exception("Q&A 불러오기 실패");
    return faqList;
  }
  
  @Override
  public int selectListCnt(Faq faq) throws Exception {
    return faqDao.selectListCnt(faq);
  }

  @Override
  public int selectListCntForUser(Faq faq) throws Exception {
    return faqDao.selectListCntForUser(faq);
  }
  
  @Override
  public Faq get(int no) throws Exception {
    Faq faq = faqDao.findByNo(no);
    if (faq == null)
      throw new Exception("해당 번호의 게시글이 존재하지 않습니다.");
    return faq;
  }

  @Transactional
  @Override
  public void delete(int boardNo) throws Exception {
    if (faqDao.delete(boardNo) > 0) {
      if (boardDao.delete(boardNo) < 0)
        throw new Exception("게시글 삭제 실패");
    } else
      throw new Exception("게시글 삭제 실패");
  }

  @Transactional
  @Override
  public void update(Faq faq) throws Exception {
    
    System.out.println("faq값입니다");
    System.out.println(faq);
    
    if (boardDao.update(faq) > 0) {
      if (faqDao.update(faq) < 0)
        throw new Exception("QNA 수정 실패");
    } else
      throw new Exception("QNA 수정 실패");
  }

  @Transactional
  @Override
  public void add(Faq faq) throws Exception {
    if (boardDao.insert(faq) > 0) {
      faq.setNumber(faq.getNumber());
      if (faqDao.insert(faq) < 0)
        throw new Exception("QNA 등록 실패");
    } else
      throw new Exception("QNA 등록 실패");
  }







  


}
