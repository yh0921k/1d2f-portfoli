package com.portfoli.dao;

import com.portfoli.domain.Message;

public interface MessageFileDao {
  int insert(Message message) throws Exception;
}