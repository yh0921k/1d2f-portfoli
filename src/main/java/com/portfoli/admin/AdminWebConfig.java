package com.portfoli.admin;

import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@ComponentScan(value = "com.portfoli.admin")
@EnableWebMvc
public class AdminWebConfig implements WebMvcConfigurer {

  static Logger logger = LogManager.getLogger(AdminWebConfig.class);

  public AdminWebConfig() throws IOException {
    logger.info("[AdminWebconfig.java] :: constructor called");
  }

  // @Bean
  // public ViewResolver adminViewResolver() {
  // UrlBasedViewResolver vr = new UrlBasedViewResolver();
  // vr.setPrefix("/WEB-INF/jsp/");
  // vr.setSuffix(".jsp");
  // vr.setOrder(1);
  // vr.setViewClass(JstlView.class);
  // logger.info("[adminViewResolver] : " + vr.toString());
  // return vr;
  // }

  // Tiles View를 사용할 Resolver 추가
  @Bean
  public TilesConfigurer tilesConfigurer() {
    TilesConfigurer configurer = new TilesConfigurer();
    configurer.setDefinitions("/WEB-INF/defs/tiles.xml");
    return configurer;
  }

  @Bean
  public ViewResolver tilesViewResolver() {
    UrlBasedViewResolver vr = new UrlBasedViewResolver();

    // Tiles 설정에 따라 템플릿을 실행할 뷰 처리기를 등록한다.
    vr.setViewClass(TilesView.class);

    // 뷰 리졸버의 우선 순위를 InternalResourceViewResolver보다 우선하게 한다.
    vr.setOrder(1);

    return vr;
  }

  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver vr = new InternalResourceViewResolver(
        "/WEB-INF/jsp/admin/", // prefix
        ".jsp" // suffix
        );

    vr.setOrder(2);

    return vr;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new AdminControllerInterceptor())
    .addPathPatterns("/**");
    // .excludePathPatterns();
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