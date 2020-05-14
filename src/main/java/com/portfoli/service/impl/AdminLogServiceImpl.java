package com.portfoli.service.impl;

import java.io.EOFException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.stereotype.Component;
import com.portfoli.domain.AdminLog;
import com.portfoli.service.AdminLogService;

@Component
public class AdminLogServiceImpl implements AdminLogService {

  public AdminLogServiceImpl() {}

  @Override
  public ArrayList<AdminLog> get(String filepath, int startLine, int moreLine) throws Exception {
    // 기본 변수 설정
    ArrayList<AdminLog> list = new ArrayList<>();
    RandomAccessFile file = new RandomAccessFile(filepath, "r");
    long fileSize = file.length();
    long pos = fileSize - 1;
    int newLineCount = 0;
    AdminLog log;

    Matcher m;
    Pattern p = Pattern.compile(
        "^\\[([0-9]+)-([0-9]+)\\]:([0-9]*.[0-9]*.[0-9]*.[0-9]*)[\\s]>[ ]*([a-zA-Z0-9_-]*):(.*)$");

    try {
      // line 만큼 뒤에서부터 '\n' 찾으며 커서 이동 (이미 읽은 부분)
      while (newLineCount < startLine) {
        file.seek(pos);
        if (file.readByte() == '\n') {
          newLineCount++;
        }
        pos--;
      }

      newLineCount = 0;
      // line 만큼 뒤에서부터 '\n' 찾으며 커서 이동 (새로 읽어올 부분의 맨 앞)
      while (newLineCount < moreLine) {
        file.seek(pos);
        if (file.readByte() == '\n') {
          newLineCount++;
        }
        pos--;
      }

      file.seek(file.getFilePointer());
      // 더보기 라인 수(초기 출력 라인 수)만큼 list에 추가
      while (list.size() < moreLine) {
        // 한 라인을 String 형태로 가져옴
        StringBuffer buffer = new StringBuffer();
        while (true) {
          byte b = file.readByte();
          if (b == '\n') {
            // System.out.println("break 호출");
            break;
          }
          // System.out.println((char) b);
          // System.out.println(buffer.append((char) b));
          buffer.append((char) b);
        }
        // System.out.println("list called");
        buffer.deleteCharAt(buffer.length() - 1);

        System.out.println(new String(buffer));
        m = p.matcher(new String(buffer));
        System.out.println(m.matches());
        System.out.println(m.group(1));
        System.out.println(m.group(2));
        System.out.println(m.group(3));
        System.out.println(m.group(4));
        System.out.println(m.group(5));
        log = new AdminLog(m.group(1), m.group(2), m.group(3), m.group(4), m.group(5));
        list.add(log);
      }

    } catch (EOFException e) {
      System.out.println("Log file read complete");
    } finally {
      file.close();
    }

    // 리스트 역순 정렬 및 출력 테스트
    Collections.reverse(list);
    System.out.println(list.size());
    for (AdminLog l : list) {
      System.out.println(l);
    }
    return list;
  }
}
