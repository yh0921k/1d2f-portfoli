package com.portfoli.web;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.CertificateService;
import com.portfoli.service.FieldService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.MemberService;
import com.portfoli.service.PortfolioService;
import com.portfoli.service.PortfolioSkillService;
import com.portfoli.service.RankService;
import com.portfoli.service.RecommendationService;
import com.portfoli.service.SkillService;

@Controller
@RequestMapping("/recommendEmployer")
@MultipartConfig(maxFileSize = 100000000)
public class RecommendEmployerController {
  int pageSize = 10;
  static Logger logger = LogManager.getLogger(RankController.class);

  public RecommendEmployerController() {
    RankController.logger.debug("recommendEmployer 객체 생성!");
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

  @Autowired
  CertificateService certificateService;

  @Autowired
  FinalEducationService finalEducationService;

  @GetMapping("list")
  public void list(HttpServletRequest request, Model model) throws Exception {
  }

}
