<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="middle" class="flex-fill">  
  <section class="rounded mb-3 ">
      <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
        <strong>공지사항 변경</strong>
      </div>

    <form action="update" method="post" enctype="multipart/form-data">        
        <p class="text-gray-900 mb-1 ml-3">작성일시 : ${notice.registeredDate}</p>
        <p class="text-gray-900 mb-1 ml-3">조회수 : ${notice.viewCount}</p>
          
        
      <input name="originalNoticeNumber" type=hidden value="${notice.getCategoryNumber()}"/>
      <input name="number" type="hidden" value="${notice.getNumber()}"/>
      <div class="row">         
        
        <select name="categoryNumber" class='optPadding mb-1 ml-4'>
          <option value="${category.getCategoryNumber()}">${category.getName()}</option>
          <option disabled="disabled">-------------------</option>
          <c:forEach items="${list}" var="item">
          <c:choose>
          <c:when test="${category.categoryNumber eq item.getCategoryNumber()}">
          </c:when>
          <c:otherwise>
          <option value="${item.getCategoryNumber()}">${item.getName()}</option>
          </c:otherwise>
          </c:choose>
          </c:forEach>
        </select>                          
      </div>
        <br> 
        <div class="container-fluid">
          <div style="margin-bottom:3px;">
          <span class="text-gray-900" style="font-weight:bold;">제목 : </span> <input required type="text"
            class="form-label-group form-control-clean col-md-11 mt--5"
            name="title" value="${notice.title}"></strong>
          </div>
          <textarea style="resize:none; height: 600px;" required placeholder="내용을 적어주세요." id="description"
            name="content" class="form-control" rows="6">${notice.content}</textarea>
            
            <div class='photoDiv' style="min-height: 200px;">
            <%-- filePar : 첨부파일 개수 늘리는 부분 --%>
              <div align="center" id="filePar">
              <input type="file" name="files" class="files" onclick="plus(event)"/><br>
              </div>
            </div>
            
          <div align="right" class="container-fluid">
            <button type="submit"
              class="btn btn-outline-secondary btn-pill btn-sm mt-3">
              수정(M)</button>
              
            <button type="submit"
              class="btn btn-outline-secondary btn-pill btn-sm mt-3" onclick="move(event)">
              취소(C)</button>

          </div>
        </div>
      </form>

  </section>
</div>     
    

  <style>
    .files{margin:5px 0px;}
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed;}
    .padding{padding:7px; border-right: 2px solid lightGray;}
    .optPadding{height: 30px; padding: 0px 5px; width: 24%}
    .pinkPadding{resize:none; padding:5px; border-color:pink; width: 75%; height: 100%}
    .photoDiv{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{resize:none; border-color:pink; width: 100%; height: 450px;}
  </style>
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
    
  </script>