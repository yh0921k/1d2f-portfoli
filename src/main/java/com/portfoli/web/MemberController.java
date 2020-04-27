package com.portfoli.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.Company;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.CompanyService;
import com.portfoli.service.MemberService;
import com.portfoli.service.UserMailSendService;

@Controller
@RequestMapping("member")
public class MemberController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public MemberController() {
    MemberController.logger.debug("GeneralMemeberController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @Autowired
  CompanyService companyService;
  
  @Autowired
  private UserMailSendService mailsender;

  // 일반회원

  @GetMapping("generalJoin")
  public void addForm() {}

  @PostMapping("generalJoin")
  public String add(Member member, GeneralMember generalMember, HttpServletRequest request,
      Model model) throws Exception {

    if (memberService.add(member, generalMember) > 0) {
   // 인증 메일 보내기 메서드
      mailsender.mailSendWithUserKey(member.getEmail(), member.getId(), member.getName(), request);
      return "redirect:/";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }


  @GetMapping("generalMypage")
  public void viewingMypage() throws Exception {}


  @PostMapping("updatePic")
  public String updatePic(HttpServletRequest request, Map<String, Object> generalMember,
      MultipartFile photoFile) throws Exception {

    generalMember = new HashMap<>();

    String filename = null;

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/member");
      filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      generalMember.put("photoFilePath", filename);
    }
    generalMember.put("member_number",
        ((Member) request.getSession().getAttribute("loginUser")).getNumber());

    if (memberService.updateProfilePic(generalMember) > 0) {
      GeneralMember loginUser = (GeneralMember) request.getSession().getAttribute("loginUser");
      loginUser.setPhotoFilePath(filename);
      request.setAttribute("loginUser", loginUser);

      return "redirect:/app/member/generalMypage";
    } else {
      throw new Exception("사진 업로드 실패.");
    }
  }


  @GetMapping("generalUpdate")
  public void generalInfoUpdate(HttpServletRequest request, Model model) throws Exception {
    GeneralMember generalMember = (GeneralMember) memberService.getGeneralMember(
        ((GeneralMember) request.getSession().getAttribute("loginUser")).getNumber());
    model.addAttribute("member", generalMember);
  }

  @PostMapping("updateDefaultInfo")
  public String updateDefaultInfo(HttpServletRequest request, GeneralMember member,
      MultipartFile photoFile) throws Exception {

    // 사진 파일 처리
    String filename = null;

    if (photoFile.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/member");
      filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      member.setPhotoFilePath(filename);
    } else {
      member.setPhotoFilePath(
          ((GeneralMember) request.getSession().getAttribute("loginUser")).getPhotoFilePath());
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



  // 기업회원

  @GetMapping("companyJoin")
  public void companyAddForm() {}

  @PostMapping("companyJoin")
  public String companyAdd(Member member, CompanyMember companyMember,
      @RequestParam("businessRegistrationNumber") String businessRegistrationNumber)
      throws Exception {

    Company company = companyService.getByBusinessRegistrationNumber(businessRegistrationNumber);
    if (memberService.add(member, companyMember, company.getNumber()) > 0) {
      return "redirect:/";
    } else {
      throw new Exception("회원을 추가할 수 없습니다.");
    }
  }



  // 공통

  @PostMapping("delete")
  public String memberDelete(HttpServletRequest request) throws Exception {

    int memberNumber = ((Member) request.getSession().getAttribute("loginUser")).getNumber();
    int memberType = ((Member) request.getSession().getAttribute("loginUser")).getType();

    if (memberService.delete(memberType, memberNumber) > 0) {
      request.getSession().invalidate();
      return "redirect:/";
    } else {
      throw new Exception("회원 삭제 실패");
    }
  }

  @PostMapping("updatePassword")
  public String updatePassword(HttpServletRequest request, String newPassword) throws Exception {

    int memberNumber = ((Member) request.getSession().getAttribute("loginUser")).getNumber();

    if (memberService.updatePassword(memberNumber, newPassword) > 0) {
      return "redirect:/app/member/generalUpdate";
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
  public void regSuccess() {
  }


  @GetMapping(value = "key_alter")
  public String key_alterConfirm(@RequestParam("user_id") String user_id,
      @RequestParam("user_key") String key) {

    mailsender.alter_userKey_service(user_id, key); // mailsender의 경우 @Autowired

    return "redirect:/app/member/regSuccess";
  }



}
