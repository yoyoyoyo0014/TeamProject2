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

	<div class="layout">
		<%-- lnb 메뉴 --%>
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
		
		<div class="main_layout">
			<%-- 헤더 --%>
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			
			<div class="main_container">
				<div class="container-fluid">
					<h1>강의 목록</h1>
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
										<a href="<c:url value="/professor/studentlist?le_num=${lecture.le_num}&su_name=${lecture.subject.su_name}"/>">${lecture.subject.su_name}</a>
									</td>
									<td>${lecture.le_schedule}</td>
									<td>${lecture.le_room}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>