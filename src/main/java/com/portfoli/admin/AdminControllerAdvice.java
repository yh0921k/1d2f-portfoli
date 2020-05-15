package com.portfoli.admin;

import java.beans.PropertyEditorSupport;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class AdminControllerAdvice {
  @InitBinder
  public void initBinder(WebDataBinder binder) {
    // String ==> java.sql.Date 객체
    binder.registerCustomEditor(
        java.util.Date.class,
        new PropertyEditorSupport() {
          @Override
          public void setAsText(String text) throws IllegalArgumentException {
            setValue(java.sql.Date.valueOf(text));
          }
        });
  }

  /*
  @ExceptionHandler
  public ModelAndView error(Exception ex, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView();
    ex.printStackTrace();

    mv.addObject("error", ex.getMessage());
    mv.setViewName("error/error");
    return mv;
  }
   */
}