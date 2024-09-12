<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/WEB-INF/views/common/head.jsp"/>

<title>과목 추가</title>
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
					<span class="breadCrumb_item">공지사항</span>
				</div>
			</header>
			
			<div class="main_container">
				<div class="container-fluid">
					<h1 class="mb-3">과목 추가</h1>
					<form action="<c:url value="/admin/subjectinsert" />" method="post">
						<div class="form-group">
							<label for="su_status">전공</label>
							<select class="form-control" name="su_ma_num">
								<c:forEach items="${suMaNumList}" var="su_ma">
									<option value="${su_ma.ma_num}">${su_ma.ma_name}</option>
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
							<label for="su_time">시수</label>
							<input type="number" class="form-control" id="su_time" name="su_time" placeholder="시수을 입력해주세요. 1~10 사이만 입력 가능합니다." min="0" max="10">
						</div>
						<div class="form-group">
							<label for="su_point">학점</label>
							<input type="number" class="form-control" id="su_point" name="su_point" placeholder="학점을 입력해주세요. 1~10 사이만 입력 가능합니다." min="0" max="10">
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