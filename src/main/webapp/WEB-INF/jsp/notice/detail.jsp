 <%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->

    <div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5 mt--20">
      <!-- CATEGORIES -->
      <nav class="nav-deep nav-deep-light mb-2">
        <!-- mobile only -->
        <button
          class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
          data-target="#nav_responsive"
          data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
          <span class="group-icon px-2 py-2 float-start"> <i
            class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
          </span> <span class="h5 py-2 m-0 float-start"> Customer Center </span>
        </button>

        <!-- desktop only -->
        <h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">Customer
          Center</h3>
        <!-- navigation -->
        <ul id="nav_responsive"
          class="nav flex-column d-none d-lg-block font-weight-bold">

          <li class="nav-item active mb-2"><a class="nav-link" href="/portfoli/app/notice/list"> <span class="px-2 d-inline-block"> 공지사항 </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/faq/list"> <span class="px-2 d-inline-block"> FAQ </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/qna/list"> <span class="px-2 d-inline-block"> Q&A </span>
          </a></li>

        </ul>
      </nav>
    </div>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">공지사항</h1>
        
        <form action="updateForm" method="post">
        <div align="right">
          <button type="submit" class="btn btn-outline-secondary btn-pill btn-sm" 
                  onclick="location.href='form'">수정(M)</button>
          <input type="button" class="btn btn-outline-secondary btn-pill btn-sm" 
                  onclick='warning(${notice.number})' value="삭제(D)"/>
        </div>
        
     <div class="table-responsive rounded" style="min-height: 500px;">
	    <input name="number" type="hidden" value="${notice.getNumber()}"/>
	    <input name="number" type="hidden" value="${notice.categoryNumber}"/>
	    
	    <div class="table-responsive rounded" style="min-height: 500px;">
        <table class="lightGray">
        <tr class="firstTR">
          <td width="75%" class='padding'>[${categoryName}] ${notice.title}</td>
          <td width="25%" align="center" class='padding darkerGray'>${notice.registeredDate}</td>
        </tr>
        <tr>
          <td colspan="2" class='padding'><a href="detail?number=${notice.number}">url : localhost:9999/portfoli/app/notice/detail?number=${notice.number}</a></td>
         </tr>
        <tr>
          <td colspan="2" class='textAR'><textarea readonly="readonly" class="textAR_in">${notice.content}</textarea></td>
        </tr>
        <tr class='photoTD'>
          <td colspan="2"  class='photoInside'>
          <c:choose>
          <c:when test="${not empty attachment}">
          <c:forEach items='${attachment}' var='item'>
              <div style="display:inline-block; padding:5px 5px; margin:5px 5px; border: 3px outset white; height: 110px;">
                <div style="font-size: small">
                ${item.filePath}
                </div>
                <div>
                <a target="_blank" download="${item.filePath}" href='${pageContext.servletContext.contextPath}/upload/notice/${item.fileName}' style='margin: 0'>
                  <c:choose>
	                    <c:when test="${item.fileName.endsWith('.jpg') || item.fileName.endsWith('.png') || item.fileName.endsWith('.jpeg') || item.fileName.endsWith('.gif') }">
			                    <img style="margin: 0" alt="첨부파일" name="attachment" src='${pageContext.servletContext.contextPath}/upload/notice/${item.fileName}' height='80'/><br>
			                </c:when>
			                <c:otherwise>
	                        <img style="margin: 0" alt="첨부파일" name="attachment" src='${pageContext.servletContext.contextPath}/resources/assets/images/file_icon.png' height='80'/><br>
			                </c:otherwise>
		              </c:choose>
		            </a>
		            </div>
	          </div>
          </c:forEach>
          </c:when>
          <c:otherwise>
          <span>첨부파일이 없습니다.</span>
          </c:otherwise>
          </c:choose>
         </td>
        </tr>
        </table>
        </div>
     </div>
      </form>
      </div>
            </div>
          </div>
        </div>
    <!-------------------------------------------- contents -------------------------------------------------->
  <style>
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
  
  <script src="${pageContext.getServletContext().getContextPath()}/node_modules/sweetalert2/dist/sweetalert2.all.js"></script>
  <script>
  function warning(){
	    
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
	        	  location.href = 'delete?number=' + ${notice.number}
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

      <jsp:include page="../footer.jsp"/>