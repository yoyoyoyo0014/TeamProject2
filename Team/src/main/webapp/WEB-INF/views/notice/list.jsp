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

	<div class="layout">
		<%-- lnb 메뉴 --%>
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
		
		<div class="main_layout">
			<%-- 헤더 --%>
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			
			<div class="main_container">
				<div class="container-fluid">
					<h1 class="mb-3">공지사항 목록</h1>
					<form class="input-group mb-3" action="<c:url value="/notice/list"/>">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search" value="${pm.cri.search}" style="z-index:0;">
						<div class="input-group-append">
							<button type="submit" class="btn btn-success" style="z-index:1;">검색</button>
						</div>
					</form>					
					<table class="table">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: auto;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
						</colgroup>
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
											<c:url var="url" value="/notice/detail">
												<c:param name="page" value="${pm.cri.page}"/>
												<c:param name="search" value="${pm.cri.search}"/>
												<c:param name="no_num" value="${notice.no_num}"/>
											</c:url>
											<a href="${url}">${notice.no_title}</a>
										</td>
										<td>${notice.member.me_name}</td>
										<td>
											<fmt:formatDate value="${notice.no_date}" pattern="yyyy-MM-dd"/>
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
					
					<div class="ft_info_wrap d-flex justify-content-between">
						<div class="ft_info_left_wrap">
						</div>
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
						
						<div class="ft_info_right_wrap">
							<c:if test="${user.me_authority == 'ADMIN'}">
								<a href="<c:url value="/notice/insert"/>" class="btn btn-outline-primary">공지사항 등록</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>