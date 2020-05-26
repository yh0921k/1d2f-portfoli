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
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@ComponentScan(value = "com.portfoli.web")
@EnableWebMvc
public class AppWebConfig {

  static Logger logger = LogManager.getLogger(AppWebConfig.class);

  public AppWebConfig() throws IOException {
    AppWebConfig.logger.info("[AppWebconfig.java] :: constructor called");
  }

  @Bean
  public TilesConfigurer tilesConfigurer() {
    TilesConfigurer configurer = new TilesConfigurer();
    configurer.setDefinitions("/WEB-INF/defs/tiles.xml", "/WEB-INF/defs/admin-tiles.xml");
    return configurer;
  }

  @Bean
  public ViewResolver tilesViewResolver() {
    UrlBasedViewResolver vr = new UrlBasedViewResolver();
    vr.setSuffix(".do");
    vr.setViewClass(TilesView.class);
    vr.setOrder(1);

    return vr;
  }

  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver vr = new InternalResourceViewResolver( //
        "/WEB-INF/jsp/", // prefix
        ".jsp" // suffix
    );
    vr.setOrder(2);
    AppWebConfig.logger.info("[viewResolver] : " + vr.toString());
    return vr;
  }

  @Bean
  public MultipartResolver multipartResolver() {
    CommonsMultipartResolver mr = new CommonsMultipartResolver();
    mr.setMaxUploadSize(100000000);
    mr.setMaxInMemorySize(20000000);
    mr.setMaxUploadSizePerFile(100000000); //업로드 파일 용량 95.4MB로 수정
    return mr;
  }
}
