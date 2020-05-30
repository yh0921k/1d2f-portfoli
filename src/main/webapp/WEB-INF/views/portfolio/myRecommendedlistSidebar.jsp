<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

      <!-- CATEGORIES -->
      <nav class="nav-deep nav-deep-light mb-2">

        <!-- mobile only -->
        <button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" data-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
          <span class="group-icon px-2 py-2 float-start"> <i class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span class="h5 py-2 m-0 float-start"> My Page </span>
        </button>

        <!-- desktop only -->
        <c:if test="${loginUser.type == '1'}">
          <a href="/portfoli/app/member/generalMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
        </c:if> 
        <c:if test="${loginUser.type == '2'}">
          <a href="/portfoli/app/member/companyMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
        </c:if>
        <!-- navigation -->
        <ul id="nav_responsive" class="nav flex-column d-none d-lg-block font-weight-bold ">

          <!-- 내 정보 -->
          
          <li class="nav-item font-weight-bold">
          <a class="nav-link" href="#"> 
          <span class="group-icon"><i class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> 
          <span class="px-2 d-inline-block active font-weight-bold"> 내 정보 </span>
          </a>
          
          <c:if test="${loginUser.type == '1'}">
              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item font-weight-bold"><a class="nav-link"   href="/portfoli/app/member/generalUpdate"> 내 정보 수정하기 </a></li>
              </ul>
            </c:if> 
            <c:if test="${loginUser.type == '2'}">
              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item font-weight-bold"><a class="nav-link" href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
              </ul>
            </c:if>
            </li>

          <!-- 쪽지함 -->
          <li class="nav-item font-weight-bold">
          <a class="nav-link" href="#"> 
          <span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
          <span class="px-2 d-inline-block active font-weight-bold"> 쪽지함 </span>
          </a>

            <ul class="nav flex-column px-2 font-weight-bold">
              <li class="nav-item"><a class="nav-link" href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
              <li class="nav-item"><a class="nav-link" href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
            </ul>
            </li>
            
            <!-- 일반회원 -->
            <c:if test="${loginUser.type == '1'}">
            
              <!-- 일정 -->
              <li class="nav-item"><a class="nav-link" href="/portfoli/app/calendar/calendar"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 일정 관리 </span></a></li>
              
              <!-- 포트폴리오 -->
              <li class="nav-item font-weight-bold active">
                <a class="nav-link" href="#"> 
                <span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
                <span class="px-2 d-inline-block active font-weight-bold"> 내 포트폴리오 </span>
                </a>
              <ul class="nav flex-column px-2 font-weight-bold">
                <li class="nav-item"><a class="nav-link" href="/portfoli/app/portfolio/mylist"> 포트폴리오 관리 </a></li>
                <li class="nav-item active"><a class="nav-link" href="/portfoli/app/portfolio/myRecommendedlist"> 내가 찜한 목록 </a></li>
              </ul>
              </li>
              
            </c:if>
            
            <!-- 기업회원 -->
            <c:if test="${loginUser.type == '2'}">
            
            <!-- 멤버십 -->
            <li class="nav-item"><a class="nav-link" href="/portfoli/app/payment/introduction"> <i class="fi fi-arrow-end m-0 fs--12"></i><span class="px-2 d-inline-block"> 멤버십 </span></a></li>

            <!-- 공고 관리 -->
            <li class="nav-item"><a class="nav-link " href="/portfoli/app/jobposting/mylist"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 공고 관리 </span></a></li>
            </c:if>

        </ul>

      </nav>
      <!-- /CATEGORIES -->

    </div>