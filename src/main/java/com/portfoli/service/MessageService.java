package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Message;

public interface MessageService {
  int add(Message message) throws Exception;

  List<Message> listSentMessage(int userNumber, int pageNumber, int pageSize) throws Exception;

  List<Message> listReceivedMessage(int userNumber, int pageNumber, int pageSize) throws Exception;

  int sizeSent(int userNumber) throws Exception;

  int sizeInbox(int userNumber) throws Exception;
}