package com.portfoli.web;

import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@ComponentScan(value = "com.portfoli.web")
@EnableWebMvc
public class AppWebConfig {

  static Logger logger = LogManager.getLogger(AppWebConfig.class);

  public AppWebConfig() throws IOException {
    logger.info("[AppWebconfig.java] :: constructor called");
  }

  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver vr = new InternalResourceViewResolver( //
        "/WEB-INF/jsp/", // prefix
        ".jsp" // suffix
    );
    vr.setOrder(2);
    logger.info("[viewResolver] : " + vr.toString());
    return vr;
  }

  @Bean
  public MultipartResolver multipartResolver() {
    CommonsMultipartResolver mr = new CommonsMultipartResolver();
    mr.setMaxUploadSize(10000000);
    mr.setMaxInMemorySize(2000000);
    mr.setMaxUploadSizePerFile(10000000);
    return mr;
  }
}
