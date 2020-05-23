<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->
  <jsp:include page="navbar.jsp"/>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20 p-3" style="width: 65%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block">공지사항</h1>
      </div>
      <form action="add" method="post" enctype="multipart/form-data">
        <div class="row">
          <span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">카테고리 : </span>
            
           <select id="select_options2" name="noticeNumber" class="form-control form-control-sm col-md-3">
           <c:forEach items="${list}" var="item">
               <option value="${item.getCategoryNumber()}">[${item.getCategoryNumber()}]${item.getName()}</option>
           </c:forEach>
           </select>                

        </div>
        <div class="container-fluid">
          <span class="text-gray-900">제목 : </span> <input required type="text"
            class="form-label-group form-control-clean col-md-11 mt--5"
            name="title">

          <p class="text-gray-900 mt-3">내용 :</p>

          <textarea style="resize: none; height: 600px" required placeholder="내용을 적어주세요." id="description"
            name="content" class="form-control" rows="6"></textarea>

                <div class="photoDiv" style="min-height: 150px">
                <%-- filePar : 첨부파일 개수 늘리는 부분 --%>
                  <div align="center" id="filePar">
                    <input type="file" name="files" class="files" onclick="plus(event)"/><br>
                  </div>
                </div>

          <div align="right" class="container-fluid">
            <button type="submit"
              class="btn btn-outline-secondary btn-pill btn-sm mt-3">
              등록하기</button>

          </div>
        </div>
      </form>
    </div>
    <!-------------------------------------------- /contents -------------------------------------------------->
  </div>
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
