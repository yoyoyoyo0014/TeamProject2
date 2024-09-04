<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>메인</title>
</head>
<body>

	<div class="layout">
		<%-- lnb 메뉴 --%>
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
		
		<div class="main_layout">
			<%-- 헤더 --%>
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			
			<div class="main_container">
				<%-- 메인 코드 내용 여기 안에 넣기 --%>
				main content
				<%-- 메인 코드 내용 여기 안에 넣기 --%>
			</div>
		</div>
	</div>

</body>
</html>