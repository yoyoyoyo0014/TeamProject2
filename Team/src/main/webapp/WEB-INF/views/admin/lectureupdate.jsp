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
	<h1>${lec.subject.su_name}</h1>
	<form action="<c:url value="/admin/lecture/update"/>" method ="post">
		<input  type = "hidden" id ="num" name = "le_num" value ="${lec.le_num }">
		<label class ="mt-3" for="room" class = "m">강의실:</label>
		<input type="text" class="form-control" id="room" name="le_room" value="${lec.le_room}">
		<label class ="mt-3" for="schedule">강의시간:</label>
		<input type="text" class="form-control" id="schedule" name="le_schedule" value="${lec.le_schedule}">
		<label class ="mt-3" for="semester">학기:</label>
		<input type="text" class="form-control" id="semester" name="le_semester" value="${lec.le_semester}">
		
		
		<label class ="mt-3" for = "subject">과목 이름</label>
		<select class="form-control lec-sub-list" name="le_subject" id = "subject">
			
			<c:forEach items="${list}" var="list">
				<c:if test="${list.su_num eq lec.le_su_num}">
					<option value="${list.su_num}" selected>${list.su_name}</option>
				</c:if>
				<c:if test="${list.su_num ne lec.le_su_num}">
					<option value="${list.su_num}">${list.su_name}</option>
				</c:if>
			</c:forEach>
		</select>
		<label class ="mt-3" for = "professor"> 교수 이름</label>
		<select class="form-control lec-sub-list" name="le_professor" id = "professor">
			<c:forEach items="${meList}" var="list">
			<c:if test="${list.me_id eq lec.le_me_id}">
				<option value="${list.me_id}" selected>${list.me_name }</option>
			</c:if>
				<c:if test="${list.me_id ne lec.le_me_id}">
				<option value="${list.me_id}">${list.me_name }</option>
				</c:if>
			</c:forEach>
		</select>
		<button  class="btn btn-outline-info col-12 mb-3 mt-5"> 강의 수정</button>
	</form>
	
</div>
</body>
</html>