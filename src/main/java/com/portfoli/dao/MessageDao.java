package com.portfoli.dao;

import java.util.List;
import java.util.Map;
import com.portfoli.domain.Message;

public interface MessageDao {
  int insert(Message message) throws Exception;

  List<Message> findAllBySenderNumber(Map<String, Object> param) throws Exception;

  List<Message> findAllByReceiverNumber(Map<String, Object> param) throws Exception;

  int countAllSent(int userNumber) throws Exception;

  int countAllInbox(int userNumber) throws Exception;

  int countNotRead(int userNumber) throws Exception;
}