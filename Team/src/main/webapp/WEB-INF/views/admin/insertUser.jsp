<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>메인</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<body>
	<h1>개인정보 추가</h1>
	<form action="<c:url value="/admin/insertUser"/>" method="post" id="form">
		<div class="form-group">
			<label for="id">아이디:</label>
			<input type="text" class="form-control" id="id" name="me_id">
		</div>
		<div class="form-group">
			<label for="name">이름:</label>
			<input type="text" class="form-control" id="name" name="me_name">
		</div>
		<div class="form-group">
			<label for="email">이메일:</label>
			<input type="text" class="form-control" id="email" name="me_email">
		</div>
		<div class="form-group">
			<label for="major">전공:</label>
			<select id="major" name="major">
				<c:forEach items="${list }" var="major">
					<option value="">선택하세요</option>
					<option value="${major.ma_num }">${major.ma_name }</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
		    <label for="authority">권한:</label>
		    <select id="authority" name="me_authority">
		        <option value="">선택하세요</option>
		        <option value="Student">학생</option>
		        <option value="Admin">관리자</option>
		        <option value="Professor">교수</option>
		    </select>
		</div>	
		<button type="submit" class="btn btn-outline-success col-12">개인정보 추가</button>
	</form>
</body>
</body>
</html>