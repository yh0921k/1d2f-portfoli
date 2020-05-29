<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
  width: 600px;
  height: auto;
  background-color: menu;
  z-index: 200;
  cursor: pointer;
}
</style>

<div class="container-fluid"  id="drawer" ondrop="drop(event)" ondragover="dragover(event)">

	<div class="row">

		<jsp:include page="../member/sidebar.jsp" />

		<div class="portlet col-lg-2 mt--20" id="mydiv" draggable="true" ondragstart="dragstart(event)">
			<div class="portlet-header">
				<h6 class="js-toDoList d-none d-lg-block m--3">< To Do List ></h6>
			</div>
			<form class="js-toDoForm">
				<input class="form-control form-control-sm" type="text" placeholder="할 일 추가"></input>
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
