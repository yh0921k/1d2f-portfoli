<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Smarty V3</title>
    <meta name="description" content="...">

        <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- up to 10% speed up for external res -->
        <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <!-- preloading icon font is helping to speed up a little bit -->
        <link rel="preload" href="${pageContext.request.getContextPath()}/resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

        <!-- non block rendering : page speed : js = polyfill for old browsers missing `preload` -->
        <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/assets/css/core.min.css">
        <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/assets/css/vendor_bundle.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

    <!-- favicon -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png">

    <link rel="manifest" href="${pageContext.request.getContextPath()}/resources/assets/images/manifest/manifest.json">
    <meta name="theme-color" content="#377dff">

  </head>

<!--

    Layout Admin
      .layout-admin   (required)

      .aside-sticky           - sidebar : fixed and push header
      .header-sticky          - header : always visible on top (acting as old .header-focus)


    ****************************************************************************************************

      NOTES

        1.  LOGO TO REPLACE
            - logo_light.svg  : sidebar
            - logo_dark.svg   : header navbar

    ****************************************************************************************************
  -->
  <body class="layout-admin aside-sticky header-sticky">

    <div id="wrapper" class="d-flex align-items-stretch flex-column">



      <!-- 
        HEADER 
        
        .header-match-aside-primary
      -->
      <header id="header">


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
              <a class="navbar-brand d-inline-block d-lg-none" href="adminindex.jsp">
                <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/adminlogo.png" width="110" height="60" alt="...">
              </a>


            </div>
            <!-- NAVIGATION -->
            <!-- /NAVIGATION -->

            <!-- OPTIONS -->
            <ul class="list-inline list-unstyled mb-0 d-flex align-items-end">

              <!-- account -->
              <li class="list-inline-item ml--6 mr--6 dropdown">
                <span id="sessionExpire" style="margin-right:50px;">세션 만료 : ${expire }초 남음</span>
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

      </header>
      <!-- /HEADER -->

      <div id="wrapper_content" class="d-flex flex-fill">

        <!-- SIDEBAR -->
        <aside id="aside-main" class="aside-start bg-gradient-dark font-weight-light aside-hide-xs d-flex flex-column h-auto">

          <div class="d-none d-sm-block">
            <div class="clearfix d-flex justify-content-between">

              <!-- Logo : height: 60px max -->
              <a class="w-100 align-self-center navbar-brand p-3" href="adminIndex.jsp">
                <img src="${pageContext.request.getContextPath()}/resources/assets/images/logo/adminlogo.png" width="220" height="40" alt="...">
              </a>

            </div>
          </div>
          <!-- /LOGO -->

          <!-- <div class="aside-wrapper scrollable-vertical scrollable-styled-light align-self-baseline h-100 w-100"> -->
          <div class="aside-wrapper align-self-baseline h-100 w-100">
            <!--
              All parent open navs are closed on click!
              To ignore this feature, add .js-ignore to .nav-deep
    
              Links height (paddings):
                .nav-deep-xs
                .nav-deep-sm
                .nav-deep-md    (default, ununsed class)

              .nav-deep-hover   hover background slightly different
              .nav-deep-bordered  bordered links
            -->
            
            <nav class="nav-deep nav-deep-dark nav-deep-hover fs--15 pb-5">
              <ul style="height:25px"></ul>
              <ul class="nav flex-column"> 
                <li class="nav-item active">
                  <a class="nav-link" href="#">
                    <i class="fi fi-user-male"></i>
                    <!-- <span class="badge badge-warning float-end fs--11 mt-1">new</span> -->
                    회원 관리
                  </a>    

                  <li class="nav-item">
                    <a class="nav-link" href="#">
                      <i class="fi fi-task-list"></i>
                      게시글 관리
                    </a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="#">
                      <i class="fi fi-support"></i>
                      문의 및 신고처리
                    </a>
                  </li>


                  <li class="nav-item">
                    <a class="nav-link" href="#">
                                                   💰　결제 관리
                    </a>
                  </li>


                  <li class="nav-item">
                    <a class="nav-link" href="#">
                      <i class="fi fi-image"></i>
                      배너 관리
                    </a>
                  </li>


                <li class="nav-title mt-5">
                  <h6 class="fs--15 mb-1 text-white font-weight-normal">로그 및 통계</h6>

                </li>
                <li class="nav-item">
                  <a class="nav-link js-ajax" href="#">
                    <i class="nav-icon fi fi-folder-full"><!-- main icon --></i>
                    Log
                  </a>
                </li>
                
                <li class="nav-item">
                  <a class="nav-link js-ajax" href="#">
                    <i class="nav-icon fi fi-graph"><!-- main icon --></i>
                    통계
                  </a>
                </li>

                <li class="nav-title mt-5">
                  <h6 class="fs--15 mb-1 text-white font-weight-normal">Settings</h6>
                </li>
 
                <li class="nav-item">
                  <a class="nav-link" href="#">
                    <i class="nav-icon fi fi-shape-star"><!-- main icon --></i>
                    <span class="badge opacity-2 font-weight-light float-end fs--11 mt-1">1</span>
                    설정
                  </a>
                </li>
              </ul>
            </nav>

          </div>
        </aside>
        <!-- /SIDEBAR -->
        
        <!-- Contents Body -->
        <div class="col-12 mb-3">
  <!-- start:portlet -->
  <div class="portlet">
    <div class="portlet-body">
      <div class="container py-6">
        <!--
          data-autofill="false|hover|click" 
          data-enable-paging="true"       false = show all, no pagination
          data-items-per-page="10|15|30|50|100" 
        -->
        <div id="rand_yjK_wrapper" class="dataTables_wrapper dt-bootstrap4">
        <div class="row mb-3">
        <div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-start">
        <div id="rand_yjK_filter" class="dataTables_filter">
        <label><input type="search" class="form-control form-control-sm" placeholder="Search..." aria-controls="rand_yjK"></label>
        </div>
        <div class="dataTables_length" id="rand_yjK_length">
        <label><select name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="15">15</option><option value="30">30</option><option value="50">50</option><option value="100">100</option><option value="-1">All</option></select></label></div>
        </div>
        <div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-end">
        <div class="dt-buttons btn-group flex-wrap">
        </div>
        </div>
        </div>
        <div class="row">
        <div class="col-sm-12">
        <table class="table-datatable table table-bordered table-hover table-striped js-datatableified dataTable dtr-inline" data-lng-empty="No data available in table" data-lng-page-info="Showing _START_ to _END_ of _TOTAL_ entries" data-lng-filtered="(filtered from _MAX_ total entries)" data-lng-loading="Loading..." data-lng-processing="Processing..." data-lng-search="Search..." data-lng-norecords="No matching records found" data-lng-sort-ascending=": activate to sort column ascending" data-lng-sort-descending=": activate to sort column descending" data-lng-column-visibility="Column Visibility" data-lng-csv="CSV" data-lng-pdf="PDF" data-lng-xls="XLS" data-lng-copy="Copy" data-lng-print="Print" data-lng-all="All" data-main-search="true" data-column-search="false" data-row-reorder="false" data-col-reorder="true" data-responsive="true" data-header-fixed="true" data-select-onclick="true" data-enable-paging="true" data-enable-col-sorting="true" data-autofill="false" data-group="false" data-items-per-page="10" data-lng-export="<i class='fi fi-squared-dots fs--18 line-height-1'></i>" dara-export-pdf-disable-mobile="true" data-export="[&quot;csv&quot;, &quot;pdf&quot;, &quot;xls&quot;]" data-options="[&quot;copy&quot;, &quot;print&quot;]" id="rand_yjK" role="grid" aria-describedby="rand_yjK_info" style="width: 1168px;">
        <thead>
            <tr role="row">
            <th class="sorting_asc" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="0" style="width: 200px;" aria-sort="ascending" aria-label="Name: activate to sort column descending">날짜</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="1" style="width: 300px;" aria-label="Position: activate to sort column ascending">요청</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="2" style="width: 150px;" aria-label="Office: activate to sort column ascending">ID</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="3" style="width: 200px;" aria-label="Age: activate to sort column ascending">IP주소</th>
          </thead>
          
          <tbody>       
          <tr role="row" class="odd">
              <td tabindex="0" class="sorting_1">Airi Satou</td>
              <td>Accountant</td>
              <td>Tokyo</td>
              <td>33</td>
            </tr><tr role="row" class="even">
              <td class="sorting_1" tabindex="0">Angelica Ramos</td>
              <td>Chief Executive Officer (CEO)</td>
              <td>London</td>
              <td>47</td>
            </tr><tr role="row" class="odd">
              <td tabindex="0" class="sorting_1">Ashton Cox</td>
              <td>Junior Technical Author</td>
              <td>San Francisco</td>
              <td>66</td>
            </tr><tr role="row" class="even">
              <td class="sorting_1" tabindex="0">Bradley Greer</td>
              <td>Software Engineer</td>
              <td>London</td>
              <td>41</td>
            </tr><tr role="row" class="odd">
              <td class="sorting_1" tabindex="0">Brenden Wagner</td>
              <td>Software Engineer</td>
              <td>San Francisco</td>
              <td>28</td>
            </tr><tr role="row" class="even">
              <td tabindex="0" class="sorting_1">Brielle Williamson</td>
              <td>Integration Specialist</td>
              <td>New York</td>
              <td>61</td>
            </tr><tr role="row" class="odd">
              <td class="sorting_1" tabindex="0">Bruno Nash</td>
              <td>Software Engineer</td>
              <td>London</td>
              <td>38</td>
            </tr><tr role="row" class="even">
              <td class="sorting_1" tabindex="0">Caesar Vance</td>
              <td>Pre-Sales Support</td>
              <td>New York</td>
              <td>21</td>
            </tr><tr role="row" class="odd">
              <td class="sorting_1" tabindex="0">Cara Stevens</td>
              <td>Sales Assistant</td>
              <td>New York</td>
              <td>46</td>
            </tr><tr role="row" class="even">
              <td tabindex="0" class="sorting_1">Cedric Kelly</td>
              <td>Senior Javascript Developer</td>
              <td>Edinburgh</td>
              <td>22</td>
            </tr></tbody>
          <tfoot>
            <tr>
            <th rowspan="1" colspan="1">날짜</th>
            <th rowspan="1" colspan="1">요청</th>
            <th rowspan="1" colspan="1">ID</th>
            <th rowspan="1" colspan="1">IP주소</th>
            </tr>
          </tfoot>
        </table></div></div>
        <div class="row">
        <div class="col-sm-12 col-md-5">
        <div class="dataTables_info" id="rand_yjK_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="rand_yjK_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="rand_yjK_previous"><a href="#" aria-controls="rand_yjK" data-dt-idx="0" tabindex="0" class="page-link"><i class="fi fi-arrow-start fs--13"></i></a></li><li class="paginate_button page-item active"><a href="#" aria-controls="rand_yjK" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="rand_yjK_next"><a href="#" aria-controls="rand_yjK" data-dt-idx="7" tabindex="0" class="page-link"><i class="fi fi-arrow-end fs--13"></i></a></li></ul></div></div></div></div>

      </div>
    </div>

  </div>
  <!-- end:portlet -->

</div>        

      </div>



      <!-- FOOTER -->
      <footer id="footer" class="bg-gradient-dark text-white">
        <div class="p-3 fs--14">
          &copy; Portfoli

          <div class="d-inline-block float-end dropdown">
            <ul class="list-inline m-0">

              <!-- LANGUAGE -->
              <li class="dropdown list-inline-item m-0">

                <a id="topDDLanguage" href="#!" class="d-inline-block" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
                  <i class="flag flag-us"></i> 
                  <span class="pl-2 pr-2">ENGLISH</span>
                </a>

                <div aria-labelledby="topDDLanguage" class="dropdown-menu fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh scrollable-vertical dropdown-menu-right">
                  <a href="#!" class="active dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
                    <i class="flag flag-us"></i> 
                    ENGLISH
                  </a>
                  <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
                    <i class="flag flag-de"></i> 
                    GERMAN
                  </a>
                  <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
                    <i class="flag flag-fr"></i> 
                    FRANCAISE
                  </a>
                </div>

              </li>
              <!-- /LANGUAGE -->


              <!-- CURRENCY -->
              <li class="dropdown list-inline-item m-0">

                <span class="text-muted">/</span><!-- optional separator -->

                <a id="topDDCurrency" href="#" class="d-inline-block" data-toggle="dropdown" aria-expanded="false">
                  <span class="pl-2 pr-2">USD</span>
                </a>

                <div aria-labelledby="topDDCurrency" class="dropdown-menu text-center fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh w-auto scrollable-vertical dropdown-menu-right">
                  <a href="#!" class="active dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
                    USD
                  </a>
                  <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
                    EUR
                  </a>
                  <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
                    GBP
                  </a>
                </div>

              </li>
              <!-- /CURRENCY -->

            </ul>
          </div>
        </div>
      </footer>
      <!-- /FOOTER -->


    </div><!-- /#wrapper -->

    <script src="${pageContext.request.getContextPath()}/resources/assets/js/core.min.js"></script>

    <div id="page_js_files">specific page javascript files here</div>
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script>
	    $(document).ready(function() { 
	    	var expireTime = ${expire};
	      setInterval(function() {
	        $("#sessionExpire").html("세션 만료 : " + --expireTime + "초 남음");
	        
	        if(expireTime == 0) {
	        	window.location.href="loginForm";
	        }
	        
	      }, 1000);
	    });
    </script>
  </body>
</html>