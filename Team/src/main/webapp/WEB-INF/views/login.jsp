<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>

<title>로그인</title>
</head>
<body>
	<div class="login_container">
		<h1 class="kh_logo">KH UNIVERSITY</h1>
		<div class="login_bg"></div>
		<div class="login_group">
			<div class="login_wrap">
				<h3 class="h3 kh_title">KH UNIVERSITY</h3>
				<form action="<c:url value="/" />" method="post" class="form_wrap">
					<div class="form-group">
						<label for="me_id" class="form-text-label">학번</label>
						<div class="form_input_item">
							<i class="ic_login_person"></i>
							<input type="text" name="me_id" value="" id="me_id" placeholder="학번을 입력해주세요." maxlength="9">
						</div>
					</div>
					<div class="form-group mb-3">
					    <label for="me_pw" class="form-text-label">비밀번호</label>
					    <div class="form_input_item">
							<i class="ic_password"></i>
							<input type="password" name="me_pw" value="" id="me_pw" placeholder="비밀번호를 입력해주세요.">
							<button type="button" class="btn btn_invisible">
								<i class="ic_invisible"></i>
							</button>
					    </div>
					</div>
					<div class="form-group form-check">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox"> 로그인 상태 유지
						</label>
						<div>
							<a href="#" class="forget_pw_link">비밀번호 찾기</a>
						</div>
					</div>
					<div class="btn_wrap">
						<button type="submit" class="btn btn-warning btn_login">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>