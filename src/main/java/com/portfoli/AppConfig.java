package com.portfoli;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@ComponentScan(value = "com.portfoli")
public class AppConfig {

  static Logger logger = LogManager.getLogger(AppConfig.class);

  public AppConfig() {
    AppConfig.logger.info("AppConfig 객체 생성!");
  }
  
  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver vr = new InternalResourceViewResolver("/WEB-INF/jsp/", // prefix
        ".jsp"// suffix
    );
    return vr;
  }

  @Bean
  public MultipartResolver multipartResolver() {
    CommonsMultipartResolver mr = new CommonsMultipartResolver();
    mr.setMaxUploadSize(10000000);
    mr.setMaxInMemorySize(2000000);
    mr.setMaxUploadSizePerFile(5000000);
    return mr;
  }

}
