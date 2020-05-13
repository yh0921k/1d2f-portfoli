<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <jsp:include page="../header.jsp"/>

			<!-- PAGE TITLE -->
      <section class="bg-white" style="padding: 30px 0px;">
				<div class="container py-1">

					<h1 class="h2">
						포트폴리오
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="#!">portfoli</a></li>
							<li class="breadcrumb-item active" aria-current="page">포트폴리오 게시판</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->


			<!-- FAQ -->
      <section style="padding: 50px 0px;">
        <div class="container">

          <div class="row">

						<div class="col-12 col-lg-12">

							 <form action="add" method="post" enctype="multipart/form-data">
                <table class="lightGray">

                <tr class="firstTR" >
                 <td align="center" style="width:20%;">공개여부</td>
                 <td style="height:50px" class="smallPadding">
                  <input type="radio" name="readable" value="1"/>공개
                  <input type="radio" name="readable" value="0"/>비공개
                 </td>

                </tr>
                <tr class="firstTR">
                 <td align="center">홈페이지</td>
                 <td style="height:50px" class="smallPadding"><textarea rows="1" name='homepage' style='resize: none; width:100%;'></textarea></td>
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
                  <td colspan="2" align="center">
                    <input type="file" name="thumb" accept=".gif, .jpg, .jpeg, .png" class="files"/><br>
                  </td>
                </tr>
                <tr class = "photoTD padding">
                <%-- filePar : 첨부파일 개수 늘리는 부분 --%>
                  <td colspan="2" align="center" id="filePar">
                    <input type="file" name="files" class="files" onclick="plus(event)"/><br>
                  </td>
                </tr>
                <tr style="background-color: white">
                  <td colspan="2" align="center">
		                <button>글쓰기</button>
		                <button onclick="move(event)">취소</button>
                  </td>
                </tr>
                </table>
                
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
  var td = document.querySelector("#filePar");
  console.log(td);
  
  td.addEventListener("click", function(e) {
      e.stopImmediatePropagation();
      
      var br = document.createElement("br");
      
      var newNode = document.createElement("input");
      newNode.type="file";
      newNode.name="files";
      newNode.setAttribute("class", "files");
      newNode.setAttribute("onclick", "plus(event)");
      
      // input file 할때 확장자를 선택할 경우
      // newNode.setAttribute("accept", ".gif, .jpg, .jpeg, .png");
      
      document.querySelector("#filePar");
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
