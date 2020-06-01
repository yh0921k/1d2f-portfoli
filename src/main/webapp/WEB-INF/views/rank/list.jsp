<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="bg-white" style="padding: 30px 0px;">
	<div class="container py-1">
	
	  <h3 class="h4" style="display:inline-block;"><strong>Ranking</strong></h3>
	  
	  
	  <hr>
	  <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
	    <label>
		    <select id="moreLine" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
			    <option id="allField" class="fieldList">분야전체</option>       
			    <!-- 페이지 불릴 때 필드 리스트 로딩 -->
			    <c:forEach var="field" items="${fieldList}">
					  <option class="fieldList">${field.name}</option>
					</c:forEach>
		    </select>
		  </label>
    </div>
    
    <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
      <label>
        <select id="moreLine" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
	        <option id="viewCount" class="count">조회수</option>        
	        <option id="likeCount" class="count">좋아요수</option>
        </select>
      </label>
    </div>
    <br><br>
    
	  <div id="portfolio_field" style="width:100%; background-color:gray;">
	   <div id="pf_item" style="height:200px">
	     <div id="thumbnail" style="display:inline-block; float:left; width:150px; height:150px; border:1px solid; margin-left:20px; margin-right:20px;"> 
	       Test
	     </div>
	     <div id="contents" style="display:inline-block; float:left; width:80%; height:200px; border:1px dotted; margin-left:20px;">
	       Test2
	     </div>
	   </div>
	   <hr>
	   <div id="pf_item" style="height:200px">
       <div id="thumbnail" style="display:inline-block; float:left; width:150px; height:150px; border:1px solid; margin-left:20px; margin-right:20px;"> 
         Test
       </div>
       <div id="contents" style="display:inline-block; float:left; width:80%; height:200px; border:1px dotted; margin-left:20px;">
         Test2
       </div>
     </div>
	  </div>
	
	</div>
</section>

<script>
// window.onload = function() {
// 	var xhr = new XMLHttpRequest();
//   xhr.onreadystatechange = () => {
//       if (xhr.readyState == 4) {
//           if (xhr.status == 200) {
            
            
//           }
//       }
//   };
//   xhr.open('GET', '../rank/list?selected=' + queryString, true); 
//   xhr.send();
// };
</script>