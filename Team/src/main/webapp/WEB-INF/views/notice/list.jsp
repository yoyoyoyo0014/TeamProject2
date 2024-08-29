<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="container">
		<h1>공지사항 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list != null}">
					<c:forEach var="notice" items="${list}">
						<tr>
							<td>${notice.no_num}</td>
							<td>
								<a href="<c:url value="/notice/detail?no_num=${notice.no_num}"/>">${notice.no_title}</a>
							</td>
							<td>${notice.member.me_name}</td>
							<td>
								<fmt:formatDate value="${notice.no_date}" pattern="yyyy.MM.dd."/>
							</td>
							<td>${notice.no_view}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${list == null}">
					<tr>
						<td colspan="5">조회된 게시글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		
		<c:if test="${user.me_authority == 'ADMIN'}">
			<a href="<c:url value="/notice/insert"/>" class="btn btn-outline-info">공지사항 등록</a>
		</c:if>
		
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<c:url var="url" value="/notice">
					<c:param name="page" value="${pm.startPage - 1}"/>
					<c:param name="search" value="${pm.cri.search}"/>
				</c:url>
				<li class="page-item">
					<a class="page-link" href="${url}">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:url var="url" value="/notice/list">
					<c:param name="page" value="${i}"/>
					<c:param name="search" value="${pm.cri.search}"/>
				</c:url>
				<c:choose>
					<c:when test="${pm.cri.page eq i}">
						<c:set var="active" value="active"/>
					</c:when>
					<c:otherwise>
						<c:set var="active" value=""/>
					</c:otherwise>
				</c:choose>
				<li class="page-item ${active}">
					<a class="page-link" href="${url}">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<c:url var="url" value="/notice/list">
					<c:param name="page" value="${pm.endPage + 1}"/>
					<c:param name="search" value="${pm.cri.search}"/>
				</c:url>
				<li class="page-item">
					<a class="page-link" href="${url}">다음</a>
				</li>
			</c:if>
		</ul>
		<form action="<c:url value="/notice/list"/>">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control" placeholder="검색어" name="search">
				<div class="input-group-prepend">
					<button type="submit" class="btn btn-outline-info">검색</button>
				</div>
			</div>
		</form>		
	</div>
</body>
</html>