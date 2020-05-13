<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <!-- 
        HEADER 
        
        .header-match-aside-primary
      -->
        <!-- NAVBAR -->
        <div class="container-fluid position-relative">

          <nav class="navbar navbar-expand-lg navbar-light justify-content-lg-between justify-content-md-inherit h--70">

            <div class="align-items-start">
              
              <!-- 
                sidebar toggler 
              -->
              <a href="#aside-main" class="btn-sidebar-toggle h-100 d-inline-block d-lg-none justify-content-center align-items-center p-2">
                <span class="group-icon">
                  <i>
                    <svg width="25" viewBox="0 0 20 20">
                      <path d="M 19.9876 1.998 L -0.0108 1.998 L -0.0108 -0.0019 L 19.9876 -0.0019 L 19.9876 1.998 Z"></path>
                      <path d="M 19.9876 7.9979 L -0.0108 7.9979 L -0.0108 5.9979 L 19.9876 5.9979 L 19.9876 7.9979 Z"></path>
                      <path d="M 19.9876 13.9977 L -0.0108 13.9977 L -0.0108 11.9978 L 19.9876 11.9978 L 19.9876 13.9977 Z"></path>
                      <path d="M 19.9876 19.9976 L -0.0108 19.9976 L -0.0108 17.9976 L 19.9876 17.9976 L 19.9876 19.9976 Z"></path>
                    </svg>
                  </i>

                  <i>
                    <svg width="25" viewBox="0 0 47.971 47.971">
                      <path d="M28.228,23.986L47.092,5.122c1.172-1.171,1.172-3.071,0-4.242c-1.172-1.172-3.07-1.172-4.242,0L23.986,19.744L5.121,0.88c-1.172-1.172-3.07-1.172-4.242,0c-1.172,1.171-1.172,3.071,0,4.242l18.865,18.864L0.879,42.85c-1.172,1.171-1.172,3.071,0,4.242C1.465,47.677,2.233,47.97,3,47.97s1.535-0.293,2.121-0.879l18.865-18.864L42.85,47.091c0.586,0.586,1.354,0.879,2.121,0.879s1.535-0.293,2.121-0.879c1.172-1.171,1.172-3.071,0-4.242L28.228,23.986z"/>
                    </svg>
                  </i>
                </span>
              </a>


              <!-- 
                Logo : height: 60px max
                visibility : mobile only
              -->
              <a id="contentsHome" class="navbar-brand d-inline-block d-lg-none" href="mainForm.jsp">
                <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/adminlogo.png" width="110" height="60" alt="...">
              </a>


            </div>
            <!-- NAVIGATION -->
            <!-- /NAVIGATION -->

            <!-- OPTIONS -->
            <ul class="list-inline list-unstyled mb-0 d-flex align-items-end">

              <!-- account -->
              <li class="list-inline-item ml--6 mr--6 dropdown">
                <span id="sessionExpire" class="alert alert-dark fs--14 d-none d-sm-inline-block font-weight-medium" role="alert" style="margin-right:50px; width:190px;">세션 만료 : ${expire }초 남음</span>
                <a href="loginForm" id="dropdownAccountOptions" class="btn btn-sm btn-light btn-pill pl--12 pr--12">
                  <span class="group-icon m-0">
                    <i class="fi w--15 fi-power"></i>
                  </span>
                  <span class="fs--14 d-none d-sm-inline-block font-weight-medium">Log out</span>
                </a>

                <!--
                  
                  Dropdown Classes
                    .dropdown-menu-dark     - dark dropdown (desktop only, will be white on mobile)
                    .dropdown-menu-hover    - open on hover
                    .dropdown-menu-clean    - no background color on hover
                    .dropdown-menu-invert     - open dropdown in oposite direction (left|right, according to RTL|LTR)
                    .dropdown-click-ignore    - keep dropdown open on inside click (useful on forms inside dropdown)

                    Dropdown prefix icon (optional, if enabled in variables.scss)
                      .prefix-link-icon .prefix-icon-dot    - link prefix
                      .prefix-link-icon .prefix-icon-line   - link prefix
                      .prefix-link-icon .prefix-icon-ico    - link prefix
                      .prefix-link-icon .prefix-icon-arrow  - link prefix

                      .prefix-icon-ignore           - ignore, do not use on a specific link

                -->
<!--                 <div aria-labelledby="dropdownAccountOptions" class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-navbar-autopos dropdown-menu-invert dropdown-click-ignore p-0 mt--18 fs--15 w--300"> -->
                  
<!--                   <div class="dropdown-header fs--14 py-4"> -->

                    <!-- profile image -->
<!--                     <div class="w--60 h--60 rounded-circle bg-light bg-cover float-start" style="background-image:url('../../html_frontend/demo.files/images/icons/user80.png')"></div> -->
                    
                    <!-- initials - no image -->
                    <!--
                    <div data-initials="John Doe" data-assign-color="true" class="sow-util-initials bg-light rounded h5 w--60 h--60 d-inline-flex justify-content-center align-items-center rounded-circle float-start">
                      <i class="fi fi-circle-spin fi-spin"></i>
                    </div>
                    -->

                    <!-- user detail -->
<!--                     <span class="d-block font-weight-medium text-truncate fs--16">John Doe</span> -->
<!--                     <span class="d-block text-muted font-weight-medium text-truncate">john.doe@gmail.com</span> -->
<!--                     <small class="d-block text-muted"><b>Last Login:</b> 2019-09-03 01:48</small> -->

<!--                   </div> -->

<!--                   <div class="dropdown-divider"></div> -->

<!--                   <a href="#!" target="_blank" class="dropdown-item text-truncate font-weight-medium"> -->
<!--                     Notes -->
<!--                     <small class="d-block text-muted">personal encypted notes</small> -->
<!--                   </a> -->

<!--                   <a href="#!" target="_blank" class="dropdown-item text-truncate font-weight-medium"> -->
<!--                     <span class="badge badge-success float-end font-weight-normal mt-1">3 new</span> -->
<!--                     Messages -->
<!--                     <small class="d-block text-muted">internal messaging system</small> -->
<!--                   </a> -->

<!--                   <a href="#!" target="_blank" class="dropdown-item text-truncate font-weight-medium"> -->
<!--                     <span class="badge badge-danger float-end font-weight-normal mt-1">1 unpaid</span> -->
<!--                     Invoices -->
<!--                     <small class="d-block text-muted">montly billing</small> -->
<!--                   </a> -->

<!--                   <a href="#!" class="dropdown-item text-truncate font-weight-medium"> -->
<!--                     Account Settings -->
<!--                     <small class="d-block text-muted">profile, password and more...</small> -->
<!--                   </a> -->

<!--                   <a href="#!" class="dropdown-item text-truncate font-weight-medium"> -->
<!--                     Upgrade -->
<!--                     <small class="d-block text-muted">upgrade your account</small> -->
<!--                   </a> -->

<!--                   <div class="dropdown-divider mb-0"></div> -->

<!--                   <a href="#!" class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore font-weight-medium pt-3 pb-3"> -->
<!--                     <i class="fi fi-power float-start"></i> -->
<!--                     Log Out -->
<!--                   </a> -->
<!--                 </div> -->

              </li>

            </ul>
            <!-- /OPTIONS -->


          </nav>


          <!-- TOP NAVIGATION TOGGLER -->
          <button class="navbar-toggler shadow-xs h-auto w-auto m-0 btn btn-sm bg-white rounded-circle position-absolute end-0 mt-1 mb-1 ml-2 mr-2 z-index-2 d-none d-inline-block d-lg-none" type="button" data-toggle="collapse" data-target="#navbarMainNav" aria-controls="navbarMainNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fi fi-bars"></i>
          </button>
          <!-- /TOP NAVIGATION TOGGLER -->

        </div>
        <!-- /NAVBAR -->

      <!-- /HEADER -->

      