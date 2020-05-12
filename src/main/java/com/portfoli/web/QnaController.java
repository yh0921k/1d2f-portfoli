package com.portfoli.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Member;
import com.portfoli.domain.Qna;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.MemberService;
import com.portfoli.service.QnaService;


@Controller
@RequestMapping("qna")
public class QnaController {
  static Logger logger = LogManager.getLogger(QnaController.class);

  public QnaController() {
    QnaController.logger.debug("QnaController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardAttachmentService boardAttachmentService;

  @Autowired
  BoardService boardService;

  @Autowired
  QnaService qnaService;
  
  @Autowired
  MemberService memberService;

  // @Autowired
  // private UserMailSendService mailsender;

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Qna> qnas = qnaService.list();
    for(Qna qna : qnas) {
      System.out.println(qna);
      Member m = memberService.getM(qna.getMemberNumber());
      System.out.println(m);
      qna.setWriter(m.getName());
    }
    model.addAttribute("qnas", qnas);
  }
  
  @GetMapping("detail")
  public void detail(Model model) throws Exception {
    
  }


}
