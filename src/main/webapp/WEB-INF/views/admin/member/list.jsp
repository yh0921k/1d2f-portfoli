<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="middle" class="flex-fill">
	<div class="page-title shadow-xs"></div>
	<section class="rounded mb-3 ">
		<div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
			<strong>회원 관리</strong>
		</div>

		<div id="rand_yjK_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row mb-3">
				<div class="col-sm-8 col-md-4 d-flex align-items-center justify-content-start">
					<div id="rand_yjK_filter" class="dataTables_filter">
						<label><input id="keyword" type="search" class="form-control form-control-sm" placeholder="Search..." aria-controls="rand_yjK"></label>
					</div>

					<div class="dataTables_length" id="rand_yjK_length">
						<label> 
						<select id="moreLine" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
								<option id="more10" value="10">10</option>
								<option id="more50" value="50">50</option>
								<option id="more100" value="100">100</option>
						</select>
						</label>
					</div>

				</div>

				<div style="margin-left: 17px;" class="input-group-over position-realtive z-index-1 bg-white">

					<input style="height: 42.22px;" type="text" name="regisDate"
						class="regisDate form-control bg-transparent datepicker"
						data-layout-rounded="true" data-today-highlight="true"
						data-title="가입일" data-show-weeks="true"
						data-today-highlight="true" data-today-btn="true"
						data-autoclose="true" data-format="YYYY-MM-DD"
						data-quick-locale='{
        "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
        "daysShort": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
        "daysMin": ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
        "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        "monthsShort": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        "today": "Today",
        "clear": "Clear",
        "titleFormat": "MM yyyy"
      }'>
					<span class="fi fi-calendar fs--20 ml-4 mr-4 z-index-n1 text-muted"></span>
				</div>


				<div class="col-sm-12 col-md-6 d-flex align-items-center justify-content-end">
					<div class="dt-buttons btn-group flex-wrap"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
					<table id="memberTable"
						class="table-datatable table table-bordered table-hover table-striped js-datatableified dataTable dtr-inline"
						data-lng-empty="No data available in table"
						data-lng-page-info="Showing _START_ to _END_ of _TOTAL_ entries"
						data-lng-filtered="(filtered from _MAX_ total entries)"
						data-lng-loading="Loading..." data-lng-processing="Processing..."
						data-lng-search="Search..."
						data-lng-norecords="No matching records found"
						data-lng-sort-ascending=": activate to sort column ascending"
						data-lng-sort-descending=": activate to sort column descending"
						data-lng-column-visibility="Column Visibility" data-lng-csv="CSV"
						data-lng-pdf="PDF" data-lng-xls="XLS" data-lng-copy="Copy"
						data-lng-print="Print" data-lng-all="All" data-main-search="true"
						data-column-search="false" data-row-reorder="false"
						data-col-reorder="true" data-responsive="true"
						data-header-fixed="true" data-select-onclick="true"
						data-enable-paging="true" data-enable-col-sorting="true"
						data-autofill="false" data-group="false" data-items-per-page="10"
						data-lng-export="<i class='fi fi-squared-dots fs--18 line-height-1'></i>"
						dara-export-pdf-disable-mobile="true"
						data-export="[&quot;csv&quot;, &quot;pdf&quot;, &quot;xls&quot;]"
						data-options="[&quot;copy&quot;, &quot;print&quot;]" id="rand_yjK"
						role="grid" aria-describedby="rand_yjK_info"
						style="width: 1168px;">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="0"
									style="width: 100px;" aria-sort="ascending"
									aria-label="Date: activate to sort column descending">회원번호</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="1"
									style="width: 100px;"
									aria-label="Time: activate to sort column ascending">회원유형</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="2"
									style="width: 150px;"
									aria-label="Time: activate to sort column ascending">아이디</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="3"
									style="width: 150px;"
									aria-label="IP Address: activate to sort column ascending">이메일</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="4"
									style="width: 100px;"
									aria-label="User: activate to sort column ascending">이름</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="5"
									style="width: 200px;"
									aria-label="Request: activate to sort column ascending">가입일</th>
								<th class="sorting" tabindex="0" aria-controls="rand_yjK"
									rowspan="1" colspan="1" data-column-index="6"
									style="width: 200px;"
									aria-label="Request: activate to sort column ascending">외부가입</th>
						</thead>

						<tbody>

							<c:forEach var="member" items="${members}">
								<tr role="row" class="odd">
									<td tabindex="0" class="sorting_1">${member.number}</td>
									<td>${member.type}</td>
									<td>${member.id}</td>
									<td>${member.email}</td>
									<td>${member.name}</td>
									<td>${member.createDate}</td>
									<td>${member.provider}</td>
								</tr>
							</c:forEach>
					</table>
				</div>
			</div>
			<div class="row"></div>

			<div stype="float:left">
				<a id="readMore" href="#" class="btn btn-outline-dark btn-block">LOAD MORE</a>
			</div>

		</div>
</div>
</section>
</div>


<script>
	$(document)
			.ready(
					function() {
						$("#keyword")
								.keyup(
										function() {
											$("#memberTable > tbody > tr > td")
													.css("color", "black");
											var k = $(this).val();
											$("#memberTable > tbody > tr").hide(); // tr 태그 전부 숨김
											var temp = $("#memberTable > tbody > tr > td:nth-child(n):contains('"
													+ k + "')");
											$(temp).css("color", "red");
											if (k == "") {
												$(temp).css("color", "black");
											}
											$(temp).parent().show();
										});
					});

	$(document).ready(
			function() {
				$("#moreLine").change(
						function() {
							var moreLine = $("#moreLine").val();
							window.location.href = "list?" + this.id + "=" + moreLine + "&regisDate=" + $(".regisDate").val();
						});
			});

	$(document).ready(
			function() {
				$(".regisDate").change(
						function() {
							var moreLine = $("#moreLine").val();
							window.location.href = "list?" + "moreLine" + "=" + moreLine + "&regisDate=" + $(".regisDate").val();
						});
			});
	

	$(document).ready(function() {
	  var loadLast = 1;
	  var tbody = document.querySelector("#memberTable > tbody");
	  
	  $("#readMore").click(function() { 
		  
		  loadLast++;
		  console.log(loadLast);

		  var xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
		 			tbody.innerHTML = tbody.innerHTML + xhr.responseText;
				}
			}
		  xhr.open('GET', 'moreContents?pageNumber=' + loadLast + "&moreLine=" + $("#moreLine").val() + "&regisDate=" + $(".regisDate").val(), true);
		  xhr.send(null);
	  });
	});

	window.onload = function() {
	  var moreOption = "#more" + ${moreLine};
	  $(moreOption).attr("selected", "selected");
	  
	  var current = "${regisDate}";
	  console.log(typeof current);
	  $(".regisDate").val(current);
	};
</script>
