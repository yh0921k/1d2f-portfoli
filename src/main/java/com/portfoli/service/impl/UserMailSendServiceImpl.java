package com.portfoli.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import com.portfoli.dao.MemberDao;
import com.portfoli.service.UserMailSendService;

@Component
public class UserMailSendServiceImpl implements UserMailSendService {

  @Autowired
  JavaMailSender mailSender;

  MemberDao memberDao;
  
  public UserMailSendServiceImpl(MemberDao memberDao) {
    this.memberDao = memberDao;
  }

  // 이메일 난수 만드는 메서드
  private String init() {
    Random ran = new Random();
    StringBuffer sb = new StringBuffer();
    int num = 0;

    do {
      num = ran.nextInt(75) + 48;
      if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
        sb.append((char) num);
      } else {
        continue;
      }

    } while (sb.length() < size);
    if (lowerCheck) {
      return sb.toString().toLowerCase();
    }
    return sb.toString();
  }

  // 난수를 이용한 키 생성
  private boolean lowerCheck;
  private int size;

  @Override
  public String getKey(boolean lowerCheck, int size) {
    this.lowerCheck = lowerCheck;
    this.size = size;
    return init();
  }

  // 회원가입 발송 이메일(인증키 발송)
  @Override
  public void mailSendWithUserKey(String e_mail, String user_id, String user_name,
      HttpServletRequest request) {
    String key = getKey(false, 15);
    
    Map<String, Object> params = new HashMap<>();
    params.put("user_id", user_id);
    params.put("key", key);
    
    if(memberDao.putKey(params) >0) {
      MimeMessage mail = mailSender.createMimeMessage();
      String htmlStr = "<h2>안녕하세요. Portfoli에 가입해주셔서 감사합니다!</h2><br><br>" + "<h3>" + user_name
          + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " + "<a href='http://localhost:9999"
          + request.getContextPath() + "/app/member/key_alter?user_id=" + user_id + "&user_key=" + key
          + "'>인증하기</a></p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
      try {
        mail.setSubject(String.format("[본인인증] Portfoli: %s님의 인증메일입니다", user_name), "utf-8");
        mail.setText(htmlStr, "utf-8", "html");
        mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(e_mail));
        mailSender.send(mail);
      } catch (MessagingException e) {
        e.printStackTrace();
      }
    }

  }

  @Override
  public int alter_userKey_service(String user_id, String key) {

    int resultCnt = 0;
    Map<String, Object> params = new HashMap<>();
    params.put("user_id", user_id);
    params.put("key", key);
    resultCnt = memberDao.alter_userkey(params);

    return resultCnt;

  }

  @Override
  public void findPassword(String email) throws Exception {
    
    String password = getKey(true, 8);
    
    HashMap<String, Object> params = new HashMap<>();
    params.put("newPassword", password);
    params.put("email", email);
    memberDao.updatePassword(params);
    MimeMessage mail = mailSender.createMimeMessage();
    String htmlStr = "<h2>해당 계정의 임시 비밀번호가 발급되었습니다.<br><br>" + "<h3>" + password
        + "</h3><br><p><a href='http://localhost:9999/portfoli/'>Portfoli 바로가기</a><br>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
    try {
      mail.setSubject("[본인인증] Portfoli: 임시 비밀번호를 보내드립니다.", "utf-8");
      mail.setText(htmlStr, "utf-8", "html");
      mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
      mailSender.send(mail);
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    
  }

  @Override
  public void sendQnaReply(String email, String name, String content) throws Exception{
    try {
    MimeMessage mail = mailSender.createMimeMessage();
    String htmlStr = "<h2>안녕하세요. Portfoli에 문의 남겨주셔서 감사합니다. 이에 대한 답변을 드립니다.</h2><br><br>" + "<p>" + content + "<br> 항상 portfoli를 이용해 주셔서 감사합니다.</p> ";
      mail.setSubject(String.format("[QNA 답변] Portfoli: %s님의 문의 내역에 대한 답변입니다.", name), "utf-8");
    mail.setText(htmlStr, "utf-8", "html");
    mail.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));
    mailSender.send(mail);
    } catch (MessagingException e) {
      throw new Exception("답변 Email 보내는 중 오류 발생");
    }
  }

}
