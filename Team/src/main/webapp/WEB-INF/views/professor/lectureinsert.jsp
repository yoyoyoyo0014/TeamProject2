<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/WEB-INF/views/common/head.jsp"/>

<title>강의개설</title>
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
				<h1 class="mb-3">과목 관리 페이지</h1>
				<form action="<c:url value="/professor/lectureinsert" />" method="post">
					<div class="form-group">
						<label for="su_name">과목명</label>
						<select class="form-control" name="su_num" id="su_name">
							<c:forEach items="${subjectList}" var="su">
								<option value="${su.su_num}">${su.su_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="le_room">강의실</label>
						<input type="text" name="le_room" id="le_room" class="form-control" placeholder="강의실을 입력해주세요. 예) A관 104호">
					</div>
					<div class="form-group">
						<label for="le_schedule">강의 시간</label>
						<input type="text" name="le_schedule" id="le_schedule" class="form-control" placeholder="강의 시간을 입력해주세요. 예) 월 1,2,3교시">
					</div>
					<div class="form-group">
						<label for="le_year">강의 년도</label>
						<select class="form-control" name="le_year" id="le_year">
							<option value="2025">2025</option>
							<option value="2024">2024</option>
						</select>
					</div>
					<div class="form-group">
						<label for="le_semester">강의 학기</label>
						<select class="form-control" name="le_semester">
							<option value="1학기">1학기</option>
							<option value="2학기">2학기</option>
							<option value="여름방학">여름방학</option>
							<option value="겨울방학">겨울방학</option>
						</select>
					</div>
					<div>
						<button type="submit" class="btn btn-outline-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>