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
    binder.registerCustomEditor(java.util.Date.class, new PropertyEditorSupport() {
      @Override
      public void setAsText(String text) throws IllegalArgumentException {
        setValue(java.sql.Date.valueOf(text));
      }
    });
  }

  // @InitBinder
  // public void dateBinder(WebDataBinder binder) throws Exception {
  // final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
  // final CustomDateEditor dateEditor = new CustomDateEditor(df, true) {
  // @Override
  // public void setAsText(String text) throws IllegalArgumentException {
  // if ("today".equals(text)) {
  // setValue(new java.sql.Date(System.currentTimeMillis()));
  // } else {
  // super.setAsText(text);
  // }
  // }
  // };
  // binder.registerCustomEditor(java.sql.Date.class, dateEditor);
  // }

}
