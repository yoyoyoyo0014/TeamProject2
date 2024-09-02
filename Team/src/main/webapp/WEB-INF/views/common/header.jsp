<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
</head>
<body>
	<%-- 메인 헤더 --%>
	<header class="kh_header">
		<div class="breadCrumb_wrap">
			<span class="breadCrumb_item">KH UNIVERSITY</span>
			<span class="breadCrumb_item">메인</span>
			<span class="breadCrumb_item">과목조회</span>
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

</body>
</html>