<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.bt-img {
	width: 10px;
	display: inline-block;
}
#drawer {
  position: relative;
  width: 100%;
  height: 100%;
}

#mydiv {
  position: absolute;
  margin : 150px;
  width: 600px;
  height: auto;
  background-color: menu;
  z-index: 200;
  cursor: pointer;
}
</style>

<div class="container-fluid"  id="drawer" ondrop="drop(event)" ondragover="dragover(event)">

	<div class="row">

		<div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

			<!-- CATEGORIES -->
			<nav class="nav-deep nav-deep-light mb-2">

				<!-- mobile only -->
				<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" data-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span class="h5 py-2 m-0 float-start"> My Page </span>
				</button>

				<!-- desktop only -->
				<c:if test="${loginUser.type == '1'}">
					<a href="/portfoli/app/member/generalMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				</c:if> 
				<c:if test="${loginUser.type == '2'}">
					<a href="/portfoli/app/member/companyMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				</c:if>
				<!-- navigation -->
				<ul id="nav_responsive" class="nav flex-column d-none d-lg-block font-weight-bold ">

					<!-- 내 정보 -->
					
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 내 정보 </span>
        	</a>
					
					<c:if test="${loginUser.type == '1'}">
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link" 	href="/portfoli/app/member/generalUpdate"> 내 정보 수정하기 </a></li>
							</ul>
						</c:if> 
						<c:if test="${loginUser.type == '2'}">
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link" href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
							</ul>
						</c:if>
						</li>

					<!-- 쪽지함 -->
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 쪽지함 </span>
					</a>

						<ul class="nav flex-column px-2 font-weight-bold">
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
						</ul>
						</li>
						
						<!-- 일반회원 -->
						<c:if test="${loginUser.type == '1'}">
						
							<!-- 일정 -->
							<li class="nav-item active"><a class="nav-link" href="/portfoli/app/calendar/calendar"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 일정 관리 </span></a></li>
							
							<!-- 포트폴리오 -->
							<li class="nav-item font-weight-bold">
								<a class="nav-link" href="#"> 
								<span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
								<span class="px-2 d-inline-block active font-weight-bold"> 내 포트폴리오 </span>
								</a>
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item"><a class="nav-link" href="/portfoli/app/portfolio/mylist"> 포트폴리오 관리 </a></li>
								<li class="nav-item"><a class="nav-link" href="/portfoli/app/portfolio/myRecommendedlist"> 내가 찜한 목록 </a></li>
							</ul>
							</li>
							 
						</c:if>
						
						<!-- 기업회원 -->
						<c:if test="${loginUser.type == '2'}">
						
						<!-- 멤버십 -->
						<li class="nav-item"><a class="nav-link" href="/portfoli/app/payment/introduction"> <i class="fi fi-arrow-end m-0 fs--12"></i><span class="px-2 d-inline-block"> 멤버십 </span></a></li>

						<!-- 공고 관리 -->
						<li class="nav-item"><a class="nav-link " href="/portfoli/app/jobposting/mylist"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 공고 관리 </span></a></li>
						</c:if>

				</ul>

			</nav> 
			<!-- /CATEGORIES -->

		</div>

		<div class="portlet col-lg-2 mt--20" 
		     id="mydiv" 
		     draggable="false" 
		     ondragstart="dragstart(event)" 
		     style="position: absolute;top: 30%;left: -6%;padding: 10px;">
			<div class="portlet-header" style="position: relative;">
				<h6 class="js-toDoList d-none d-lg-block m--3">< To Do List ></h6>
			</div>
			<form class="js-toDoForm" style="position:relative;">
				<input style="position:relative; height:5rem;" class="form-control form-control-sm" type="text" placeholder="할 일 추가"></input>
			</form>
		</div>


		<div class="portlet col-lg-8 mt--20">

			<div class="fullcalendar rounded p-3 m-3"
				data-fullcalendar-default-view="dayGridMonth"
				data-fullcalendar-editable="true" data-fullcalendar-timezone="Asia/Seoul"
				data-fullcalendar-default-date="now"
				data-fullcalendar-modal-size="modal-lg"
				data-fullcalendar-event-create-modal="true"
				data-fullcalendar-modal-event-create="eventCreate"
				data-fullcalendar-event-edit-modal="true"
				data-fullcalendar-modal-event-edit="eventEdit?id="
				data-fullcalendar-date-click="modal"
				data-fullcalendar-modal-date-click-modal="eventCreate?date="
				data-toast-success="Successfully Updated!"
				data-toast-position="top-center"
				data-fullcalendar-plugins='[ "interaction", "dayGrid", "timeGrid", "list", "bootstrap", "googleCalendar" ]'
				data-fullcalendar-source-object="events"
				data-fullcalendar-lang-btn='{ "today" : "today", "month" : "month", "week"   : "week", "day"  : "day", "list"   : "list" }'
				data-fullcalendar-header='{ "left"     : "prev,next, today, customAddEventButton", "center"   : "title", "right"  : "dayGridMonth,timeGridWeek,timeGridDay,listWeek" }'
				data-fullcalendar-time-format='{ "hour"     : "numeric", "minute"   : "2-digit", "meridiem"   : "short"  }'>
				</div>
		</div>

	</div>
</div>

<script>

let distX;
let distY;
let posX;
let posY;

function dragstart(event) {
    posX = event.pageX;
    posY = event.pageY;
    distX = event.srcElement.offsetLeft - posX;
    distY = event.srcElement.offsetTop - posY;
}

function dragover(evnet) {
    event.stopPropagation();
    event.preventDefault();
}

function drop(event) {
    event.stopPropagation();
    event.preventDefault();
    posX = event.pageX;
    posY = event.pageY;
    console.log(posX, posY, distX, distY);
    $('#mydiv').css('margin-left', posX + distX + 'px')
        .css('margin-top', posY + distY + 'px');
}


var events = [];
const toDoForm = document.querySelector(".js-toDoForm");
const toDoInput = toDoForm.querySelector("input");
const toDoList = document.querySelector(".js-toDoList");

const TODOS_LS = 'toDos';
let toDos = [];

function init() {
    loadToDos();
    toDoForm.addEventListener("submit", handleSubmit);
}

function loadToDos() {
    const loadedToDos = localStorage.getItem(TODOS_LS);
    if (loadedToDos !== null) {
        const parsedToDos = JSON.parse(loadedToDos);
        parsedToDos.forEach(function(toDo) {
            paintToDo(toDo.text);
        }); 
    }
}

function deleteToDo(event) { 
    const btn = event.target;
    const li = btn.parentNode;
    toDoList.removeChild(li);

    const cleanToDos = toDos.filter(function(toDo){
        return toDo.id !== parseInt(li.id);
    });
    toDos = cleanToDos;
    saveToDos();
}

function paintToDo(text) {
    const image = new Image();
    image.src = '/portfoli/resources/assets/images/x.png';
    image.classList.add("bt-img");
    const li = document.createElement("li");
    const delBtn = document.createElement("button");
    const span = document.createElement("span");
    const newId = toDos.length + 1;
    delBtn.appendChild(image);
    delBtn.addEventListener("click", deleteToDo);
    span.innerText = text + ` `;
    li.appendChild(span);
    li.appendChild(delBtn);
    li.id = newId;
    toDoList.appendChild(li);
    const toDoObj = {
        text: text,
        id: newId
    };
    toDos.push(toDoObj);
    saveToDos();
}

function saveToDos() {
    localStorage.setItem(TODOS_LS, JSON.stringify(toDos));
}

function handleSubmit(event) {
    event.preventDefault();
    const currentValue = toDoInput.value;
    paintToDo(currentValue);
    toDoInput.value ="";
}

window.onload = function(proSeq) {
    $.ajax({
        contentType:'application/json',
        dataType:'json',
        url:'schedule',
        type:'post',
        async: false,
        success:function(resp){
        	events = resp;
        },
        error:function(){
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
        }
    });
    return events;
	
};
	
init();
</script>
