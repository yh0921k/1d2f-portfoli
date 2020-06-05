package com.portfoli.web;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.portfoli.domain.District;
import com.portfoli.domain.Member;
import com.portfoli.domain.Rank;
import com.portfoli.service.CityService;
import com.portfoli.service.DistrictService;
import com.portfoli.service.RankService;

@Controller
@RequestMapping("/district")
public class DistrictController {

  static Logger logger = LogManager.getLogger(DistrictController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  DistrictService districtService;

  @Autowired
  CityService cityService;

  @Autowired
  RankService rankService;

  public DistrictController() {
    logger.debug("DistrictController 생성");
  }

  @GetMapping(value = "list", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String list(HttpServletRequest request, Model model, String selected) throws Exception {

    int cityNumber = cityService.get(selected);
    List<District> list = districtService.list(cityNumber);

    HashSet<Object> seen = new HashSet<>();
    list.removeIf(obj -> !seen.add(obj.getName()));
    list.removeIf(obj -> obj.getDistrictNumber() % 1000 == 0);

    model.addAttribute("list", list);
    return new Gson().toJson(list);
  }

  @GetMapping(value = "listOfUserInterest", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String listOfUserInterest(HttpServletRequest request, Model model) throws Exception {

    Member member = ((Member) request.getSession().getAttribute("loginUser"));
    int memberNumber = member.getNumber();

    List<District> list = districtService.listOfMember(memberNumber);
    model.addAttribute("list", list);
    return new Gson().toJson(list);
  }

  @PostMapping(value = "update", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String update(HttpServletRequest request, Model model, @RequestBody String data)
      throws Exception {

    Member member = ((Member) request.getSession().getAttribute("loginUser"));
    int memberNumber = member.getNumber();
    data = data.replaceAll("\\\"", "");
    data = data.replaceAll("\\\\", "");

    String[] updateList = new Gson().fromJson(data, String[].class);
    List<District> list = districtService.listOfMember(memberNumber);
    List<String> deleteList = new LinkedList<>();
    List<String> sameList = new LinkedList<>();

    for (int i = 0; i < list.size(); i++) {
      boolean flag = false;
      for (int j = 0; j < updateList.length; j++) {
        if (updateList[j].equals(list.get(i).getName())) {
          flag = true;
        }
      }
      if (!flag) {
        deleteList.add(list.get(i).getName());
      } else {
        sameList.add(list.get(i).getName());
      }
    }

    for (int i = 0; i < sameList.size(); i++) {
      for (int j = 0; j < updateList.length; j++) {
        if (sameList.get(i).equals(updateList[j])) {
          updateList[j] = null;
        }
      }
    }

    Map<String, Object> params = new HashMap<>();
    params.put("memberNumber", memberNumber);
    for (String districtName : deleteList) {
      params.put("districtName", districtName);
      District d = districtService.get(districtName);

      params.put("districtNumber", d.getDistrictNumber());

      districtService.delete(params);
    }


    for (String districtName : updateList) {
      if (districtName == null) {
        continue;
      }
      int districtNumber = districtService.get(districtName).getDistrictNumber();
      params.put("districtNumber", districtNumber);
      districtService.add(params);
    }
    return "OK";
  }

  @GetMapping(value = "list2", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String list2(String value) throws Exception {

    int cityNumber = cityService.get(value);
    List<District> list = districtService.list(cityNumber);
    List<Map<String, Object>> smartyList = new ArrayList<>();
    for (District d : list) {
      HashMap<String, Object> districtData = new HashMap<>();
      districtData.put("label", d.getName());
      districtData.put("value", d.getDistrictNumber());
      districtData.put("selected", false);
      smartyList.add(districtData);
    }
    HashSet<Object> seen = new HashSet<>();
    smartyList.removeIf(obj -> !seen.add(obj.get("label")));
    return new Gson().toJson(smartyList);
  }

  @PostMapping(value = "listByFilter", produces = "text/plain;charset=UTF-8")
  @ResponseBody
  public String listByFilter(HttpServletRequest request,
      @RequestBody Map<String, Object> convertedData) throws Exception {

    List<String> skillList = (List<String>) convertedData.get("skillList");
    String orderCount = (String) convertedData.get("orderCount");

    List<Rank> rankList = rankService.list(convertedData);
    if (skillList.size() > 0) {
      rankList.sort(new Comparator<Rank>() {
        @Override
        public int compare(Rank o1, Rank o2) {
          int size = o1.getSkill().size();
          int compareSize = o2.getSkill().size();

          if (size < compareSize) {
            return 1;
          } else if (size > compareSize) {
            return -1;
          }
          return 0;
        }
      });
    }

    request.setAttribute("rankList", rankList);
    for (Rank r : rankList) {
      System.out.println(r);
    }
    return new Gson().toJson(rankList);
  }
}
