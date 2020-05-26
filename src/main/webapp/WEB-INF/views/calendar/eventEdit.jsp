<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="modal-header">
      <h2 class="modal-title fs--18 m-0">일정</h2>

      <button type="button" class="close pointer" data-dismiss="modal" aria-label="Close">
        <span class="fi fi-close fs--18" aria-hidden="true"></span>
      </button>
    </div>

    <div class="modal-body p--30">

      <div class="accordion" id="accordionFullcalendarEdit">

        <div class="collapse show" id="accordionDetail" data-parent="#accordionFullcalendarEdit">

          <h5 class="mb-3">
            <span id="info_className" class="w--20 h--20 text-center line-height-1 mt--2 rounded-circle d-inline-block float-start">&bull;</span>
            <span id="info_title">&ndash;</span>
          </h5>
          <ul class="list-unstyled">

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">일정 상세:</div>
              <div class="flex-grow-1">

                <div id="info_description" class="hide-empty bg-light p--15 rounded mb-3"></div>
              </div>
            </li>

            <li class="list-item"><hr></li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">시작일:</div>
              <div class="flex-grow-1 text-truncate" id="info_start">&ndash;</div>
            </li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">종료일:</div>
              <div class="flex-grow-1 text-truncate" id="info_end">&ndash;</div>
            </li>

          </ul>


          <div class="mt--30">
            <a href="#accordionEdit" class="btn btn-light btn-sm" data-toggle="collapse" aria-expanded="true" aria-controls="accordionEdit">
              <i class="fi fi-pencil"></i> 일정 수정  </a>
          </div>

        </div>
        <!-- /DETAIL -->


        <form class="bs-validate js-ajax collapse" id="accordionEdit" novalidate data-parent="#accordionFullcalendarEdit" action="eventEdit" method="POST" 
            data-modal-autoclose-on-success="true"
            data-modal-autoclose-on-success-delay="800"

            data-ajax-container="#ajax_response_container" 
            data-ajax-update-url="false" 
            data-ajax-show-loading-icon="true" 

            data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> 필수 입력 사항을 입력해 주십시오." 
            data-error-toast-delay="3000" 
            data-error-toast-position="top-center" 
            data-error-scroll-up="true"

            data-ajax-callback-function="reload">

          <!-- nestable item id -->
          <input type="hidden" id="action" name="action" value="add_event"> <!-- action updated by delete button (on click) -->
          <input type="hidden" id="event_id" name="id" value=${id}>


          <div class="bg-light pl--20 pr--20 pt--20 mb-4 rounded">

            <div class="row">

              <div class="col-12 col-lg-6 mb-3">

                <div class="form-label-group">

                  <input required autocomplete="off" type="text" class="form-control rangepicker" 
                    data-load-delay="800" 
                    data-single-datepicker="true" 
                    data-timepicker="true" 
                    data-timepicker-24h="false" 
                    data-timepicker-show-seconds="false" 
                    data-disable-auto-update-input="false" 
                    data-date-start="" 
                    data-date-format="YYYY-MM-DD HH:mm" 
                    data-quick-locale='{
                      "lang_apply"  : "Apply",
                      "lang_cancel" : "Cancel",
                      "lang_months"   : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                      "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                    }' placeholder="Event Date Start" name="start" id="start">

                  <label for="start">시작일</label>
                  <a href="#" class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>

                </div>

              </div>

              <div class="col-12 col-lg-6 mb-3">

                <div class="form-label-group">

                  <input autocomplete="off" type="text" class="form-control rangepicker" 
                    data-single-datepicker="true" 
                    data-timepicker="true" 
                    data-timepicker-24h="false" 
                    data-timepicker-show-seconds="false" 
                    data-disable-auto-update-input="true" 
                    data-date-format="YYYY-MM-DD HH:mm" 
                    data-date-start="" 
                    data-quick-locale='{
                      "lang_apply"  : "Apply",
                      "lang_cancel" : "Cancel",
                      "lang_months"   : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                      "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                    }' placeholder="Event Date End" name="end" id="end">

                  <label for="end">종료일</label>
                  <a href="#" class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>

                </div>

              </div>

            </div>

          </div>



          <div class="form-label-group mb-3">
            <input required placeholder="Event Name" id="title" name="title" type="text" value="" class="form-control">
            <label for="title">일정 이름</label>
          </div>


          <select class="form-control bs-select mb-3" id="className" name="className" title="Please Select...">
            <option value="bg-primary border-primary text-white" selected="" data-content="<span class='bg-primary border-primary text-white p--3 pl--5 pr--5 rounded fs--14'>blue</span>">blue</option>
            <option value="bg-secondary border-secondary text-white" data-content="<span class='bg-secondary border-secondary text-white p--3 pl--5 pr--5 rounded fs--14'>gray</span>">gray</option>
            <option value="bg-light border-light text-dark" data-content="<span class='bg-light border-light text-dark p--3 pl--5 pr--5 rounded fs--14'>light</span>">light</option>
            <option value="bg-success border-success text-white" data-content="<span class='bg-success border-success text-white p--3 pl--5 pr--5 rounded fs--14'>green</span>">green</option>
            <option value="bg-warning border-warning text-dark" data-content="<span class='bg-warning border-warning text-dark p--3 pl--5 pr--5 rounded fs--14'>yellow</span>">yellow</option>
            <option value="bg-danger border-danger text-white" data-content="<span class='bg-danger border-danger text-white p--3 pl--5 pr--5 rounded fs--14'>red</span>">red</option>
            <option value="bg-info border-info text-white" data-content="<span class='bg-info border-info text-white p--3 pl--5 pr--5 rounded fs--14'>skyblue</span>">skyblue</option>
            <option value="bg-purple border-purple text-white" data-content="<span class='bg-purple border-purple text-white p--3 pl--5 pr--5 rounded fs--14'>purple</span>">Purple</option>
            <option value="bg-indigo border-indigo text-white" data-content="<span class='bg-indigo border-indigo text-white p--3 pl--5 pr--5 rounded fs--14'>indigo</span>">Indigo</option>
            <option value="bg-pink border-pink text-white" data-content="<span class='bg-pink border-pink text-white p--3 pl--5 pr--5 rounded fs--14'>pink</span>">Pink</option>
          </select>


          <div class="form-label-group mb-3">
            <textarea placeholder="Event Description" id="description" name="description" class="form-control" rows="3"></textarea>
            <label for="description">일정 상세</label>
          </div>

          <div class="row">
            <div class="col-12 col-md-6 mt-3">
              <button type="submit" class="btn-fullcalendar-edit btn btn-primary btn-soft btn-block">일정 수정</button>
            </div>

            <div class="col-12 col-md-6 mt-3">
              <a href="/portfoli/app/calendar/delete?id=${id}"><button type="button" class="btn-fullcalendar-remove btn btn-danger btn-soft btn-block" 
                onclick="jQuery('#action').val('del_event');">일정 삭제</button></a>
            </div>
          </div>


          <div class="text-center mt--30">
            <a href="#accordionDetail" class="btn btn-light btn-sm" data-toggle="collapse" aria-expanded="true" aria-controls="accordionDetail">
              <i class="fi fi-close"></i>수정 취소하기</a>
          </div>

        </form>

      </div>

    </div>

<script>
function reload() {
  window.location.href="/portfoli/app/calendar/calendar";
}
</script>