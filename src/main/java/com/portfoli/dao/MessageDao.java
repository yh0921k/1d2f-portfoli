package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.Message;

public interface MessageDao {
  int insert(Message message) throws Exception;

  List<Message> findAllBySenderNumber(int userNumber) throws Exception;

  List<Message> findAllByReceiverNumber(int userNumber) throws Exception;
}