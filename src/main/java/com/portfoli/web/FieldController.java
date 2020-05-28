package com.portfoli.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.Field;
import com.portfoli.service.FieldService;

@Controller
@RequestMapping("/field")
public class FieldController {

  static Logger logger = LogManager.getLogger(FieldController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  FieldService fieldService;

  public FieldController() {
    logger.debug("FieldController 생성");
  }

  @GetMapping(value = "list", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String list(Model model) throws Exception {

    List<Field> list = fieldService.list();
    model.addAttribute("list", list);
    return new Gson().toJson(list);
  }
}
