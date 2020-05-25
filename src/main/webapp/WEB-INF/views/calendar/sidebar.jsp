<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
      <!--------------------------------------- nav bar ----------------------------------------------->

      <div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

        <!-- CATEGORIES -->
        <nav class="nav-deep nav-deep-light mb-2">

          <!-- mobile only -->
          <button
            class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
            data-target="#nav_responsive"
            data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
            <span class="group-icon px-2 py-2 float-start"> <i
              class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
            </span> <span class="h5 py-2 m-0 float-start"> My Page </span>
          </button>

          <!-- desktop only -->
          <h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">My Page</h3>


          <!-- navigation -->
          <ul id="nav_responsive"
            class="nav flex-column d-none d-lg-block font-weight-bold ">

            <li class="nav-item font-weight-bold"><a class="nav-link"
              href="#"> <span class="group-icon"> <i
                  class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i>
              </span> <span class="px-2 d-inline-block active font-weight-bold">
                  내 정보 </span>
            </a>

              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item"><a class="nav-link"
                  href="/portfoli/app/member/generalUpdate"> 내 정보 수정하기 </a></li>
                <li class="nav-item"><a class="nav-link" href="#"> 멤버쉽
                </a></li>
              </ul></li>

            <li class="nav-item font-weight-bold"><a class="nav-link"
              href="#"> <span class="group-icon"> <i
                  class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i>
              </span> <span class="px-2 d-inline-block active font-weight-bold">
                  쪽지함 </span>
            </a>

              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item"><a class="nav-link"
                  href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
                <li class="nav-item"><a class="nav-link"
                  href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
              </ul></li>


            <li class="nav-item"><a class="nav-link "
              href="/portfoli/app/calendar/calendar"> <i
                class="fi fi-arrow-end m-0 fs--12"></i> <span
                class="px-2 d-inline-block"> 일정 관리 </span>
            </a></li>

            <li class="nav-item"><a class="nav-link "
              href="/portfoli/app/portfolio/mylist"> <i
                class="fi fi-arrow-end m-0 fs--12"></i> <span
                class="px-2 d-inline-block"> 포트폴리오 관리 </span>
            </a></li>


            <li class="nav-item"><a class="nav-link pt--200"
                style="margin-top: 200px; padding-top: 0px!important;"
                href="account-settings.html"> <i
                class="fi fi-arrow-end m-0 fs--12"></i> <span
                class="px-2 d-inline-block"> 통계 </span>
            </a></li>


          </ul>

        </nav>
        <!-- /CATEGORIES -->

      </div>
      <!--------------------------------------------- /nav bar ------------------------------------------------>
    