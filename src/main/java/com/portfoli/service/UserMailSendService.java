package com.portfoli.service;

import javax.servlet.http.HttpServletRequest;

public interface UserMailSendService {

  String getKey(boolean lowerCheck, int size);

  void mailSendWithUserKey(String e_mail, String user_id, String user_name,
      HttpServletRequest request);

  int alter_userKey_service(String user_id, String key);

}
