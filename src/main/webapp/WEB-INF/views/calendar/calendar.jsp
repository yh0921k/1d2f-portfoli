<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">

	<div class="row">

		<jsp:include page="sidebar.jsp" />

		<div class="col-lg-8 mt--20">

				<!-- data-fullcalendar-modal-event-create="_ajax/fullcalendar_event_create.html"  -->
				<!-- data-fullcalendar-modal-event-edit="_ajax/fullcalendar_event_edit.html?id=" -->
			<div class="fullcalendar rounded"
				data-fullcalendar-default-view="dayGridMonth"
				data-fullcalendar-editable="true" data-fullcalendar-timezone="local"
				data-fullcalendar-default-date="now"
				data-fullcalendar-modal-size="modal-lg"
				data-fullcalendar-event-create-modal="true"
				data-fullcalendar-modal-event-create="eventCreate"
				data-fullcalendar-event-edit-modal="true"
				data-fullcalendar-modal-event-edit="eventEdit?id="
				data-fullcalendar-date-click="modal"
				data-fullcalendar-modal-date-click-modal="eventCreate?date="
				data-toast-success="Successfully Updated!"
				data-toast-position="top-center"
				data-fullcalendar-plugins='[ "interaction", "dayGrid", "timeGrid", "list", "bootstrap", "googleCalendar" ]'
				data-fullcalendar-google-apikey="AIzaSyCBpT7NTo9rwR-gS5iq7ayV-dGlE_Ebr0s"
				data-fullcalendar-source-json-url='[
    {
      "url": "_ajax/fullcalendar_events.json",
      "method": "GET",
      "extraParams": {
        "param1": "val1",
        "param2": "val2"
      }
    }, 

    {
      "googleCalendarId": "6dhq1i511vid645mmtn2pujfok@group.calendar.google.com",
      "className": "fc-smarty-gcal bg-primary-soft border-primary-soft"
    }
  ]'
				data-fullcalendar-lang-btn='{
    "today" : "today",
    "month" : "month",
    "week"   : "week",
    "day"  : "day",
    "list"   : "list"
  }'
				data-fullcalendar-header='{
    "left"     : "prev,next, today, customAddEventButton",
    "center"   : "title",
    "right"  : "dayGridMonth,timeGridWeek,timeGridDay,listWeek"
  }'
				data-fullcalendar-time-format='{
    "hour"     : "numeric",
    "minute"   : "2-digit",
    "meridiem"   : "short"
  }'></div>
		</div>

	</div>
</div>
<script>
$.SOW.vendor.fullcalendar.init('.fullcalendar');
</script>