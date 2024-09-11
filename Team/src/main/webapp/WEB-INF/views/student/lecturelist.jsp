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
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
		<div class="main_layout">
		
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			
			<div class="main_container">
				<div class="container-fluid">
					<h1 class="mb-3">강의 목록</h1>
					
					<form action="<c:url value="/student/lecturelist"/>">
							<div class="input-group mb-3">
								<input type="text" name="search" class="form-control" placeholder="검색어를 입력하세요." value="${pm.cri.search}">
								<div class="input-group-append">
									<button class="btn btn-success" type="submit">검색</button>
								</div>
							</div>
						</form>
						
					<table class="table">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: auto;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th>연도</th>
								<th>학기</th>
								<th>강의명</th>
								<th>강의시간</th>
								<th>강의실</th>
								<th>수강신청</th> 
							</tr>
						</thead>
						<tbody>
							<c:forEach var="lecture" items="${list}">
								<tr>
									<td>${lecture.le_year}</td>
									<td>${lecture.le_semester}</td>
									<td>${lecture.subject.su_name}</td>
									<td>${lecture.le_schedule}</td>
									<td>${lecture.le_room}</td>
									<td>
										<c:if test="${!lecture.takeClass}">
											<a href="<c:url value="/student/courseRegistration?co_le_num=${lecture.le_num}&co_me_id=${user_id}"/>" 
													type="button" class="btn btn-success">수강신청</a>
										</c:if>
										<c:if test="${lecture.takeClass}">
											<a href="<c:url value="/student/courseRegistration?co_le_num=${lecture.le_num}&co_me_id=${user_id}"/>" 
													type="button" class="btn btn-success disabled">수강신청</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			
			
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item">
							<c:url var="url" value="/student/lecturelist">
								<c:param name="page" value="${pm.startPage-1}"/>
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
							<c:url var="url" value="/student/lecturelist">
								<c:param name="page" value="${i}"/>
								<c:param name="search" value="${pm.cri.search}"/>
							</c:url>
							<a class="page-link" href="${url}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item">
							<c:url var="url" value="/student/lecturelist">
								<c:param name="page" value="${pm.endPage+1}"/>
								<c:param name="search" value="${pm.cri.search}"/>
							</c:url>
							<a class="page-link" href="${url}">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
</body>
</html>