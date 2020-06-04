package com.portfoli.web;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.portfoli.domain.City;
import com.portfoli.domain.District;
import com.portfoli.domain.Field;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Skill;
import com.portfoli.service.CityService;
import com.portfoli.service.DistrictService;
import com.portfoli.service.FieldService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.MemberService;
import com.portfoli.service.SkillService;



@Controller
@RequestMapping("recommendEmployee")
public class RecommendEmployeeController {

  static Logger logger = LogManager.getLogger(RecommendEmployeeController.class);

  public RecommendEmployeeController() {
    RecommendEmployeeController.logger.debug("RecommendEmployeeController 객체 생성!");
  }

  @Autowired
  MemberService memberService;

  @Autowired
  DistrictService districtService;

  @Autowired
  FinalEducationService finalEducationService;

  @Autowired
  SkillService skillService;

  @Autowired
  CityService cityService;

  @Autowired
  FieldService fieldService;

  @GetMapping("recommend")
  public void recommendEmployee(Model model, @RequestParam(defaultValue = "109000") int cityNumber,
      @RequestParam(defaultValue = "40101") int fieldNumber) throws Exception {
    List<GeneralMember> memCareers = memberService.findAll();
    List<District> districts = districtService.get();
    List<FinalEducation> educations = finalEducationService.findAll();
    List<Skill> skills = skillService.list();
    List<City> citys = cityService.list();
    List<Field> fields = fieldService.list();
    model.addAttribute("memCareers", memCareers);
    model.addAttribute("districts", districts);
    model.addAttribute("educations", educations);
    model.addAttribute("skills", skills);
    model.addAttribute("citys", citys);
    model.addAttribute("fields", fields);
  }

}
