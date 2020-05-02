package com.portfoli.web;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.portfoli.dao.MessageDao;
import com.portfoli.domain.Member;

@Component
public class MessageWebSocketHandler extends TextWebSocketHandler {
  private Map<String, WebSocketSession> userSessions = new ConcurrentHashMap<>();

  @Autowired
  MessageDao messageDao;

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
      throws Exception {
    super.afterConnectionClosed(session, status);
  }

  @Override
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    userSessions.put(getUserId(session), session);
  }

  private String getUserId(WebSocketSession session) {
    Map<String, Object> httpSession = session.getAttributes();
    
    Member loginUser = (Member) httpSession.get("loginUser");
    if (loginUser != null) {
      return String.valueOf(loginUser.getNumber());
    } else {
      return null;
    }
  }

  @Override
  public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    Map<String, Object> httpSession = session.getAttributes();
    Member loginUser = (Member) httpSession.get("loginUser");

    int count = messageDao.countNotRead(loginUser.getNumber());
    if (count == 0) {
      return;
    }

    userSessions.get(getUserId(session)).sendMessage(new TextMessage(String.valueOf(count)));
  }
}