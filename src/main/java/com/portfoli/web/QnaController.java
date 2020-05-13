package com.portfoli.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.portfoli.domain.Member;
import com.portfoli.domain.Qna;
import com.portfoli.domain.QnaCategory;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.MemberService;
import com.portfoli.service.QnaCategoryService;
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

  @Autowired
  QnaCategoryService qnaCategoryService;

  // @Autowired
  // private UserMailSendService mailsender;

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<Qna> qnas = qnaService.list();
    for (Qna qna : qnas) {
      qna.setWriter(memberService.getM(qna.getMemberNumber()).getName());
    }
    model.addAttribute("qnas", qnas);
  }

  @GetMapping("detail")
  public ModelAndView detail(HttpServletRequest request, HttpServletResponse response,
      HttpSession session, int no) throws Exception {
    Map<String, Object> params = new HashMap<>();
    ModelAndView mv = new ModelAndView();
    Qna qna = qnaService.get(no);

    // 새로고침 조회수 막기
    Cookie[] cookies = request.getCookies();
    Cookie viewCookie = null;

    if (cookies != null && cookies.length > 0) {
      for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().contentEquals("cookie" + no)) {
          viewCookie = cookies[i];
        }
      }
    }

    if (qna != null) {
      qna.setWriter(memberService.getM(qna.getMemberNumber()).getName());
      mv.addObject("qna", qna);

      if (viewCookie == null) {
        Cookie newCookie = new Cookie("cookie" + no, "|" + no + "|");
        response.addCookie(newCookie);

        int viewCount = qna.getViewCount() + 1;
        params.put("viewCount", viewCount);
        params.put("boardNo", no);
        boardService.addViewCount(params);
      }
    }
    return mv;

  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    qnaService.delete(no);
    return "redirect:/app/qna/list";
  }

  @GetMapping("update")
  public void updateForm(Model model, int no) throws Exception {
    Qna qna = qnaService.get(no);
    List<QnaCategory> categories = qnaCategoryService.get();
    qna.setWriter(memberService.getM(qna.getMemberNumber()).getName());
    model.addAttribute("qna", qna);
    model.addAttribute("categories", categories);
  }

  @PostMapping("update")
  public String update(Qna qna) throws Exception {
    int no = qna.getNumber();
    qnaService.update(qna);
    return "redirect:/app/qna/detail?no=" + no;
  }

  @GetMapping("add")
  public void addForm(Model model) throws Exception {
    List<QnaCategory> categories = qnaCategoryService.get();
    model.addAttribute("categories", categories);
  }

  @PostMapping("add")
  public String add(Qna qna, HttpServletRequest request) throws Exception {
    Member m = (Member) request.getSession().getAttribute("loginUser");
    int no = m.getNumber();
    qna.setMemberNumber(no);
    qnaService.add(qna);
    return "redirect:/app/qna/list";
  }


}
