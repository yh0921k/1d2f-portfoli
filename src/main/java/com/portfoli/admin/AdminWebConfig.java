package com.portfoli.admin;

import java.io.IOException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

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

  @Bean
  public ViewResolver viewResolver() {
    InternalResourceViewResolver vr = new InternalResourceViewResolver( //
        "/WEB-INF/jsp/admin/", // prefix
        ".jsp" // suffix
    );
    // vr.setOrder(2);
    // logger.info("[viewResolver] : " + vr.toString());
    return vr;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new AdminControllerInterceptor())//
        .addPathPatterns("/**"); //
    // .excludePathPatterns();
  }
}
