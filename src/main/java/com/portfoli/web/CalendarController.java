package com.portfoli.web;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.portfoli.domain.Calendar;
import com.portfoli.domain.Member;
import com.portfoli.service.CalendarService;

@Controller
@RequestMapping("calendar")
public class CalendarController {

  @Autowired
  CalendarService calendarService;

  static Logger logger = LogManager.getLogger(CalendarController.class);

  public CalendarController() {
    CalendarController.logger.debug("CalendarController 객체 생성!");
  }

  @GetMapping("calendar")
  public void calendar() throws Exception {}

  @GetMapping("eventCreate")
  public void eventCreateModal(String date, Model model) throws Exception {
    model.addAttribute("startDate", date);
  }

  @PostMapping("eventCreate")
  public String eventCreate(Calendar calendar, HttpSession session) throws Exception {
    calendar.setGeneralMemberNumber(((Member) session.getAttribute("loginUser")).getNumber());
    calendarService.add(calendar);
    return "redirect:/app/calendar/calendar";
  }

  @GetMapping("eventEdit")
  public void eventEditModal(String id, Model model) throws Exception {
    model.addAttribute("id", id);
  }

  @PostMapping("eventEdit")
  public void eventEdit(Calendar calendar, HttpSession session) throws Exception {
    calendar.setGeneralMemberNumber(((Member) session.getAttribute("loginUser")).getNumber());
    // calendarService.update(calendar);
  }

  @ResponseBody
  @PostMapping("schedule")
  public String schedule(HttpSession session, String start) throws Exception {
    int memberNumber = ((Member) session.getAttribute("loginUser")).getNumber();
    List<Calendar> schedules = calendarService.get(memberNumber);
    Gson gson = new Gson();
    String list = gson.toJson(schedules);
    System.out.println(list);
    return list;
  }

  @GetMapping("delete")
  public String  delete(String id) throws Exception {
    calendarService.delete(Integer.parseInt(id));
    return "redirect:/app/calendar/calendar";
  }

}
