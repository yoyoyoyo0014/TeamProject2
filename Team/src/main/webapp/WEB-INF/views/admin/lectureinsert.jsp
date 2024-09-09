<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>강의 추가</title>
</head>
<body>

<div class="layout">
<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
<div class="container">
<div class="main_layout">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="main_container">
	<h1 class = "d-flex justify-content-center mt-5">강의 추가</h1>
	<h1>${lec.subject.su_name}</h1>
	<form action="<c:url value="/admin/lecture/insert"/>" method ="post">
	
		<label class ="mt-3" for="room">강의실:</label>
		<input type="text" class="form-control" id="room" name="le_room">
		<label class ="mt-3" for="schedule">강의시간:</label>
		<input type="text" class="form-control" id="schedule" name="le_schedule">
		<label class ="mt-3" for="semester">학기:</label>
		<input type="text" class="form-control" id="semester" name="le_semester">
		
		
		<label class ="mt-3" form = "subject">과목 </label>
		<select class="form-control lec-sub-list" name="le_subject" id = "subject">
			<c:forEach items="${list}" var="list">
			<option value="${list.su_num }">${list.su_name}</option>
			</c:forEach>
		</select>
		<label class ="mt-3" form = "professor">교수 </label>
		<select class="form-control lec-sub-list mb-3" name="le_professor" id = "professor">
			<c:forEach  items="${meList}" var="list">
			<option value="${list.me_id }">${list.me_name }</option>
			</c:forEach>
		</select>
		
		<button class="btn btn-outline-info col-12 mb-3 mt-3" style ="height : 50px"> 강의 추가</button>
	</form>
	</div>
	</div>
</div>
</div>
</body>
</html>