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
	    <strong class="p-4" style="font-weight:bold; text-align:left; font-size:1.8rem; margin-left:1rem;">Employment Recommendation</strong>
	  <div class="d-block shadow-xs rounded p-4 mb-2">
	      
	    <div class="row">
	    
	      <div class="col" style="position: relative;height: 150px;">
	        <div id="dis_available" class="scrollable-vertical scrollable-styled-dark p-4 border-danger" style="border:1px solid;position: relative;width: 48%;display: inline-block;height: 100%!important;">
	        <strong style="margin-left: 0.5%!important;font-size: 1rem;">관심 지역</strong><br>
	        </div>  
	        <div id="int_available" class="scrollable-vertical scrollable-styled-dark p-4 border-success" style="position: relative;border:1px solid;width: 48%;display: inline-block;height: 100%;">
	        <strong style="margin-left: 0.5%!important;font-size: 1rem;">관심 분야</strong><br>
	        </div>  
	        </div>
	    </div> 
	  </div>
	</div>
	
	<c:forEach var="item" items="${jobpostings}" varStatus="status">
  <div class="card transition-all-ease-250 transition-hover-top h-100 bl-0 br-0 bb-0 bw--2 card-body posting"
  		 style="cursor:pointer;display:none; height:240px"
  		 onclick="detail(${item.jobPostingNumber})"
  		 data-index="${status.getIndex()}" >
    <div style="disply:inline-block; float:left; height:200px; width:200px; margin-left:10px; margin-right:20px;">
      <div id="thumbnail" style="display:inline-block; float:left; width:200px; height:200px; border:1px solid; "> 
        <img src="../../upload/jobposting/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
      </div>
    </div>
    <h5 class="card-title" style="font-weight: bold;font-size: 1.2rem;margin-top: 0.8%;">${item.company.name}</h5>
    <span><strong>${item.title}</strong></span>
    <h6><a>${item.tel}</a></h6>
    <br>
    <c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="now" value="${now}" pattern="yyyyMMdd" />
		<fmt:formatDate var="bdate" value="${item.startDated}" pattern="yyyyMMdd" />
    <p class="card-text" style="height:20px; margin-bottom:6px;">${item.field.name}</p>
    <p class="card-text" style="height:20px; margin-bottom:6px;">${item.district.cityName}&nbsp;${item.district.name}</p>
    <span style="font-size:15px;">${item.startDated}&nbsp;(${bdate - now}일 전)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size:15px;">조회수 : ${item.viewCount}</span>
  <hr>
  </div>
  </c:forEach>
  <div style="margin-left:3%">
  총 <span id="total">13</span>개 결과 중 <span id="printed"></span>개를 출력했습니다.
  </div>
</div>

<!--------------------------------------더보기------------------------------------------------------->
<button id="moreListBtn" 
				class="container py-1 btn btn-secondary btn-lg btn-block" 
				style="width: 300px;height: 50px;margin-bottom: 1.3rem;">더보기
</button>
<!-------------------------------------/더보기------------------------------------------------------->


<script src="${pageContext.getServletContext().getContextPath()}/node_modules/components-jqueryui/jquery-ui.min.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/assets/js/generalUpdate.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.getContextPath()}/node_modules/sweetalert2/dist/sweetalert2.all.min.js"></script>
<script>
<%-------------------------------------------더보기 ------------------------------------------------%>
var button = document.getElementById("moreListBtn");

button.onclick = function() {
	var clickCnt = parseInt($('#printed').html()) - 1;
	
  for(var i = clickCnt+1; i < clickCnt+6; i++) {
  	var total = 1*$('#total').html();
 	 	var printed = 1*$('#printed').html();
 	 	
  	if(total > printed) {
  	  $(".posting[data-index="+i+"]").css('display', 'block');
  	  $('#printed').html(i+1);
  	} else {
  		
  	  Swal.fire({
		  position: 'center',
		  icon: 'warning',
		  title: '더이상 결과가 없습니다.',
		  showConfirmButton: false,
		  timer: 1000
		})
  		
  		break;
  	}
	}
  
};
<%------------------------------------------/더보기 ------------------------------------------------%>

window.onload = function() {
	
	// 관심지역이 비어있을 경우, 프로필로 이동유도
	var dists = $("div#dis_available span");
	  console.log(dists);
	    for(dist of dists) {
	     console.log($(dist).html());
	    }
	if(dists.length == 0 ) {
	    console.log(dists.length == 0);
		Swal.fire({
			  title: '관심지역이 비어있습니다.',
			  text: "내 프로필에서 수정하시겠습니까?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
	      confirmButtonText: '네',
	      cancelButtonText: '아니오'
			}).then((result) => {
			  if (result.value) {
				    location.href="../member/generalUpdate";
			  }
			})
		
	}
	
	// 관심분야가 비어있을 경우, 프로필로 이동유도
	var intrs = $("div#int_available span");
	console.log(intrs);
		for(intr of intrs) {
	   console.log($(intr).html());
		}
	if(intrs.length == 0) {
		console.log(intrs.length == 0);
	    Swal.fire({
	        title: '관심분야가 비어있습니다.',
	        text: "내 프로필에서 수정하시겠습니까?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '네',
	        cancelButtonText: '아니오'
	      }).then((result) => {
	        if (result.value) {
	            location.href="../member/generalUpdate";
	        }
	      })
	}
	
	  var lastNum = $(".posting").index($(".posting:last"));
	  $('#total').html(lastNum+1);

	  for(let i=0; i<5 ;i++) {
	  	$(".posting[data-index="+i+"]").css('display', 'block');
	  	
	  	if($('#total').html() - $('#printed').html() > 0) {
	      $('#printed').html(i+1);
	  	}
	  	
	  	if($('#total').html() == 0) {
		    $('#printed').html(0);
	  	}
	  }
	  

  };  


  // 관심 지역 리스트 불러오기
     var xhr = new XMLHttpRequest();
     xhr.onreadystatechange = () => {
       if (xhr.readyState == 4) {
         if (xhr.status == 200) {
           let skillList = JSON.parse(xhr.responseText); 
           for(var skill of skillList) {
             var addHtml = `<span style="/*cursor:pointer; */margin:2px;" class="interestDistrict badge badge-pill badge-secondary">` + skill.name + `</span>`
             $("#dis_available").append(addHtml);
           }
          }               
        }
       }    
     xhr.open('GET', '../district/listOfUserInterest', false); 
     xhr.send();
     
     // 관심 분야 리스트 불러오기
     var xhr = new XMLHttpRequest();
     xhr.onreadystatechange = () => {
       if (xhr.readyState == 4) {
         if (xhr.status == 200) {
           let skillList = JSON.parse(xhr.responseText); 
           for(var skill of skillList) {
             var addHtml = `<span style="/*cursor:pointer;*/margin:2px;" class="interestSkills badge badge-pill badge-secondary">` + skill.name + `</span>`
             $("#int_available").append(addHtml);
           }
          }               
        }
       }    
     xhr.open('GET', '../field/listOfUserInterest', false); 
     xhr.send();
     
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
  
  function detail(number) {
	  location.href = "../jobposting/detail?no=" + number;
  }
</script>

<!-- 관심 분야 탭 -->
<script>
</script>