package com.portfoli.web;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.District;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.GeneralMember;
import com.portfoli.service.DistrictService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.MemberService;



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

  @GetMapping("recommend")
  public void recommendEmployee(Model model) throws Exception {
    List<GeneralMember> memCareers = memberService.findAll();
    List<District> districts = districtService.get();
    List<FinalEducation> educations = finalEducationService.findAll();
    model.addAttribute("memCareers", memCareers);
    model.addAttribute("districts", districts);
    model.addAttribute("educations", educations);
  }

}
