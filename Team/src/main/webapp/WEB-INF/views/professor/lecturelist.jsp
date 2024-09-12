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
			<%-- 메인 헤더 --%>
			<header class="kh_header">
				<button type="button" class="sidebar_menu js-sidebar_menu"><i class="ic_sidebar"></i><span class="blind">햄버거 메뉴</span></button>
				<div class="breadCrumb_wrap">
					<span class="breadCrumb_item">KH UNIVERSITY</span>
					<!-- <span class="breadCrumb_item">메인</span> -->
					<span class="breadCrumb_item">공지사항</span>
				</div>
			</header>
			
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