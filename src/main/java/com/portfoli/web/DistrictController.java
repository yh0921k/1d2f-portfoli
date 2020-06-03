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
import com.portfoli.domain.District;
import com.portfoli.service.CityService;
import com.portfoli.service.DistrictService;

@Controller
@RequestMapping("/district")
public class DistrictController {

  static Logger logger = LogManager.getLogger(DistrictController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  DistrictService districtService;

  @Autowired
  CityService cityService;

  public DistrictController() {
    logger.debug("DistrictController 생성");
  }

  @GetMapping(value = "list", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String list(HttpServletRequest request, Model model, String selected) throws Exception {

    int cityNumber = cityService.get(selected);
    List<District> list = districtService.list(cityNumber);
    model.addAttribute("list", list);
    return new Gson().toJson(list);
  }

  // @GetMapping(value = "listOfUser", produces = "text/plain;charset=UTF-8")
  // @ResponseBody
  // public String listOfUser(HttpServletRequest request, Model model) throws Exception {
  //
  // Member member = ((Member) request.getSession().getAttribute("loginUser"));
  // int memberNumber = member.getNumber();
  //
  // List<Skill> list = skillService.listOfMember(memberNumber);
  // model.addAttribute("list", list);
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
  // List<Skill> list = skillService.listOfMember(memberNumber);
  // List<String> deleteList = new LinkedList<>();
  // List<String> sameList = new LinkedList<>();
  //
  // for (int i = 0; i < list.size(); i++) {
  // boolean flag = false;
  // for (int j = 0; j < updateList.length; j++) {
  // if (updateList[j].equals(list.get(i).getName())) {
  // flag = true;
  // }
  // }
  // if (!flag) {
  // deleteList.add(list.get(i).getName());
  // } else {
  // sameList.add(list.get(i).getName());
  // }
  // }
  //
  // for (int i = 0; i < sameList.size(); i++) {
  // for (int j = 0; j < updateList.length; j++) {
  // if (sameList.get(i).equals(updateList[j])) {
  // updateList[j] = null;
  // }
  // }
  // }
  //
  // System.out.println("deleteList : " + deleteList);
  // System.out.println("sameList : " + sameList);
  //
  // Map<String, Object> params = new HashMap<>();
  // params.put("memberNumber", memberNumber);
  // for (String skillName : deleteList) {
  // System.out.println(skillName);
  // params.put("skillName", skillName);
  // GeneralMemberSkill gms = skillService.get(params);
  // if (gms == null) {
  // continue;
  // }
  //
  // params.put("skillNumber", gms.getSkillNumber());
  // System.out.println("gms : " + gms);
  //
  // portfoliSkillService.delete(gms.getMemberSkillNumber());
  // skillService.delete(params);
  // }
  //
  //
  // for (String skillName : updateList) {
  // System.out.println("skillName" + skillName);
  // if (skillName == null) {
  // continue;
  // }
  // int skillNumber = skillService.get(skillName).getNumber();
  // params.put("skillNumber", skillNumber);
  // skillService.add(params);
  // }
  // return "OK";
  // }
}
