package com.portfoli.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class AppWebSocketConfig implements WebSocketConfigurer {
  @Autowired
  MessageWebSocketHandler messageWebSocketHandler;

  @Autowired
  CalendarWebSocketHandler calendarWebSocketHandler;

  @Override
  public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    registry.addHandler(messageWebSocketHandler, "/message/alert")
    .addInterceptors(new HttpSessionHandshakeInterceptor()).setAllowedOrigins("*");

    registry.addHandler(calendarWebSocketHandler, "/calendar/alert")
    .addInterceptors(new HttpSessionHandshakeInterceptor()).setAllowedOrigins("*");

  }


}