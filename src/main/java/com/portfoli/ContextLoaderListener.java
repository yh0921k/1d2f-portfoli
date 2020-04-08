package com.portfoli;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

@WebListener
public class ContextLoaderListener implements ServletContextListener {

  static Logger logger = LogManager.getLogger(ContextLoaderListener.class);

  @Override
  public void contextInitialized(ServletContextEvent sce) {
    ServletContext servletContext = sce.getServletContext();
    try {

      ApplicationContext iocContainer = new AnnotationConfigApplicationContext(AppConfig.class);
      servletContext.setAttribute("iocContainer", iocContainer);

      ContextLoaderListener.logger.debug("------------------------------------------");
      printBeans(iocContainer);

    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private void printBeans(ApplicationContext appCtx) {
    ContextLoaderListener.logger.info("---- Spring IoC 컨테이너에 들어있는 객체들 ----");
    String[] beanNames = appCtx.getBeanDefinitionNames();
    for (String beanName : beanNames) {
      ContextLoaderListener.logger.info(
          String.format("%s =======> %s", beanName, appCtx.getBean(beanName).getClass().getName()));
    }
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) {}

}
