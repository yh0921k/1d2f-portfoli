 <%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->
  <jsp:include page="navbar.jsp"/>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20 p-3" style="width: 60%;box-shadow: none;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block">공지사항</h1>

      </div>
      <form action="updateForm" method="post">
      <input name="number" type="hidden" value="${notice.getNumber()}"/>
      <input name="number" type="hidden" value="${notice.categoryNumber}"/>
        <div class="row">
          <span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">카테고리: ${categoryName}</span> 
        </div>
        <p class="text-gray-900 mb-1 ml-3">작성일시 : ${notice.registeredDate}</p>
        <p class="text-gray-900 mb-1 ml-3">조회수 : ${notice.viewCount}</p>
        <div class="container-fluid">
          <span class="text-gray-900">제목 : ${notice.title}</span>

          <p class="text-gray-900 mt-3">내용 :</p>
          <textarea readonly="readonly" style="resize:none; max-height: 600px;" id="description"
            name="content" class="form-control" rows="6">${notice.content}</textarea>

        <div class='photoDiv'>
          <div colspan="2"  class='photoInside'>
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
         </div>
        </div>
        </div>
      </form>
    </div>
  </div>
 </div>
    <!-------------------------------------------- contents -------------------------------------------------->
  <style>
    #description.form-control{background-color: transparent; border-color: #eff1f3!important;}
    .photoDiv{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .files{margin:5px 0px;}
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
    var td = document.querySelector(".photoDiv");
    
    td.addEventListener("click", function(e) {
        e.stopImmediatePropagation();
        this.style.height = 'auto';
        
        var br = document.createElement("br");
        
        var newNode = document.createElement("input");
        newNode.type="file";
        newNode.name="files";
        newNode.setAttribute("class", "files");
        newNode.setAttribute("onclick", "plus(event)");
        
        var filePar = document.querySelector("#filePar");
        console.log(filePar);
        console.log(newNode);
        filePar.appendChild(newNode);
        filePar.appendChild(br);
        
    });
  
    function plus(e) {
      e.stopImmediatePropagation();
    }
    
    
    function move(e) {
        e.preventDefault();
        location.href = "list";
      }
  
  
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

