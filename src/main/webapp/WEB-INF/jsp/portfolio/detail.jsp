 <%@page import="com.portfoli.domain.BoardAttachment"%>
<%@page import="com.portfoli.domain.Portfolio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="updateForm" method="post" >
<div class="row scrollable-vertical scrollable-styled-dark" style="max-height:600px">
  <div class="col-3" style="background-color: #a1a8ae">
  <input name="number" type="hidden" value="${portfolio.getNumber()}"/>
    <div class="max-w-250 text-center">
    
          <!-- avatar -->
        <label class="w--250 h--250 rounded-circle text-center position-relative 
        d-inline-block cursor-pointer border border-secondary border-dashed bg-white" style="margin:25px 0px">
          <!-- preadded image --> 
          <span class="z-index-2 js-file-input-avatar-ajax-circle-container-preadded d-block absolute-full z-index-1">
          <span style="background-image: url('demo.files/images/unsplash/team/thumb_330/michael-dam-mEZ3PoFGs_k-unsplash.jpg')"
                class="js-file-input-item d-inline-block position-relative overflow-hidden text-center rounded-circle m-0 p-0 animate-bouncein bg-cover w-100 h-100">
          </span>
          </span> 
         <!-- avatar : : always under image -->
          <c:if test="${empty loginUser.photoFilePath}">
            <svg class="fill-gray-600 rounded-circle m-4 z-index-0" viewBox="-20 -20 100 100">
                <path d="M41.014,45.389l-9.553-4.776C30.56,40.162,30,39.256,30,38.248v-3.381c0.229-0.28,0.47-0.599,0.719-0.951c1.239-1.75,2.232-3.698,2.954-5.799C35.084,27.47,36,26.075,36,24.5v-4c0-0.963-0.36-1.896-1-2.625v-5.319c0.056-0.55,0.276-3.824-2.092-6.525C30.854,3.688,27.521,2.5,23,2.5s-7.854,1.188-9.908,3.53c-2.368,2.701-2.148,5.976-2.092,6.525v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C1.801,46.924,0,49.958,0,53.262V57.5h46v-4.043C46,50.018,44.089,46.927,41.014,45.389z"></path>
                <path d="M55.467,46.526l-9.723-4.21c-0.23-0.115-0.485-0.396-0.704-0.771l6.525-0.005c0,0,0.377,0.037,0.962,0.037c1.073,0,2.638-0.122,4-0.707c0.817-0.352,1.425-1.047,1.669-1.907c0.246-0.868,0.09-1.787-0.426-2.523c-1.865-2.654-6.218-9.589-6.354-16.623c-0.003-0.121-0.397-12.083-12.21-12.18c-1.187,0.01-2.309,0.156-3.372,0.413c0.792,2.094,0.719,3.968,0.665,4.576v4.733c0.648,0.922,1,2.017,1,3.141v4c0,1.907-1.004,3.672-2.607,4.662c-0.748,2.022-1.738,3.911-2.949,5.621c-0.15,0.213-0.298,0.414-0.443,0.604v2.86c0,0.442,0.236,0.825,0.631,1.022l9.553,4.776c3.587,1.794,5.815,5.399,5.815,9.41V57.5H60v-3.697C60,50.711,58.282,47.933,55.467,46.526z"></path>
              </svg>
          </c:if>
          <c:if test="${not empty loginUser.photoFilePath}">
            <img class="rounded-circle img-thumbnail h--250 w--250"
              src='${pageContext.servletContext.contextPath}/upload/member/${portfolio.member.photoFilePath}'>
            <br>
          </c:if>
        </label>
      <!-- /avatar -->
    </div>

    <div id="list-example" class="list-group list-group-flush">
      <a class="list-group-item list-group-item-action rounded" style="font-size: 0.8em" style="padding:.5em 1.25em">
        <div class="badge badge-success badge-soft badge-ico-sm rounded-circle float-start">
          <i class="fi fi-check"></i>
        </div>
         ${portfolio.member.id}
         
              <c:if test="${portfolio.member.seekingFlag == 1}">
              (구직중)
              </c:if>
              <c:if test="${portfolio.member.seekingFlag != 1}">
              (재직중)
              </c:if>
      </a>
      <a class="list-group-item list-group-item-action rounded" style="font-size: 0.8em">
        <div class="badge badge-primary badge-soft badge-ico-sm rounded-circle float-start">
          <i class="fi fi-check"></i>
        </div>
        ${portfolio.member.email}
      </a>
      <a class="list-group-item list-group-item-action rounded" style="font-size: 0.8em">
        <div class="badge badge-warning badge-soft badge-ico-sm rounded-circle float-start">
          <i class="fi fi-check"></i>
        </div>
        <c:choose>
        <c:when test="${membership eq 'none'}">
        일반회원
        </c:when>
        <c:otherwise>
        ${membership}
        </c:otherwise>
        </c:choose>
      </a>
      <a class="list-group-item list-group-item-action rounded" style="font-size: 0.8em">
        <div class="badge badge-info badge-soft badge-ico-sm rounded-circle float-start">
          <i class="fi fi-check"></i>
        </div>
        등록일 : ${portfolio.registeredDate}
      </a>
      <a class="list-group-item list-group-item-action" style="font-size: 0.8em">
      <div style="display: inline-block; margin:0px">
        <div style="font-size: 1em; margin-left:10px" class="badge badge-white badge-soft badge-ico-sm float-start">
        <i class="fi fi-chat" style="font-style: normal;"> 문자</i>
        </div>
        <div style="font-size: 1em; margin-left:70px" class="badge badge-white badge-soft badge-ico-sm float-start">
        <i class="fi fi-envelope-2" style="font-style: normal;"> 메일</i>
        <%--
        링크 예정
        ${portfolio.member...}
        --%>
        </div>
      </div>
      </a>
    </div>
  </div>

  <div class="col-9">
    <div style="width:95%; position: relative; margin:25px" data-spy="scroll" data-target="#list-example" 
         data-offset="0" class="scrollable-vertical scrollable-styled-dark">

      <%-- 헤드부분 --%>
      <div>
      <%-- 제목 --%>
      <textarea style="font-weight:bold;font-size:large; border: 0px; resize: none" readonly="readonly" rows="auto" cols="83%">${portfolio.title}</textarea>

      
      <%-- 아이콘 --%>
      <div style="float: right; top: -46px; position: relative; margin-right: 100px;">
	      <div style="position: relative;display: inline-block;margin: 0px 80px;" align="center">
	      <i class="fi fi-eye"> </i> <br>
	      ${portfolio.viewCount}
	      </div>
        <div style="position: relative; display: inline-block;" align="center">
	      <i class="fi fi-heart-empty"> </i> <br>
	      ${portfolio.recommendedCount}
	      </div>
      </div>
      </div>
      <hr>
      <%-- url 복사 버튼 --%>
      <a href="#" onclick="urlClipCopy()">url 복사</a>
      
      <%-- 내용 --%>
      <textarea style="border: 0px; resize: none" readonly="readonly" rows="auto" cols="90%">${portfolio.content}</textarea>
      <br>
      <%--섬네일 --%>
              <c:if test="${portfolio.thumbnail != null}">
                ${item.thumbnail}
                <a style="margin: 0" href='${pageContext.servletContext.contextPath}/upload/portfolio/${portfolio.thumbnail}' height='95%'>
                <img style="margin: 0" alt="첨부파일" name="thumbnail" src='${pageContext.servletContext.contextPath}/upload/portfolio/${portfolio.thumbnail}_300x300.jpg' width='95%'/><br>
                </a>
                <br>
               </c:if>
      
      
      <%--첨부파일 --%>
              <c:choose>
              <c:when test="${not empty attachment}">
              <c:forEach items="${attachment}" var="item">
              <c:set var="name" value="${item.fileName}" />
              <div style="display:inline-block; padding:5px 5px; margin:5px 5px; border: 3px outset white; height: 110px;">
                <div style="font-size: small">
                ${item.filePath}
                </div>
                <div>
                <a target="_blank" download="${item.filePath}" href='${pageContext.servletContext.contextPath}/upload/portfolio/${item.fileName}' style='margin: 0'>
                    <c:choose>
                      <c:when test="${item.fileName.endsWith('.jpg') || item.fileName.endsWith('.png') || item.fileName.endsWith('.jpeg') || item.fileName.endsWith('.gif') }">
                       <img style='margin: 0' alt='첨부파일' name='attachment' id="attch" src='${pageContext.servletContext.contextPath}/upload/portfolio/${item.fileName}' height="80px"/><br>
                       
                      </c:when>
                      <c:otherwise>
                       <img style='margin: 0' alt='첨부파일' name='attachment' id="attch" src='${pageContext.servletContext.contextPath}/resources/assets/images/file_icon.png' height="80px"/><br>
                      </c:otherwise>
                    </c:choose>
                </a>
                </div>
              </div>
              </c:forEach>
                <br>
               </c:when>
               <c:otherwise>
               <span>첨부파일이 없습니다.</span>
               </c:otherwise>
               </c:choose>
            <div style="position: relative; margin: 10% 35%;">
            <button style="font-size: small" type="submit">수정(M)</button>
            <button style="font-size: small" type="button"  id="deleteButton"onclick='warning(${portfolio.number})'>삭제(D)</button>
            </div>
    </div>
  </div>
</div>
</form>

  <style>
  .modal-dialog.modal-md.modal-xl.modal-dialog-centered > .modal-content {
    margin-top: 6rem!important;
    height: 600px;
  }
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed;}
    .padding{padding:10px; border:0px;}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{padding:0px 5px;}
    .textAR_in{border-color:transparent; resize:none; width: 100%; height: 450px;}
  </style>
  <%--
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
   --%>
  <script src="${pageContext.getServletContext().getContextPath()}/node_modules/sweetalert2/dist/sweetalert2.all.js"></script>
  <script>
  function urlClipCopy() {
	  var f = document.clipboard.url;
	  console.log(f);
	  f.value = document.location.href;
	  f.select() ;
	  therange=f.createTextRange() ;
	  therange.execCommand("Copy");
	  alert("클립보드로 URL이 복사되었습니다.");
  }
  
  function warning(){
      console.log(${portfolio.number});
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: 'btn btn-success',
          cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
      })

      swalWithBootstrapButtons.fire({
        title: '정말 삭제하시겠습니까?',
        text: "되돌릴 수 없는 작업입니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '삭제',
        cancelButtonText: '취소',
        reverseButtons: true
      }).then((result) => {
        if (result.value) {
          swalWithBootstrapButtons.fire({
            title:'삭제완료',
            onClose: () => {
            	location.href = "delete?number=" + ${portfolio.number};
                clearInterval(timerInterval)
              }
          })
        } else if (
          result.dismiss === Swal.DismissReason.cancel
        ) {
          swalWithBootstrapButtons.fire(
            '취소'
          )
        }
      })
    }
  </script>

