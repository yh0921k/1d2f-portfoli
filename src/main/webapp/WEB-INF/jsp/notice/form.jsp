<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <jsp:include page="../header.jsp"/>

			<!-- PAGE TITLE -->
      <section class="bg-white" style="padding: 30px 0px;">
				<div class="container py-1">

					<h1 class="h2">
						고객센터
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="#!">portfoli</a></li>
							<li class="breadcrumb-item active" aria-current="page">고객센터</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->


			<!-- FAQ -->
      <section style="padding: 50px 0px;">
        <div class="container">

          <div class="row">

          <%--왼쪽 noticebar부분 --%>
          <jsp:include page="sidebar.jsp" />
						
						<div class="col-12 col-lg-8">

							 <form action="add" method="post" enctype="multipart/form-data">
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
                <button>글쓰기</button>
                </form>
                

							</div>

						</div>
				  </div>


			</section>
			<!-- /FAQ -->

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
  </script>
  
		  <jsp:include page="../footer.jsp"/>
