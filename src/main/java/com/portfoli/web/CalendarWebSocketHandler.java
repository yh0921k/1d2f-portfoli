package com.portfoli.web;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.portfoli.dao.CalendarDao;
import com.portfoli.domain.Member;

@Component
public class CalendarWebSocketHandler extends TextWebSocketHandler {
  private Map<String, WebSocketSession> userSessions = new ConcurrentHashMap<>();

  @Autowired
  CalendarDao calendarDao;

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    super.afterConnectionClosed(session, status);
  }

  @Override
  public void afterConnectionEstablished(WebSocketSession session) {
    String userNo = getUserId(session);
    if (userNo != null) {
      userSessions.put(getUserId(session), session);
    }
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

    int todayScheduleCnt = 0;
    if (loginUser != null) {
      todayScheduleCnt = calendarDao.checkToday(loginUser.getNumber()).size();
      if (todayScheduleCnt != 0) {
        userSessions.get(getUserId(session)).sendMessage(new TextMessage(String.valueOf(todayScheduleCnt)));
      }
    }
  }
}
