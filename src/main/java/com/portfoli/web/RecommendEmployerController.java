package com.portfoli.web;

import java.util.ArrayList;
import java.util.List;
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
import com.portfoli.domain.Field;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.Member;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.CertificateService;
import com.portfoli.service.FieldService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.JobPostingService;
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

  @Autowired
  JobPostingService jobPostingService;

  @GetMapping("list")
  public void list(HttpServletRequest request, Model model) throws Exception {
    Member member = (Member) request.getSession().getAttribute("loginUser");

    if(member == null) {
      throw new Exception("로그인을 하신 후, 포트폴리오 목록을 볼 수 있습니다.");
    } else {
      List<JobPosting> jobpostings = new ArrayList<>();

      List<Field> fields = fieldService.listOfMemberInterest(member.getNumber());
      List<Integer> fieldNumbers = new ArrayList<>();
      for(Field field : fields) {
        fieldNumbers.add(field.getNumber());
      }

      // 일반회원 관심지역 번호 뽑아와야함
      //      List<District> districts = interestLocationService.get(generalMemberNumber);
      List<Integer> districtNumbers = new ArrayList<>();
      //      for(District district : districts) {
      //        districtNumbers.add(district.getDistrictNumber());
      //      }
      districtNumbers.add(101010);

      // 조건에 충적하는 리스트 찾기
      for(int districtNumber : districtNumbers) {
        for(int fieldNumber : fieldNumbers) {
          jobpostings.addAll(jobPostingService.findRecommendedEmployerList(districtNumber, fieldNumber));
        }
      }

      model.addAttribute("jobpostings", jobpostings);
    }
  }

}
