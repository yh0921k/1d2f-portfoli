package com.portfoli;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(value = "com.portfoli")
public class AppConfig {

  static Logger logger = LogManager.getLogger(AppConfig.class);

  public AppConfig() {
    AppConfig.logger.info("AppConfig 객체 생성!");
  }

}
