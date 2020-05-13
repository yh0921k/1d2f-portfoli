<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- SIDEBAR -->
    
        <aside id="aside-main" class="aside-start bg-gradient-dark font-weight-light aside-hide-xs d-flex flex-column h-auto">

          <div class="d-none d-sm-block">
            <div class="clearfix d-flex justify-content-between">

              <!-- Logo : height: 60px max -->
              <a id="contentsHome" class="w-100 align-self-center navbar-brand p-3" href="#">
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
                  <a id="contentsHome" class="nav-link" href="#">
                    <i class="fi fi-user-male"></i>
                    <!-- <span class="badge badge-warning float-end fs--11 mt-1">new</span> -->
                    	회원 관리
                  </a>    

                  <li class="nav-item">
                    <a id="contentsHome" class="nav-link" href="#">
                      <i class="fi fi-task-list"></i>
                      	게시글 관리
                    </a>
                  </li>

                  <li class="nav-item">
                    <a id="contentsHome" class="nav-link" href="#">
                      <i class="fi fi-support"></i>
                      	문의 및 신고처리
                    </a>
                  </li>


                  <li class="nav-item">
                    <a id="contentsHome" class="nav-link" href="#">
                                                   💰　결제 관리
                    </a>
                  </li>


                  <li class="nav-item">
                    <a id="contentsHome" class="nav-link" href="#">
                      <i class="fi fi-image"></i>
                      	배너 관리
                    </a>
                  </li>


                <li class="nav-title mt-5">
                  <h6 class="fs--15 mb-1 text-white font-weight-normal">로그 및 통계</h6>

                </li>
                <li class="nav-item">
                  <a id="contentsLog" class="nav-link js-ajax" href="#">
                    <i class="nav-icon fi fi-folder-full"><!-- main icon --></i>
                      Log
                  </a>
                </li>
                
                <li class="nav-item">
                  <a id="contentsHome" class="nav-link js-ajax" href="#">
                    <i class="nav-icon fi fi-graph"><!-- main icon --></i>
                    	통계
                  </a>
                </li>

                <li class="nav-title mt-5">
                  <h6 class="fs--15 mb-1 text-white font-weight-normal">Settings</h6>
                </li>
 
                <li class="nav-item">
                  <a id="contentsHome" class="nav-link" href="#">
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