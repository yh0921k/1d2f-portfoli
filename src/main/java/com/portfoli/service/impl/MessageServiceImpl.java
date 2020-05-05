package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.MessageDao;
import com.portfoli.dao.MessageFileDao;
import com.portfoli.domain.Message;
import com.portfoli.service.MessageService;

@Component
public class MessageServiceImpl implements MessageService {
  TransactionTemplate transactionTemplate;

  @Autowired MessageDao messageDao;
  @Autowired MessageFileDao messageFileDao;

  @Transactional
  @Override
  public int add(Message message) throws Exception {
    if (messageDao.insert(message) == 0) {
      throw new Exception("쪽지 전송에 실패했습니다.");
    }

    if (message.getFiles().isEmpty()) {
      return 0;
    }

    messageFileDao.insert(message);
    return 1;
  }

  @Override
  public List<Message> listSentMessage(int userNumber, int pageNumber, int pageSize)
      throws Exception {
    HashMap<String,Object> param = new HashMap<>();
    param.put("userNumber", userNumber);
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);
    
    return messageDao.findAllBySenderNumber(param);
  }

  @Override
  public List<Message> listReceivedMessage(int userNumber, int pageNumber, int pageSize)
      throws Exception {
    HashMap<String, Object> param = new HashMap<>();
    param.put("userNumber", userNumber);
    param.put("offset", (pageNumber - 1) * pageSize);
    param.put("pageSize", pageSize);

    return messageDao.findAllByReceiverNumber(param);
  }

  @Override
  public int sizeSent(int userNumber) throws Exception {
    return messageDao.countAllSent(userNumber);
  }

  @Override
  public int sizeInbox(int userNumber) throws Exception {
    return messageDao.countAllInbox(userNumber);
  }

  @Transactional
  @Override
  public Message get(int number) throws Exception {
    Message message = messageDao.findByMessageNumber(number);
    messageDao.updateRead(message);

    return message;
  }
}