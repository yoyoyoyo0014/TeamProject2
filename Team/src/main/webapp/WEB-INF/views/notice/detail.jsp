<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>공지사항 조회</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="container">
		<h1 class="mt-3">공지사항 상세</h1>
		<c:if test="${notice != null}">
			<div class="form-group">
				<label>제목 : </label>
				<div class="form-control">${notice.no_title}</div>
			</div>
			<div class="form-group">
				<label>작성자 : </label>
				<div class="form-control">${notice.member.me_name}</div>
			</div>
			<div class="form-group">
				<label>작성일 : </label>
				<div class="form-control"><fmt:formatDate value="${notice.no_date}" pattern="yyyy.MM.dd."/></div>
			</div>
			<div class="form-group">
				<label>조회수</label>
				<div class="form-control">${notice.no_view}</div>
			</div>
			<div class="form-group">
				<label>내용</label>
				<div class="form-control" style="min-height: 400px; height: auto">${notice.no_content}</div>
			</div>
		</c:if>
		<c:if test="${notice == null}">
			<h3>삭제되거나 등록되지 않은 게시글입니다.</h3>
		</c:if>
		<c:url var="url" value="/notice/list">
			<c:param name="search" value="${search}"/>
			<c:param name="page" value="${page}"/>
		</c:url>
		<a href="${url}" class="btn btn-outline-info">목록</a>
	</div>
</body>
</html>