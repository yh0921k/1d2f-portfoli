<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
