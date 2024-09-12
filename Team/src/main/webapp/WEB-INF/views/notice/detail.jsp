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

	<div class="layout">
		<%-- lnb 메뉴 --%>
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
		
		<div class="main_layout">
			<%-- 메인 헤더 --%>
			<header class="kh_header">
				<div class="breadCrumb_wrap">
					<span class="breadCrumb_item">KH UNIVERSITY</span>
					<!-- <span class="breadCrumb_item">메인</span> -->
					<span class="breadCrumb_item">공지사항</span>
				</div>
				<div class="search_wrap">
					<form class="search_group" action="/">
						<div class="search_bar_wrap">
							<input class="search_bar" id="search" type="text" placeholder="Search" name="search">
							<button class="btn btn_search p-0" type="submit">
								<i class="ic_search"></i>
								<span class="blind">검색</span>
							</button>
						</div>
					</form>
				</div>
			</header>
			
			<div class="main_container">
				<h1 class="mb-3">공지사항 상세</h1>
				<c:if test="${notice != null}">
					
					<div class="detail_group">
						<div class="detail_wrap">
							<div class="detail_main_title">${notice.no_title}</div>
						</div>
						<div class="detail_wrap flex33">
							<div class="d-flex">
								<span class="detail_title">작성자</span>
								<div class="detail_content">${notice.member.me_name}</div>
							</div>
							<div class="d-flex">
								<span class="detail_title">작성일</span>
								<div class="detail_content"><fmt:formatDate value="${notice.no_date}" pattern="yyyy-MM-dd" /></div>
							</div>
							<div class="d-flex">
								<span class="detail_title">조회수</span>
								<div class="detail_content">${notice.no_view}</div>
							</div>
						</div>
						<div class="detail_wrap">
							<span class="detail_title">내용</span>
							<div class="detail_content con_min_h">${notice.no_content}</div>
						</div>
					</div>
					
				</c:if>
				<c:if test="${notice == null}">
					<h3>삭제되거나 등록되지 않은 게시글입니다.</h3>
				</c:if>
				<c:url var="url" value="/notice/list">
					<c:param name="search" value="${search}"/>
					<c:param name="page" value="${page}"/>
				</c:url>
				<div class="btn_wrap">
					<div class="btn_left_wrap">
						<a href="${url}" class="btn btn-outline-dark">목록</a>
					</div>
					<div class="btn_right_wrap">
					<c:if test="${user.me_id == notice.no_me_id}">
						<a href="<c:url value="/notice/update?no_num=${notice.no_num}"/>" class="btn btn-outline-warning">수정</a>
						<a href="<c:url value="/notice/delete?no_num=${notice.no_num}"/>" class="btn btn-outline-danger">삭제</a>		
					</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>