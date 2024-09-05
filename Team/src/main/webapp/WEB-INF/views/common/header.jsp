<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="navbar-brand" href="<c:url value="/main"/>">Home</a>
		</li>
		<c:if test="${user.me_authority == 'STUDENT'}">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/"/>">과목조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/student/lecturelist"/>">수강신청</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/student/gradelist"/>">성적조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/"/>">개인정보수정</a>
			</li>
		</c:if>
		<c:if test="${user.me_authority == 'PROFESSOR'}">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/"/>">과목조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/professor/lecturelist"/>">강의조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/"/>">개인정보수정</a>
			</li>
		</c:if>
		<c:if test="${user.me_authority == 'ADMIN'}">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/"/>">과목조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/admin/lecturelist"/>">강의조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/admin/gradelist"/>">성적조회</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value="/"/>">회원등록</a>
			</li>
		</c:if>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value="/logout"/>">로그아웃</a>
		</li>
	</ul>
	
</nav>

</body>
</html>