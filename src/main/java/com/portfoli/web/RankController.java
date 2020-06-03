package com.portfoli.web;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.Field;
import com.portfoli.domain.Rank;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.FieldService;
import com.portfoli.service.MemberService;
import com.portfoli.service.PortfolioService;
import com.portfoli.service.PortfolioSkillService;
import com.portfoli.service.RankService;
import com.portfoli.service.RecommendationService;
import com.portfoli.service.SkillService;

@Controller
@RequestMapping("/rank")
@MultipartConfig(maxFileSize = 100000000)
public class RankController {
  int pageSize = 10;
  static Logger logger = LogManager.getLogger(RankController.class);

  public RankController() {
    RankController.logger.debug("RankController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @Autowired
  RecommendationService recommendationService;

  @Autowired
  BoardAttachmentService boardAttachmentService;

  @Autowired
  BoardService boardService;

  @Autowired
  PortfolioService portfolioService;

  @Autowired
  PortfolioSkillService portfolioSkillService;

  @Autowired
  FieldService fieldService;

  @Autowired
  SkillService skillService;

  @Autowired
  RankService rankService;

  @Autowired
  PortfolioSkillService portfoliSkillService;

  @GetMapping("list")
  public void list(HttpServletRequest request) throws Exception {
    List<Field> fieldList = fieldService.list();
    request.setAttribute("fieldList", fieldList);
  }

  @PostMapping(value = "listByOption", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String listByOption(HttpServletRequest request) throws Exception {

    List<Rank> rankList = rankService.list();
    request.setAttribute("rankList", rankList);
    return new Gson().toJson(rankList);
  }

  @PostMapping(value = "listByFilter", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String listByFilter(HttpServletRequest request,
      @RequestBody Map<String, Object> convertedData) throws Exception {

    List<String> skillList = (List<String>) convertedData.get("skillList");
    String orderCount = (String) convertedData.get("orderCount");

    List<Rank> rankList = rankService.list(convertedData);
    if (skillList.size() > 0) {
      rankList.sort(new Comparator<Rank>() {
        @Override
        public int compare(Rank o1, Rank o2) {
          int size = o1.getSkill().size();
          int compareSize = o2.getSkill().size();

          if (size < compareSize) {
            return 1;
          } else if (size > compareSize) {
            return -1;
          }
          return 0;
        }
      });
    }

    request.setAttribute("rankList", rankList);
    for (Rank r : rankList) {
      System.out.println(r);
    }
    return new Gson().toJson(rankList);
  }
}
