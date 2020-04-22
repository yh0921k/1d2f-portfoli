package com.portfoli;

import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

// 어플리케이션을 설정하는 클래스
// Spring IoC Container가 탐색할 패키지 설정
// > 지정한 패키지 및 그 하위 패키지를 모두 탐색하여
// > @Component 어노테이션이 붙은 클래스를 찾아 객체를 생성한다.
@ComponentScan(value = "com.portfoli",
    excludeFilters = {@Filter(type = FilterType.REGEX, pattern = "com.portfoli.admin.*"),
        @Filter(type = FilterType.REGEX, pattern = "com.portfoli.web.*")})
public class AppConfig {

  static Logger logger = LogManager.getLogger(AppConfig.class);

  public AppConfig() throws IOException {
    // Mybatis 설정 파일을 로딩할 때 사용할 입력 스트림 준비
    logger.info("[Appconfig.java] :: constructor called");
  }
}
