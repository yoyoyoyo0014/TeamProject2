<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>강의 목록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
	<h1>강의 목록</h1>
	
	<form action="<c:url value="/professor/lecturelist"/>">
			<div class="input-group mb-3">
				<select class="form-control" name="type">
					<option value="all"    <c:if test="${pm.cri.type == 'all'}">selected</c:if>>전체</option>
					<option value="className"    <c:if test="${pm.cri.type == 'className'}">selected</c:if>>강의명</option>
					<option value="year"   <c:if test="${pm.cri.type == 'year'}">selected</c:if>>연도</option>
					<option value="semester" <c:if test="${pm.cri.type == 'semester'}">selected</c:if>>학기</option>
					<option value="classsTime"    <c:if test="${pm.cri.type == 'classTime'}">selected</c:if>>강의시간</option>
					<option value="classRoom"    <c:if test="${pm.cri.type == 'classRoom'}">selected</c:if>>강의실</option>
				</select>
				<input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search }">
				<div class="input-group-append">
					<button type="submit" class="btn btn-outline-info col-12">검색</button>
				</div>
			</div>
		</form>
		
	<table class="table">
		<thead>
			<tr>
				<th>연도</th>
				<th>학기</th>
				<th>강의명</th>
				<th>강의시간</th>
				<th>강의실</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="lecture" items="${list}">
				<tr>
					<td>${lecture.le_year}</td>
					<td>${lecture.le_semester}</td>
					<td>
						<a href="<c:url value="/admin/studentlist?le_num=${lecture.le_num}&su_name=${lecture.subject.su_name}"/>">${lecture.subject.su_name}</a>
					</td>
					<td>${lecture.le_schedule}</td>
					<td>${lecture.le_room}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<a type="button" class="btn btn-outline-success">추가</a>

<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<c:url var="url" value="/professor/lecturelist">
					<c:param name="me_id" value="${pm.cri.me_id}"/>
					<c:param name="page" value="${pm.startPage-1}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
				</c:url>
				<a class="page-link" href="${url}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage }" var="i">
			<c:choose>
				<c:when test="${pm.cri.page == i}">
					<c:set var="active" value="active"/>
				</c:when>
				<c:otherwise>
					<c:set var="active" value=""/>
				</c:otherwise>
			</c:choose>
			<li class="page-item ${active}">
				<c:url var="url" value="/professor/lecturelist">
					<c:param name="me_id" value="${pm.cri.me_id}"/>
					<c:param name="page" value="${i}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
				</c:url>
				<a class="page-link" href="${url}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<c:url var="url" value="/professor/lecturelist">
					<c:param name="me_id" value="${pm.cri.me_id}"/>
					<c:param name="page" value="${pm.endPage+1}"/>
					<c:param name="type" value="${pm.cri.type}"/>
					<c:param name="search" value="${pm.cri.search}"/>
				</c:url>
				<a class="page-link" href="${url}">다음</a>
			</li>
		</c:if>
	</ul>
	
	
</body>
</html>