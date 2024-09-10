<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/WEB-INF/views/common/head.jsp"/>

<title>과목 수정</title>
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
					<h1 class="mb-3">과목 수정</h1>
					<form action="<c:url value="/admin/subjectupdate" />" method="post">
						<div class="form-group">
							<label for="su_status">전공</label>
							<select class="form-control" name="su_ma_num">
								<c:forEach items="${suMaNumList}" var="su_ma">
									<c:if test="${su_ma.su_ma_num eq su_ma_num}">
										<option value="${su_ma.ma_num}" selected="selected">${su_ma.ma_name}</option>
									</c:if>
									<c:if test="${su_ma.su_ma_num ne su_ma_num}">
										<option value="${su_ma.ma_num}">${su_ma.ma_name}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="su_status">전공여부</label>
							<select class="form-control" name="su_status">
								<c:forEach items="${statusList}" var="su">
									<c:if test="${su.su_status eq su_status}">
										<option value="${su.su_status}" selected="selected">${su.su_status}</option>
									</c:if>
									<c:if test="${su.su_status ne su_status}">
										<option value="${su.su_status}">${su.su_status}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="su_name">과목명</label>
							<c:forEach items="${subjectList}" var="su">
								<input type="hidden" id ="su_num" name="su_num" value ="${su.su_num}">
								<input type="text" class="form-control" id="su_name" name="su_name" placeholder="과목명을 입력해주세요." value="${su.su_name}">
							</c:forEach>
						</div>
						<div class="form-group">
							<label for="su_time">시수</label>
							<c:forEach items="${subjectList}" var="su">
								<input type="number" class="form-control" id="su_time" name="su_time" placeholder="시수을 입력해주세요. 1~10 사이만 입력 가능합니다." min="0" max="10" value="${su.su_time}">
							</c:forEach>
						</div>
						<div class="form-group">
							<label for="su_point">학점</label>
							<c:forEach items="${subjectList}" var="su">
							<input type="number" class="form-control" id="su_point" name="su_point" placeholder="학점을 입력해주세요. 1~10 사이만 입력 가능합니다." min="0" max="10" value="${su.su_point}">
							</c:forEach>
						</div>
						<div>
							<button type="submit" class="btn btn-outline-primary">수정</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	

</body>
</html>