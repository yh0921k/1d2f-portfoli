package com.portfoli.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.portfoli.domain.Certificate;
import com.portfoli.domain.Company;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.FinalEducation;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.GeneralMemberCertification;
import com.portfoli.domain.GeneralMemberEducation;
import com.portfoli.domain.Member;
import com.portfoli.service.CertificateService;
import com.portfoli.service.CompanyService;
import com.portfoli.service.FinalEducationService;
import com.portfoli.service.MemberService;
import com.portfoli.service.UserMailSendService;

@Controller
@RequestMapping("member")
public class MemberController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public MemberController() {
    MemberController.logger.debug("MemeberController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @Autowired
  CompanyService companyService;

  @Autowired
  CertificateService certificateService;

  @Autowired
  FinalEducationService finalEducationService;

  @Autowired
  private UserMailSendService mailsender;

  // 일반회원

  @GetMapping("generalJoin")
  public void addForm() {}

  @PostMapping("generalJoin")
  public ModelAndView add(Member member, GeneralMember generalMember, HttpServletRequest request,
      Model model) throws Exception {

    if (memberService.add(member, generalMember) > 0) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("message1", "입력하신 이메일로 이메일 인증 메일을 발송하였습니다.");
      mv.addObject("message2", "인증 후 로그인하실 수 있습니다.");
      mv.setViewName("messageView");
      // 인증 메일 보내기 메서드
      mailsender.mailSendWithUserKey(member.getEmail(), member.getId(), member.getName(), request);
      return mv;
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }


  @GetMapping("generalMypage")
  public void viewingGeneralMypage() throws Exception {}


  @PostMapping("updatePic")
  public String updatePic(HttpServletRequest request, Map<String, Object> member,
      MultipartFile photoFile) throws Exception {

    member = new HashMap<>();

    String filename = null;

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/member");
      filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      member.put("photoFilePath", filename);
    }
    member.put("number", ((Member) request.getSession().getAttribute("loginUser")).getNumber());

    if (memberService.updateProfilePic(member) > 0) {
      Member loginUser = (Member) request.getSession().getAttribute("loginUser");
      loginUser.setPhotoFilePath(filename);
      request.setAttribute("loginUser", loginUser);
      if(loginUser.getType() == 1) {
        return "redirect:/app/member/generalMypage";
      } else {
        return "redirect:/app/member/companylMypage";
      }
    } else {
      throw new Exception("사진 업로드 실패.");
    }
  }


  @GetMapping("generalUpdate")
  public void generalInfoUpdate(HttpServletRequest request, Model model) throws Exception {
    GeneralMember generalMember = memberService.getGeneralMember(
        ((GeneralMember) request.getSession().getAttribute("loginUser")).getNumber());
    List<GeneralMemberCertification> memberCerts = certificateService.getMemberCerts(
        ((GeneralMember) request.getSession().getAttribute("loginUser")).getNumber());
    GeneralMemberEducation memEdu = finalEducationService
        .memEuds(((GeneralMember) request.getSession().getAttribute("loginUser")).getNumber());
    List<FinalEducation> edus = finalEducationService.findAll();
    model.addAttribute("member", generalMember);
    model.addAttribute("memberCerts", memberCerts);
    model.addAttribute("memEdu", memEdu); // 회원의 학력
    model.addAttribute("edus", edus); // 학력 카테고리 리스트
  }

  @PostMapping("updateDefaultInfo")
  public String updateDefaultInfo(HttpServletRequest request, GeneralMember member, MultipartFile photoFile) throws Exception {

    // 사진 파일 처리
    String filename = null;

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/member");
      filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      member.setPhotoFilePath(filename);
    } else {
      member.setPhotoFilePath(
          ((Member) request.getSession().getAttribute("loginUser")).getPhotoFilePath());
    }
    int memberNumber = ((Member) request.getSession().getAttribute("loginUser")).getNumber();
    member.setNumber(memberNumber);
    if (memberService.updateDefaultInfo(member) > 0) {
      request.getSession().setAttribute("loginUser", memberService.getSessionInfo(memberNumber));
      return "redirect:/app/member/generalUpdate";
    } else {
      throw new Exception("회원 정보 수정 실패");
    }
  }


  @GetMapping("updateFlag")
  public String updateFlag(Member member, HttpServletRequest request) throws Exception {

    GeneralMember loginUser = (GeneralMember) request.getSession().getAttribute("loginUser");

    int flag = loginUser.getSeekingFlag();
    if (flag == 0) {
      flag = 1;
    } else {
      flag = 0;
    }

    HashMap<String, Object> params = new HashMap<>();
    params.put("loginUser", loginUser.getNumber());
    params.put("flag", flag);

    if (memberService.updateFlag(params) > 0) {
      loginUser.setSeekingFlag(flag);
      request.setAttribute("loginUser", loginUser);

      return "redirect:/app/member/generalMypage";
    } else {
      throw new Exception("seekingFlag 업데이트 실패");
    }

  }

  @PostMapping("updateProfile")
  public String updateProfile(HttpServletRequest request, HttpSession session) throws Exception {
    int memberNumber = ((Member) session.getAttribute("loginUser")).getNumber();
    String[] name = request.getParameterValues("name");
    String[] issueDate = request.getParameterValues("issueDate");
    String[] expireDate = request.getParameterValues("expireDate");
    List<GeneralMemberCertification> certs = new ArrayList<>();

    for (int i = 0; i < name.length; i++) {
      GeneralMemberCertification memCert = new GeneralMemberCertification();
      Certificate cert = certificateService.getByName(name[i]);

      memCert.setCertificate(cert);
      memCert.setCertificateNumber(cert.getCertificateNumber());
      memCert.setMemberNumber(memberNumber);
      memCert.setIssueDate(issueDate[i]);
      memCert.setExpireDate(expireDate[i]);
      certs.add(memCert);
      //System.out.println("------------------------" + memCert);

    }

    certificateService.insertCertsByMemberNumber(certs, memberNumber);

    int educationNumber = Integer.parseInt(request.getParameter("edu.educationNumber"));
    String schoolName = request.getParameter("schoolName");

    List<GeneralMemberEducation> edus = new ArrayList<>();
    GeneralMemberEducation memEdu = new GeneralMemberEducation();
    memEdu.setGeneralMemberNumber(memberNumber);
    memEdu.setEducationNumber(educationNumber);
    memEdu.setSchoolName(schoolName);
    edus.add(memEdu);
    //System.out.println("-------------" + memEdu);

    finalEducationService.insertEduByMemberNumber(edus, memberNumber);
    return "redirect:/app/member/generalUpdate";
  }


  // 기업회원

  @GetMapping("companyJoin")
  public void companyAddForm() {}

  @PostMapping("companyJoin")
  public ModelAndView companyAdd(Member member, CompanyMember companyMember,
      @RequestParam("businessRegistrationNumber") String businessRegistrationNumber,
      HttpServletRequest request) throws Exception {

    Company company = companyService.getByBusinessRegistrationNumber(businessRegistrationNumber);
    if (memberService.add(member, companyMember, company.getNumber()) > 0) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("message1", "입력하신 이메일로 이메일 인증 메일을 발송하였습니다.");
      mv.addObject("message2", "인증 후 로그인하실 수 있습니다.");
      mv.setViewName("messageView");
      mailsender.mailSendWithUserKey(member.getEmail(), member.getId(), member.getName(), request);
      return mv;
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }

  @GetMapping("companyMypage")
  public void viewingCompanyMypage(HttpSession session, Model model) throws Exception {
    Company company = companyService.get(((CompanyMember) session.getAttribute("loginUser")).getCompanyNumber());
    //System.out.println("--------------" + company);
    model.addAttribute("company", company);
  }


  @GetMapping("companyUpdate")
  public void companyUpdate(HttpServletRequest request, Model model) throws Exception {
    CompanyMember companyMember = memberService.getCompanyMember(((CompanyMember) request.getSession().getAttribute("loginUser")).getNumber());
    //System.out.println("-----------" + companyMember);
    model.addAttribute("member", companyMember);
  }

  // 공통

  @PostMapping("delete")
  public String memberDelete(HttpServletRequest request, String currentPassword) throws Exception {

    int memberNumber = ((Member) request.getSession().getAttribute("loginUser")).getNumber();
    int memberType = ((Member) request.getSession().getAttribute("loginUser")).getType();

    if (memberService.delete(memberType, memberNumber, currentPassword) > 0) {
      request.getSession().invalidate();
      return "redirect:/";
    } else {
      throw new Exception("회원 삭제 실패. 비밀번호를 확인해 주세요.");
    }
  }

  @PostMapping("updatePassword")
  public String updatePassword(HttpServletRequest request, String newPassword, String password) throws Exception {

    int memberNumber = ((Member) request.getSession().getAttribute("loginUser")).getNumber();

    if (memberService.updatePassword(memberNumber, newPassword, password) > 0) {
      if(((Member) request.getSession().getAttribute("loginUser")).getType() == 1) {
        return "redirect:/app/member/generalUpdate";
      } else {
        return "redirect:/app/member/companyUpdate";
      }
    } else {
      throw new Exception("비밀번호 수정 실패");
    }
  }

  @PostMapping("updateAddress")
  public String updateAddress(HttpServletRequest request, Member member) throws Exception {

    member.setNumber(((Member) request.getSession().getAttribute("loginUser")).getNumber());

    if (memberService.updateAddress(member) > 0) {
      return "redirect:/app/member/generalUpdate";
    } else {
      throw new Exception("주소 수정 실패 ");
    }
  }

  @GetMapping("regSuccess")
  public void regSuccess() {}


  @GetMapping(value = "key_alter")
  public String key_alterConfirm(@RequestParam("user_id") String user_id,
      @RequestParam("user_key") String key) {

    mailsender.alter_userKey_service(user_id, key); // mailsender의 경우 @Autowired

    return "redirect:/app/member/regSuccess";
  }

  @ResponseBody
  @RequestMapping(value = "checkEmail", method = RequestMethod.POST)
  public String checkSignup(HttpServletRequest request, Model model) {
    String email = request.getParameter("email");
    String searchedEmail = memberService.getEmailByEmail(email);
    if (searchedEmail != null) {
      return "1";
    } else {
      return "0";
    }
  }



}
