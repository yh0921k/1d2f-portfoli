package com.portfoli.web;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.dao.JobPostingDao;
import com.portfoli.dao.PortfolioDao;
import com.portfoli.service.BannerService;
import com.portfoli.service.JobPostingService;
import com.portfoli.service.MemberService;
import com.portfoli.service.PortfolioService;

@Controller
public class MainController {
  @Autowired
  ServletContext servletContext;
  
  @Autowired
  MemberService memberService;
  
  @Autowired
  PortfolioDao portfolioDao;
  
  @Autowired
  JobPostingDao jobPostingDao;

  @Autowired
  BannerService bannerService;

  @RequestMapping("/main")
  public void main(Model model) throws Exception {
    model.addAttribute("bannerList", bannerService.activatedList());
    model.addAttribute("memberCount", memberService.selectListCnt());
    model.addAttribute("portfolioCount", portfolioDao.selectMonthListCnt());
    model.addAttribute("sumViewCount", portfolioDao.sumViewCount());
    model.addAttribute("jobPostingCount", jobPostingDao.progressCnt());
  }
}