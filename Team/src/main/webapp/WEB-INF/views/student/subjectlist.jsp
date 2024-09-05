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

	<div class="layout">
		<%-- lnb 메뉴 --%>
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
		
		<div class="main_layout">
			<%-- 헤더 --%>
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			
			<div class="main_container">
				<div class="container-fluid">
					<h1 class="mb-3">과목 조회</h1>
					<%-- 검색창 --%>
					<form action="<c:url value="/student/subjectlist"/>">
						<div class="input-group mb-3">
							<input type="text" name="search" class="form-control" placeholder="검색어를 입력하세요.">
							<div class="input-group-append">
								<button class="btn btn-success" type="submit">검색</button>
							</div>
						</div>
					</form>
					
					<table class="table table-hover">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: auto;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 20%;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">과목명</th>
								<th scope="col">시수</th>
								<th scope="col">학점</th>
								<th scope="col">전공</th>
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
									<td>${suList.ma_name}</td>
									<td>${suList.su_status}</td>
								</tr>
							</c:forEach>
							<c:if test="${subjectList.size() == 0}">
								<tr>
									<th colspan="6" class="text-center">등록된 게시글이 없습니다.</th>
								</tr>
							</c:if>
						</tbody>
					 </table>
				
					<div class="ft_info_wrap d-flex justify-content-between">
						<div class="ft_info_left_wrap">
						</div>
						<c:if test="${pm.endPage ne 0}">
							<ul class="pagination justify-content-center mb-0">
								<c:if test="${!pm.prev}">
									<c:set var="prev" value="disabled"/>
								</c:if>
								<c:url var="url" value="/student/subjectlist">
									<c:param name="page" value="${pm.startPage - 1}"/>
									<c:param name="search" value="${pm.cri.search}"/>
								</c:url>
								<li class="page-item ${prev}">
									<a class="page-link" href="${url}">이전</a>
								</li>
								<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
									<c:if test="${pm.cri.page == i}">
										<c:set var="active" value="active"/>
									</c:if>
									<c:if test="${pm.cri.page != i}">
										<c:set var="active" value=""/>
									</c:if>
									<c:url var="url" value="/student/subjectlist">
										<c:param name="page" value="${i}"/>
										<c:param name="search" value="${pm.cri.search}"/>
									</c:url>
									<li class="page-item ${active}">
										<a class="page-link" href="${url}">${i}</a>
									</li>
								</c:forEach>
								<c:if test="${!pm.next}">
									<c:set var="next" value="disabled"/>
								</c:if>
								<c:url var="url" value="/student/subjectlist">
									<c:param name="page" value="${pm.endPage + 1}"/>
									<c:param name="search" value="${pm.cri.search}"/>
								</c:url>
								<li class="page-item ${next}">
									<a class="page-link" href="${url}">다음</a>
								</li>
							</ul>
						</c:if>
						<div class="ft_info_right_wrap">
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>