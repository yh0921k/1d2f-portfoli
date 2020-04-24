package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.Message;

public interface MessageService {
  int add(Message message) throws Exception;

  List<Message> listSentMessage(int userNumber) throws Exception;

  List<Message> listReceivedMessage(int userNumber) throws Exception;
}