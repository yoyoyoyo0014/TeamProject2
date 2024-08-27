<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/WEB-INF/views/common/head.jsp"/>

<title>커뮤니티</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid py-3" style="min-height: calc(100vh - 112px);">
	<h1 class="mb-3">과목 목록</h1>
	
	<table class="table table-hover">
		<colgroup>
			<col style="width: 7%;">
			<col style="width: auto;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 15%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">과목명</th>
				<th scope="col">시수</th>
				<th scope="col">학점</th>
				<th scope="col">전공여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${subjectList}" var="suList">
				<tr>
					<td>${suList.su_num}</td>
					<td>${suList.su_name}</td>
					<td>${suList.su_time}시간</td>
					<td>${suList.su_point}학점</td>
					<td>${suList.su_status}</td>
				</tr>
			</c:forEach>
		</tbody>
	 </table>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>