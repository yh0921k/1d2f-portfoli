package com.portfoli.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.Skill;
import com.portfoli.service.FieldService;
import com.portfoli.service.SkillService;

@Controller
@RequestMapping("/skill")
public class SkillController {

  static Logger logger = LogManager.getLogger(SkillController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  SkillService skillService;

  @Autowired
  FieldService fieldService;

  public SkillController() {
    logger.debug("FieldController 생성");
  }

  @GetMapping(value = "list", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String list(HttpServletRequest request, Model model, String selected) throws Exception {

    int fieldNumber = fieldService.get(selected);
    System.out.println("fieldNumber : " + fieldNumber);
    List<Skill> list = skillService.list(fieldNumber);
    System.out.println("list : " + list);
    model.addAttribute("list", list);
    return new Gson().toJson(list);
  }
}
