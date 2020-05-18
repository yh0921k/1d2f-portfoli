<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

          
<c:forEach var="log" items="${loglist}">
  <tr role="row" class="odd">
    <td tabindex="0" class="sorting_1">${log.date}</td>
    <td>${log.time}</td>
    <td>${log.ipAddr}</td>
    <td>${log.user}</td>
    <td>${log.req}</td>
  </tr>
</c:forEach>      
