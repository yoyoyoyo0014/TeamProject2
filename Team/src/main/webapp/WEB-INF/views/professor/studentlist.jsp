<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>수강생 목록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
	<h1>수강생 목록</h1>
	<table class="table">
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학점</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="course" items="${list}">
				<tr>
					<td>${course.co_me_id}</td>
					<td>${course.member.me_name}</td>
					<td>${course.co_grade}</td>
					<td>${course.member.me_email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>