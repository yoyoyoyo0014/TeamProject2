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

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container-fluid py-3" style="min-height: calc(100vh - 112px);">
	<h1 class="mb-3">과목 관리 페이지</h1>
	<form action="<c:url value="/admin/subjectinsert" />" method="post">
		<div class="form-group">
			<label for="su_status">전공</label>
			<select class="form-control" name="su_ma_num">
				<c:forEach items="${suMaNumList}" var="su_ma">
					<option value="${su_ma.su_ma_num}">${su_ma.su_ma_num}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="su_status">전공여부</label>
			<select class="form-control" name="su_status">
				<c:forEach items="${statusList}" var="su">
					<option value="${su.su_status}">${su.su_status}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="su_name">과목명</label>
			<input type="text" class="form-control" id="su_name" name="su_name" placeholder="과목명을 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="su_name">시수</label>
			<input type="number" class="form-control" id="su_name" name="su_time" placeholder="과목명을 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="su_name">학점</label>
			<input type="number" class="form-control" id="su_name" name="su_point" placeholder="과목명을 입력해주세요.">
		</div>
		<div>
			<button type="submit" class="btn btn-outline-primary">등록</button>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>