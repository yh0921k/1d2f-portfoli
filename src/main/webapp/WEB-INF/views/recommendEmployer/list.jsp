<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="theme-color" content="#377dff">
<div class="container py-1" id="bodyDiv">
	<!-- MEMBER INTEREST SKILL TAB -->
	<div class="tab-pane border bt-0 p-4 shadow-xs">
	  <div class="d-block shadow-xs rounded p-4 mb-2">
	      
	    <div class="row">
	      <div class="col">
	        <div id="int_available">
	        관심필드 : 
	        </div>  
	        <div id="region_available">
	        관심지역 : 
	        </div>  
	        </div>
	    </div> 
	  </div>
	</div>
	
	<!-- MEMBER INTEREST SKILL TAB -->
	<c:forEach var="item" items="${jobpostings}">
  <div class="card-body posting" style="height:240px" onclick="detail(${item.jobPostingNumber})" ">
    <div style="disply:inline-block; float:left; height:200px; width:200px; margin-left:10px; margin-right:20px;">
      <div id="thumbnail" style="display:inline-block; float:left; width:200px; height:200px; border:1px solid; "> 
        <img src="../../upload/jobposting/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
      </div>
    </div>
    <h5 class="card-title">${item.company.name}</h5>
    <span><strong>${item.title}<strong></span>
    <h6><a>${item.tel}</a></h6>
    <br>
    <c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="now" value="${now}" pattern="yyyyMMdd" />
		<fmt:formatDate var="bdate" value="${item.startDated}" pattern="yyyyMMdd" />
    <p class="card-text" style="height:20px; margin-bottom:6px;">${item.field.name}</p>
    <p class="card-text" style="height:20px; margin-bottom:6px;">${item.district.cityName}&nbsp; ${item.district.name}</p>
    <span style="font-size:15px;">시작일: ${item.startDated}&nbsp;(${bdate - now})</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size:15px;">조회수 : ${item.viewCount}</span>
  </div>
  <hr>
  </c:forEach>
</div>

<!--------------------------------------더보기------------------------------------------------------->
<button id="moreListBtn" 
				class="container py-1 btn btn-secondary btn-lg btn-block" 
				style="width: 300px;height: 50px;margin-bottom: 1.3rem;">더보기
</button>
<!-------------------------------------/더보기------------------------------------------------------->


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/assets/js/generalUpdate.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.getContextPath()}/node_modules/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script>
<%-------------------------------------------더보기 ------------------------------------------------%>
var button = document.getElementById("moreListBtn");

button.onclick = function() {
	var startIndex = parseInt($(".posting").index($(".posting:last")));
	var xhr = new XMLHttpRequest();
	xhr.open('GET', 'listMore?startIndex=' + (startIndex+1), false);
	xhr.send();
	$('#bodyDiv').append(xhr.responseText);
	
	if(xhr.responseText == "") {
		Swal.fire({
			  icon: 'error',
			  title: '더 이상 값이 없습니다',
			})
	}
};
<%------------------------------------------/더보기 ------------------------------------------------%>


  window.onload = function() {
	  
    // 관심 분야 리스트 불러오기
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          let skillList = JSON.parse(xhr.responseText); 
          for(var skill of skillList) {
            var addHtml = `<span style="cursor:pointer; margin:2px;" class="interestSkills badge badge-pill badge-secondary">` + skill.name + `</span>`
            $("#int_available").append(addHtml);
          }
         }               
       }
      }    
    xhr.open('GET', '../field/listOfUserInterest', false); 
    xhr.send();
	  
    if(document.getElementsByName("checkbox_p").length > 0) {
      return;
    }
    
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
	    if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          let obj = JSON.parse(xhr.responseText);
          for(idx in obj) {
            var addHtml = `<div class="iqs-item">       
            <label class="form-checkbox form-checkbox-primary">
              <input class="field" type="checkbox" name="checkbox_p">` + obj[idx].name + `</label>`
            $("#selectField").append(addHtml);
            $("#int_selectField").append(addHtml);
         }               
       }
	    }
    };
    xhr.open('GET', '../field/list', true); 
    xhr.send();
  };  

  
  function detail(number) {
	  location.href = "../jobposting/detail?no=" + number;
  }
</script>

<!-- 관심 분야 탭 -->
<script>
</script>