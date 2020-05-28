package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("payment")
public class PaymentController {
  static Logger logger = LogManager.getLogger(PaymentController.class);

  public PaymentController() {
    PaymentController.logger.debug("PaymentController 객체 생성!");
  }

  @GetMapping("introduction")
  public void introduction() {}
}