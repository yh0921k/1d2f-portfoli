package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;
import com.portfoli.dao.CompanyDao;
import com.portfoli.dao.CompanyMemberDao;
import com.portfoli.dao.GeneralMemberDao;
import com.portfoli.dao.MemberDao;
import com.portfoli.domain.CompanyMember;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.MemberService;

@Component
public class MemberServiceImpl implements MemberService {

  MemberDao memberDao;
  GeneralMemberDao generalMemberDao;
  CompanyMemberDao companyMemberDao;
  CompanyDao companyDao;
  TransactionTemplate transactionTemplate;


  public MemberServiceImpl(MemberDao memberDao, GeneralMemberDao generalMemberDao,
      CompanyMemberDao companyMemberDao, CompanyDao companyDao,
      PlatformTransactionManager pftxManager) {
    this.memberDao = memberDao;
    this.generalMemberDao = generalMemberDao;
    this.companyMemberDao = companyMemberDao;
    this.companyDao = companyDao;
    this.transactionTemplate = new TransactionTemplate(pftxManager);
  }


  // 일반회원가입
  @Transactional
  @Override
  public int add(Member member, GeneralMember generalMember) throws Exception {
    member.setType(1);
    if (memberDao.insert(member) == 0) {
      return 0;
    }
    generalMember.setNumber(member.getNumber());
    generalMemberDao.insert(generalMember);
    return 1;
  }

  // 기업회원가입
  @Transactional
  @Override
  public int add(Member member, CompanyMember companyMember, int companyNumber) throws Exception {
    member.setType(2);
    if (memberDao.insert(member) == 0) {
      return 0;
    }

    companyMember.setNumber(member.getNumber());
    companyMember.setCompanyNumber(companyNumber);
    companyMemberDao.insert(companyMember);
    return 1;
  }


  // 로그인
  @Override
  public Member get(String email, String password) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("email", email);
    params.put("password", password);

    try {
      int type = memberDao.findByEmailAndPassword(params).getType();

      if (type == 1) {
        return generalMemberDao.findByEmailAndPassword(params);
      } else {
        return companyMemberDao.findByEmailAndPassword(params);
      }
    } catch (Exception e) {
      throw new Exception("로그인에 실패하였습니다. <br>아이디 혹은 비밀번호를 확인해주세요.");
    }
  }


  @Override
  public int updateProfilePic(Map<String, Object> member) throws Exception {
    if (memberDao.updateProfilePicture(member) > 0) {
      return 1;
    } else {
      return 0;
    }
  }


  @Override
  public Member get(int number) throws Exception {
    Member member = memberDao.findByMemberNumber(number);
    if ((member) != null) {
      return member;
    } else {
      return null;
    }
  }


  @Override
  public GeneralMember getGeneralMember(int number) throws Exception {
    GeneralMember generalMember = generalMemberDao.findByGeneralMemberNumber(number);
    if ((generalMember) != null) {
      return generalMember;
    } else {
      return null;
    }
  }


  @Override
  @Transactional
  public int delete(int memberType, int memberNumber, String currentPassword) throws Exception {

    HashMap<String, Object> params = new HashMap<>();
    params.put("member_no", memberNumber);
    params.put("pwd", currentPassword);
    if (memberType == 1) {
      if (generalMemberDao.delete(memberNumber) > 0) {
        if (memberDao.delete(params) == 0) {
          throw new RuntimeException("회원 삭제 실패. 비밀번호를 확인해 주세요.");
        }
        return 1;
      }
    } else if (memberType == 2) {
      if (companyMemberDao.delete(memberNumber) > 0) {
        if (memberDao.delete(params) == 0) {
          throw new RuntimeException("회원 삭제 실패. 비밀번호를 확인해 주세요.");
        }
        return 1;
      }
    }
    return 0;
  }


  @Override
  public int updatePassword(int memberNumber, String newPassword, String password)
      throws Exception {
    Map<String, Object> params = new HashMap<>();
    params.put("password", password);
    params.put("memberNumber", memberNumber);
    params.put("newPassword", newPassword);
    if (memberDao.updatePassword(params) > 0) {
      return 1;
    }
    return 0;
  }


  @Override
  @Transactional
  public int updateDefaultInfo(GeneralMember member) throws Exception {
    Map<String, Object> params = new HashMap<>();
    params.put("photoFilePath", member.getPhotoFilePath());
    params.put("number", member.getNumber());
    System.out.println("담음");
    if (memberDao.updateProfilePicture(params) > 0) {
      System.out.println("업프픽됨");
      if (memberDao.updateDefaultInfo(member) > 0) {
        System.out.println("업디인");
        return 1;
      }
      return 0;
    } else {
      return 0;
    }
  }

  @Override
  public GeneralMember getSessionInfo(int number) throws Exception {

    GeneralMember member = generalMemberDao.getSessionByGNumber(number);
    if (member != null) {
      return member;
    }
    return null;
  }


  @Override
  public int updateAddress(Member member) throws Exception {
    if (memberDao.updateAddress(member) > 0) {
      return 1;
    }
    return 0;
  }


  @Override
  public int updateFlag(HashMap<String, Object> params) throws Exception {
    if (generalMemberDao.updateFlag(params) > 0) {
      return 1;
    }
    return 0;
  }


  @Override
  public String getEmailByEmail(String email) {
    String userEmail = memberDao.getEmailByEmail(email);
    if (userEmail != null) {
      return userEmail;
    }
    return null;
  }

  // OAuth
  @Override
  public Member findMemberByOtherProvider(String provider, String email) throws Exception {
    try {
      Map<String, Object> params = new HashMap<>();
      params.put("provider", provider);
      params.put("email", email);
      Member member = memberDao.getMemberByOtherProvider(params);
      if (member != null) {
        return generalMemberDao.findByEmailAndPassword(params);
      }
      return null;
    } catch (Exception e) {
      throw new Exception(provider + " 연동 로그인 실패");
    }
  }


  @Override
  public int updateProvider(String provider, String email) {
    Map<String, Object> params = new HashMap<>();
    params.put("provider", provider);
    params.put("email", email);

    if (memberDao.updateProviderByEmail(params) > 0) {
      return 1;
    } else {
      return 0;
    }
  }


  @Override
  public String getProviderByEmail(String email) throws Exception {
    return memberDao.findProviderByEmail(email);
  }


  // 어드민
  
  @Override
  public List<Member> list(String regisDate, int currentPage, int pageSize) throws Exception {
    HashMap<String, Object> params = new HashMap<>();
    params.put("offset", (currentPage - 1) * pageSize);
    params.put("pageSize", pageSize);
    params.put("createDate", regisDate);
    
    List<Member> members = memberDao.findAll(params);
    if(members.size() < 0) {
      throw new Exception("회원 정보 불러오기 실패");
    }
    return members;
  }


  @Override
  public int selectListCnt() throws Exception {
    return memberDao.count();
  }



}
