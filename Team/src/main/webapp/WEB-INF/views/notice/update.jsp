<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<title>공지사항 수정</title>
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
					<span class="breadCrumb_item">공지사항 수정</span>
				</div>
			</header>
			
			<div class="main_container">
				<div class="container">
					<h1 class="">공지사항 수정</h1>
					<form action="<c:url value="/notice/update"/>" method="post">
						<input type="hidden" name="no_num" value="${notice.no_num}">
						<div class="form-group">
				  			<label for="title">제목</label>
				  			<input type="text" class="form-control" id="title" name="no_title" value="${notice.no_title}" placeholder="제목을 입력하세요.">
						</div>
						<div class="form-group">
				  			<label for="content">내용</label>
				  			<textarea class="form-control" id="content" name="no_content">${notice.no_content}</textarea>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-outline-warning">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#content').summernote({
			placeholder: '내용을 입력하세요.',
			tabsize: 2,
			height: 400
		});
	</script>
	
</body>
</html>