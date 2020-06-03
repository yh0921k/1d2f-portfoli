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
import com.portfoli.domain.City;
import com.portfoli.service.CityService;

@Controller
@RequestMapping("/city")
public class CityController {

  static Logger logger = LogManager.getLogger(CityController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  CityService cityService;

  public CityController() {
    logger.debug("CityController 생성");
  }

  @GetMapping(value = "list", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String list(Model model) throws Exception {

    List<City> list = cityService.list();
    model.addAttribute("list", list);
    return new Gson().toJson(list);
  }

  // @GetMapping(value = "listOfUserInterest", produces = "text/plain;charset=UTF-8")
  // @ResponseBody
  // public String listOfUserInterest(HttpServletRequest request, Model model) throws Exception {
  //
  // Member member = ((Member) request.getSession().getAttribute("loginUser"));
  // int memberNumber = member.getNumber();
  //
  // List<Field> list = fieldService.listOfMemberInterest(memberNumber);
  // model.addAttribute("list", list);
  // System.out.println("List : " + list);
  // return new Gson().toJson(list);
  // }
  //
  // @PostMapping(value = "update", produces = "text/plain;charset=UTF-8")
  // @ResponseBody
  // public String update(HttpServletRequest request, Model model, @RequestBody String skillList)
  // throws Exception {
  //
  // Member member = ((Member) request.getSession().getAttribute("loginUser"));
  // int memberNumber = member.getNumber();
  //
  // skillList = skillList.replaceAll("\\\"", "");
  // skillList = skillList.replaceAll("\\\\", "");
  //
  // String[] updateList = new Gson().fromJson(skillList, String[].class);
  //
  // fieldService.delete(memberNumber);
  // Map<String, Object> params = new HashMap<>();
  // params.put("memberNumber", memberNumber);
  //
  // for (String skillName : updateList) {
  // int fieldNumber = fieldService.get(skillName);
  // params.put("fieldNumber", fieldNumber);
  // fieldService.add(params);
  // }
  // return "OK";
  // }
}
