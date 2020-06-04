package com.portfoli.web;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.service.BannerService;

@Controller
public class MainController {
  @Autowired
  ServletContext servletContext;

  @Autowired
  BannerService bannerService;

  @RequestMapping("/main")
  public void main(Model model) throws Exception {
    model.addAttribute("bannerList", bannerService.activatedList());
  }
}