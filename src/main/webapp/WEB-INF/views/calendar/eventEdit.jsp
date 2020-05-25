<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="modal-header">
      <h2 class="modal-title fs--18 m-0">
        Event
      </h2>

      <button type="button" class="close pointer" data-dismiss="modal" aria-label="Close">
        <span class="fi fi-close fs--18" aria-hidden="true"></span>
      </button>
    </div>

    <div class="modal-body p--30">

      <div class="accordion" id="accordionFullcalendarEdit">


        <!-- 

          DETAIL 
          Updated By Fullcalendar Controller

        -->
        <div class="collapse show" id="accordionDetail" data-parent="#accordionFullcalendarEdit">

          <h5 class="mb-3">
            <span id="info_className" class="w--20 h--20 text-center line-height-1 mt--2 rounded-circle d-inline-block float-start">&bull;</span>
            <span id="info_title">&ndash;</span>
          </h5>
          <ul class="list-unstyled">

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">Description:</div>
              <div class="flex-grow-1">
                <!-- small trick: .hide-empty will hide if no content -->
                <div id="info_description" class="hide-empty bg-light p--15 rounded mb-3"></div>
              </div>
            </li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">URL:</div>
              <div class="flex-grow-1 text-truncate" id="info_url">&ndash;</div>
            </li>

            <li class="list-item"><hr></li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">Start Date:</div>
              <div class="flex-grow-1 text-truncate" id="info_start">&ndash;</div>
            </li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">End Date:</div>
              <div class="flex-grow-1 text-truncate" id="info_end">&ndash;</div>
            </li>

            <li class="list-item"><hr></li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">Start Reccurency:</div>
              <div class="flex-grow-1 text-truncate" id="info_startRecur">&ndash;</div>
            </li>

            <li class="list-item d-flex">
              <div class="w--180 flex-none font-weight-medium">End Reccurency:</div>
              <div class="flex-grow-1 text-truncate" id="info_endRecur">&ndash;</div>
            </li>

          </ul>


          <div class="mt--30">
            <a href="#accordionEdit" class="btn btn-light btn-sm" data-toggle="collapse" aria-expanded="true" aria-controls="accordionEdit">
              <i class="fi fi-pencil"></i> 
              Edit Event
            </a>
          </div>

        </div>
        <!-- /DETAIL -->


        <!-- <form class="bs-validate collapse" novalidate action="../../html_frontend/demo.files/php/demo.ajax_request.php" method="POST"> -->
        <form class="bs-validate js-ajax collapse" id="accordionEdit" novalidate data-parent="#accordionFullcalendarEdit"
            method="post" 
            action="../../html_frontend/demo.files/php/demo.ajax_request.php" 
            method="POST" 

            data-modal-autoclose-on-success="true"
            data-modal-autoclose-on-success-delay="800"

            data-ajax-container="#ajax_response_container" 
            data-ajax-update-url="false" 
            data-ajax-show-loading-icon="true" 

            data-error-toast-text="<i class='fi fi-circle-spin fi-spin float-start'></i> Please, complete all required fields!" 
            data-error-toast-delay="3000" 
            data-error-toast-position="top-center" 
            data-error-scroll-up="true"

            data-ajax-callback-function="">

          <!-- nestable item id -->
          <input type="hidden" id="action" name="action" value="add_event"> <!-- action updated by delete button (on click) -->
          <input type="hidden" id="event_id" name="id" value=""><!-- database generated id -OR- populated by js (if empty = current timestamp)  -->


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

                  <label for="start">Event Date Start</label>
                  <a href="#" class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>

                </div>


                <label class="form-switch form-switch-pill form-switch-primary d-block mb-0 mt-3">
                  <input type="checkbox" id="recurrent_enable" value="1" data-toggle="collapse" data-target="#event_recurrency">
                  <i data-on="&#10004;" data-off="&#10005;"></i>
                  Recurrency
                </label>

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

                  <label for="end">Event Date End</label>
                  <a href="#" class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>

                </div>

              </div>

            </div>


            <!-- recurrency -->
            <div id="event_recurrency" class="collapse">
              <div class="row">

                <div class="col-12 col-lg-6 mb-3">

                  <div class="form-label-group">

                    <input autocomplete="off" type="text" class="form-control rangepicker" 
                      data-single-datepicker="true" 
                      data-timepicker="true" 
                      data-timepicker-24h="false" 
                      data-timepicker-show-seconds="false" 
                      data-disable-auto-update-input="true" 
                      data-date-start="" 
                      data-date-format="YYYY-MM-DD HH:mm" 
                      data-quick-locale='{
                        "lang_apply"  : "Apply",
                        "lang_cancel" : "Cancel",
                        "lang_months"   : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                      }' placeholder="Recurrency Date Start" name="startRecur" id="startRecur">

                    <label for="startRecur">Recurrency Date Start</label>
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
                      data-date-start="" 
                      data-date-format="YYYY-MM-DD HH:mm" 
                      data-quick-locale='{
                        "lang_apply"  : "Apply",
                        "lang_cancel" : "Cancel",
                        "lang_months"   : ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        "lang_weekdays" : ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]
                      }' placeholder="Recurrency Date End" name="endRecur" id="endRecur">

                    <label for="endRecur">Recurrency Date End</label>
                    <a href="#" class="btn btn-rangepicker-clear position-absolute end-0 top-0 z-index-2 fi fi-close"></a>

                  </div>

                </div>

                <div class="col-12 mb-3">

                  <select multiple class="form-control bs-select" id="daysOfWeek" name="daysOfWeek[]" title="Days to repeat">
                    <option value="0">Sun</option>
                    <option value="1">Mon</option>
                    <option value="2">Tue</option>
                    <option value="3">Wed</option>
                    <option value="4">Thu</option>
                    <option value="5">Fri</option>
                    <option value="6">Sat</option>
                  </select>

                </div>

              </div>
            </div>
            <!-- /recurrency -->

          </div>







          <div class="form-label-group mb-3">
            <input required placeholder="Event Name" id="title" name="title" type="text" value="" class="form-control">
            <label for="title">Event Name</label>
          </div>

          <div class="form-label-group mb-3">
            <input placeholder="Event URL" id="url" name="url" type="text" value="" class="form-control">
            <label for="url">Event URL</label>
          </div>


          <select class="form-control bs-select mb-3" id="className" name="className" title="Please Select...">
            <option value="bg-primary border-primary text-white" selected="" data-content="<span class='bg-primary border-primary text-white p--3 pl--5 pr--5 rounded fs--14'>Primary</span>">Primary</option>
            <option value="bg-secondary border-secondary text-white" data-content="<span class='bg-secondary border-secondary text-white p--3 pl--5 pr--5 rounded fs--14'>Secondary</span>">Secondary</option>
            <option value="bg-dark border-dark text-white" data-content="<span class='bg-dark border-dark text-white p--3 pl--5 pr--5 rounded fs--14'>Dark</span>">Dark</option>
            <option value="bg-light border-light text-dark" data-content="<span class='bg-light border-light text-dark p--3 pl--5 pr--5 rounded fs--14'>Light</span>">Light</option>
            <option value="bg-success border-success text-white" data-content="<span class='bg-success border-success text-white p--3 pl--5 pr--5 rounded fs--14'>Success</span>">Success</option>
            <option value="bg-warning border-warning text-dark" data-content="<span class='bg-warning border-warning text-dark p--3 pl--5 pr--5 rounded fs--14'>Warning</span>">Warning</option>
            <option value="bg-danger border-danger text-white" data-content="<span class='bg-danger border-danger text-white p--3 pl--5 pr--5 rounded fs--14'>Danger</span>">Danger</option>
            <option value="bg-info border-info text-white" data-content="<span class='bg-info border-info text-white p--3 pl--5 pr--5 rounded fs--14'>Info</span>">Info</option>
            <option value="bg-purple border-purple text-white" data-content="<span class='bg-purple border-purple text-white p--3 pl--5 pr--5 rounded fs--14'>Purple</span>">Purple</option>
            <option value="bg-indigo border-indigo text-white" data-content="<span class='bg-indigo border-indigo text-white p--3 pl--5 pr--5 rounded fs--14'>Indigo</span>">Indigo</option>
            <option value="bg-pink border-pink text-white" data-content="<span class='bg-pink border-pink text-white p--3 pl--5 pr--5 rounded fs--14'>Pink</span>">Pink</option>
            <option data-divider="true"></option>
            <option value="bg-primary-soft border-primary-soft" data-content="<span class='bg-primary-soft border-primary-soft p--3 pl--5 pr--5 rounded fs--14'>Primary</span>">Primary Soft</option>
            <option value="bg-secondary-soft border-secondary-soft" data-content="<span class='bg-secondary-soft border-secondary-soft p--3 pl--5 pr--5 rounded fs--14'>Secondary</span>">Secondary Soft</option>
            <option value="bg-dark-soft border-dark-soft" data-content="<span class='bg-dark-soft border-dark-soft p--3 pl--5 pr--5 rounded fs--14'>Dark</span>">Dark Soft</option>
            <option value="bg-success-soft border-success-soft" data-content="<span class='bg-success-soft border-success-soft p--3 pl--5 pr--5 rounded fs--14'>Success</span>">Success Soft</option>
            <option value="bg-warning-soft border-warning-soft" data-content="<span class='bg-warning-soft border-warning-soft p--3 pl--5 pr--5 rounded fs--14'>Warning</span>">Warning Soft</option>
            <option value="bg-danger-soft border-danger-soft" data-content="<span class='bg-danger-soft border-danger-soft p--3 pl--5 pr--5 rounded fs--14'>Danger</span>">Danger Soft</option>
            <option value="bg-info-soft border-info-soft" data-content="<span class='bg-info-soft border-info-soft p--3 pl--5 pr--5 rounded fs--14'>Info</span>">Info Soft</option>
            <option value="bg-purple-soft border-purple-soft" data-content="<span class='bg-purple-soft border-purple-soft p--3 pl--5 pr--5 rounded fs--14'>Purple</span>">Purple Soft</option>
            <option value="bg-indigo-soft border-indigo-soft" data-content="<span class='bg-indigo-soft border-indigo-soft p--3 pl--5 pr--5 rounded fs--14'>Indigo</span>">Indigo Soft</option>
            <option value="bg-pink-soft border-pink-soft" data-content="<span class='bg-pink-soft border-pink-soft p--3 pl--5 pr--5 rounded fs--14'>Pink</span>">Pink Soft</option>
          </select>


          <div class="form-label-group mb-3">
            <textarea placeholder="Event Description" id="description" name="description" class="form-control" rows="3"></textarea>
            <label for="description">Event Description</label>
          </div>

          <div class="row">
            <div class="col-12 col-md-6 mt-3">
              <button type="submit" class="btn-fullcalendar-edit btn btn-primary btn-soft btn-block">
                Save Changes
              </button>
            </div>

            <div class="col-12 col-md-6 mt-3">
              <button type="submit" class="btn-fullcalendar-remove btn btn-danger btn-soft btn-block" 
                onclick="jQuery('#action').val('del_event');">
                Delete Event
              </button>
            </div>
          </div>


          <div class="text-center mt--30">
            <a href="#accordionDetail" class="btn btn-light btn-sm" data-toggle="collapse" aria-expanded="true" aria-controls="accordionDetail">
              <i class="fi fi-close"></i> 
              Cancel Edit
            </a>
          </div>

        </form>




      </div>

    </div>

