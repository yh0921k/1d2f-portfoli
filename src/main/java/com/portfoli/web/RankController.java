package com.portfoli.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Field;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.FieldService;
import com.portfoli.service.MemberService;
import com.portfoli.service.PortfolioService;
import com.portfoli.service.PortfolioSkillService;
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
  PortfolioSkillService portfoliSkillService;

  @GetMapping("list")
  public void list(HttpServletRequest request) throws Exception {
    List<Field> fieldList = fieldService.list();
    request.setAttribute("fieldList", fieldList);
  }

  // @RequestMapping("rankBySkill")
  // public String rankBySkill(Model model) throws Exception {
  // List<Recommendation> list = new ArrayList<>();
  //
  // List<Field> fields = fieldService.list();
  // for (Field field : fields) {
  // List<Recommendation> recommendations = recommendationService.rankBySkill(field.getNumber());
  //
  // for (Recommendation recommendation : recommendations) {
  // list.add(recommendation);
  // }
  // }
  // model.addAttribute("list", list);
  // return "portfolio/rankbanner";
  // }
  //
  // @RequestMapping("rankAll")
  // public String rankAll(Date startDate, Date endDate,
  // @RequestParam(defaultValue = "10") int quantity,
  // @ModelAttribute("recommendation") Recommendation recommendation,
  // @RequestParam(defaultValue = "1") int curPage, HttpServletRequest request, Model model)
  // throws Exception {
  // Object mem = request.getSession().getAttribute("loginUser");
  //
  // if (mem == null) {
  // throw new Exception("로그인을 하신 후, 포트폴리오 목록을 볼 수 있습니다.");
  // } else {
  //
  // this.pageSize = quantity;
  // Member member = memberService.getGeneralMember(((Member) mem).getNumber());
  // // 작성자 정보
  // model.addAttribute("generalMember", member);
  //
  // // 현재 날짜를 기준으로 검색
  // Calendar now = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
  // if (startDate == null && endDate == null) {
  // startDate =
  // Date.valueOf(now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 1) + "-" + "01");
  // endDate =
  // Date.valueOf(now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 2) + "-" + "01");
  // }
  //
  // // 전체리스트 개수
  // recommendation.setStartDate(startDate).setEndDate(endDate);
  // int listCnt = recommendationService.rankAllCnt(recommendation);
  //
  //
  // // 시작일 ~ 마지막일 model에 등록
  // model.addAttribute("startDate", startDate);
  // model.addAttribute("endDate", endDate);
  //
  // Pagination pagination = new Pagination(listCnt, curPage);
  // pagination.setPageSize(pageSize);// 한페이지에 노출할 게시글 수
  //
  // recommendation.setStartIndex(pagination.getStartIndex());
  // recommendation.setPageSize(pagination.getPageSize());
  //
  // // 전체리스트 출력
  // model.addAttribute("listCnt", listCnt);
  // model.addAttribute("pagination", pagination);
  //
  // List<Recommendation> list = recommendationService.rankAll(recommendation);
  //
  // for (Recommendation r : list) {
  // // 포트폴리오 스킬 붙이기
  // r.getPortfolio()
  // .setSkill(portfolioSkillService.findAllSkill(r.getBoard().getNumber()).getSkill());
  // }
  //
  // model.addAttribute("list", list);
  // model.addAttribute("pageSize", pageSize);
  // return "portfolio/ranklist";
  // }
  // }
}
