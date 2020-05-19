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
 
          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/report/list"> <span class="px-2 d-inline-block"> 신고 </span>
          </a></li>

        </ul>
      </nav>
    </div>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20" style="width: 65%;">

	 <form action="add" method="post" enctype="multipart/form-data">
      <div class="portlet-header">
        <h1 class="d-none d-lg-block m--3">공지사항</h1>
        <div align="right">
          <button class="btn btn-outline-secondary btn-pill btn-sm" 
                  onclick="location.href='form'">글쓰기(+)</button>
          <button class="btn btn-outline-secondary btn-pill btn-sm" 
                  onclick="move(event)">취소</button>
        </div>
        
      </div>

      <div class="table-responsive rounded" style="min-height: 500px;">
                <table class="lightGray">

                <tr class="firstTR" >
                 <td align="center" style="width:20%;">게시글 유형</td>
                 <td style="height:50px" class="smallPadding">
                 
              <select name="noticeNumber" style="height: 30px; width: 100%;">
              <c:forEach items="${list}" var="item">
                  <option value="${item.getCategoryNumber()}">[${item.getCategoryNumber()}]${item.getName()}</option>
              </c:forEach>
              </select>                
                 
                 </td>
                </tr>
                
                <tr class="firstTR">
                 <td align="center">제목</td>
                 <td style="height:50px" class="smallPadding"><textarea rows="1" name='title' style='resize: none; width:100%;'></textarea></td>
                </tr>
                
                <tr height="500" class="firstTR">
                <td align="center">내용</td>
                <td style="height:300px;" class="smallPadding"><textarea name='content' style="resize: none; width:100%; height:100%;"></textarea></td>
                </tr>
                
                <tr class = "photoTD padding">
                <%-- filePar : 첨부파일 개수 늘리는 부분 --%>
                  <td colspan="2" align="center" id="filePar">
                    <input type="file" name="files" class="files" onclick="plus(event)"/><br>
                  </td>
                </tr>
                </table>
                </div>
                </form>

							</div>

						</div>
				  </div>
  <style>
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed; padding:0px 5px;}
    .padding{padding:10px; border-right: 2px solid lightGray;}
    .smallPadding{padding:5px 5px; border-right: 2px solid lightGray;}
    .optPadding{height: 30px; padding: 0px 5px;}
    .pinkPadding{resize:none; border-color:pink; width: 75%; height: 100%}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{resize:none; border-color:pink}
  </style>
  <script>
  var td = document.querySelector(".photoTD");
  console.log(td);
  
  td.addEventListener("click", function(e) {
      e.stopImmediatePropagation();
      
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
      
      e.stopImmediatePropagation();
      
  });
  
    function plus(e) {
      e.stopImmediatePropagation();
    }
    
    function move(e) {
        e.preventDefault();
        location.href = "list";
      }
  </script>
  
		  <jsp:include page="../footer.jsp"/>
