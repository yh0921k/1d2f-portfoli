<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="middle" class="flex-fill">
  <div class="page-title shadow-xs">
  </div>
  <section class="rounded mb-3 ">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">Log 조회</div>
        <!--
          data-autofill="false|hover|click" 
          data-enable-paging="true"       false = show all, no pagination
          data-items-per-page="10|15|30|50|100" 
        -->
        <div id="rand_yjK_wrapper" class="dataTables_wrapper dt-bootstrap4">
        <div class="row mb-3">
        <div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-start">
        <div id="rand_yjK_filter" class="dataTables_filter">
        <label><input id="keyword" type="search" class="form-control form-control-sm" placeholder="Search..." aria-controls="rand_yjK"></label>
        </div>
        
        <div class="dataTables_length" id="rand_yjK_length">
        <label>
        <select id="moreLine" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
        <option id="more10" value="10">10</option>        
        <option id="more50" value="50">50</option>
        <option id="more100" value="100">100</option>        
        </select></label></div>
        </div>
        
       
        
        <div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-end">
        <div class="dt-buttons btn-group flex-wrap">
        </div>
        </div>
        </div>
        <div class="row">
        <div class="col-sm-12">
        <table id="logTable" class="table-datatable table table-bordered table-hover table-striped js-datatableified dataTable dtr-inline" data-lng-empty="No data available in table" data-lng-page-info="Showing _START_ to _END_ of _TOTAL_ entries" data-lng-filtered="(filtered from _MAX_ total entries)" data-lng-loading="Loading..." data-lng-processing="Processing..." data-lng-search="Search..." data-lng-norecords="No matching records found" data-lng-sort-ascending=": activate to sort column ascending" data-lng-sort-descending=": activate to sort column descending" data-lng-column-visibility="Column Visibility" data-lng-csv="CSV" data-lng-pdf="PDF" data-lng-xls="XLS" data-lng-copy="Copy" data-lng-print="Print" data-lng-all="All" data-main-search="true" data-column-search="false" data-row-reorder="false" data-col-reorder="true" data-responsive="true" data-header-fixed="true" data-select-onclick="true" data-enable-paging="true" data-enable-col-sorting="true" data-autofill="false" data-group="false" data-items-per-page="10" data-lng-export="<i class='fi fi-squared-dots fs--18 line-height-1'></i>" dara-export-pdf-disable-mobile="true" data-export="[&quot;csv&quot;, &quot;pdf&quot;, &quot;xls&quot;]" data-options="[&quot;copy&quot;, &quot;print&quot;]" id="rand_yjK" role="grid" aria-describedby="rand_yjK_info" style="width: 1168px;">
          <thead>
            <tr role="row">
            <th class="sorting_asc" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="0" style="width: 150px;" aria-sort="ascending" aria-label="Date: activate to sort column descending">Date</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="1" style="width: 150px;" aria-label="Time: activate to sort column ascending">Time</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="2" style="width: 150px;" aria-label="IP Address: activate to sort column ascending">IP Address</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="3" style="width: 150px;" aria-label="User: activate to sort column ascending">User</th>
            <th class="sorting" tabindex="0" aria-controls="rand_yjK" rowspan="1" colspan="1" data-column-index="4" style="width: 200px;" aria-label="Request: activate to sort column ascending">Request</th>
          </thead>
          
          <tbody>
          
          <c:forEach var="log" items="${loglist}">
            <tr role="row" class="odd">
              <td tabindex="0" class="sorting_1">${log.date}</td>
              <td>${log.time}</td>
              <td>${log.ipAddr}</td>
              <td>${log.user}</td>
              <td>${log.req}</td>
            </tr>
          </c:forEach>      
<!--           <tr role="row" class="odd"> -->
<%--               <td tabindex="0" class="sorting_1">${loglist[0].ipAddr }</td> --%>
<!--               <td>Accountant</td> -->
<!--               <td>Tokyo</td> -->
<!--               <td>33</td> -->
<!--               <td>test</td> -->
<!--             </tr><tr role="row" class="even"> -->
<!--               <td class="sorting_1" tabindex="0">test</td> -->
<!--               <td>Chief Executive Officer (CEO)</td> -->
<!--               <td>London</td> -->
<!--               <td>47</td> -->
<!--               <td>test</td> -->
<!--             </tr> -->
                </tbody>
<!--           <tfoot> -->
<!--             <tr> -->
<!--             <th rowspan="1" colspan="1">날짜</th> -->
<!--             <th rowspan="1" colspan="1">요청</th> -->
<!--             <th rowspan="1" colspan="1">ID</th> -->
<!--             <th rowspan="1" colspan="1">IP주소</th> -->
<!--             </tr> -->
<!--           </tfoot> -->
        </table></div></div>
        <div class="row">
<!--         <div class="col-sm-12 col-md-5"> -->
<!--         <div class="dataTables_info" id="rand_yjK_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="rand_yjK_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="rand_yjK_previous"><a href="#" aria-controls="rand_yjK" data-dt-idx="0" tabindex="0" class="page-link"><i class="fi fi-arrow-start fs--13"></i></a></li><li class="paginate_button page-item active"><a href="#" aria-controls="rand_yjK" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="rand_yjK" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="rand_yjK_next"><a href="#" aria-controls="rand_yjK" data-dt-idx="7" tabindex="0" class="page-link"><i class="fi fi-arrow-end fs--13"></i></a></li></ul></div></div></div></div> -->

<!--       </div> -->
    </div>  
    
    <div stype="float:left">
        <a id="readMore" href="#" class="btn btn-outline-dark btn-block">LOAD MORE</a>
    </div>

  </div>
</div>        
</section>
</div>

<script>
$(document).ready(function() { 
  $("#keyword").keyup(function() { 
    $("#logTable > tbody > tr > td").css("color","black");
    var k = $(this).val(); 
      console.log(k);
        $("#logTable > tbody > tr").hide(); // tr 태그 전부 숨김
          var temp = $("#logTable > tbody > tr > td:nth-child(n):contains('" + k + "')"); 
          $(temp).css("color","red");
          console.log(typeof(temp));
          console.log(temp);
          if(k=="") {
            $(temp).css("color","black");
          }
          $(temp).parent().show();
  }); 
});
$(document).ready(function() { 
  $("#moreLine").change(function() { 
	  var moreLine = $("#moreLine").val();
    console.log("contentsLog?" + this.id + "=" + moreLine);
    window.location.href =  "contentsLog?" + this.id + "=" + moreLine;
  });
});

$(document).ready(function() {
  var loadLast = 0;
  $("#readMore").click(function() { 
	  
	  loadLast += Number($("#moreLine").val());
	  console.log(loadLast);

	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
            	$("#logTable > tbody > tr:last").after(xhr.responseText);
            }
        }
    };
	  xhr.open('GET', 'moreContentsLog?startLine=' + loadLast + "&moreLine=" + $("#moreLine").val(), true);
	  xhr.send();
	  
  });
});
	
	
window.onload = function() {
  var moreOption = "#more" + ${moreLine};
  $(moreOption).attr("selected", "selected");
};
</script>