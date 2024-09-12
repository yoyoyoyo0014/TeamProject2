<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
<title>개인정보 수정</title>
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
					<span class="breadCrumb_item">개인정보 수정</span>
				</div>
			</header>
			
			<div class="main_container">
				<div class="container">
					<h1 class="">개인정보 수정</h1>
					<c:if test="${user ne null}">
						<form action="<c:url value="/professor/mypage"/>" method="post" id="form">
							<div class="form-group">
					  			<label for="id">학번</label>
					  			<input type="text" class="form-control" id="me_id" name="me_id" readonly value="${user.me_id}">
							</div>
							<div class="form-group">
					  			<label for="pw">현재 비밀번호</label>
					  			<div class="d-flex align-items-center">
						  			<input type="password" class="form-control" id="me_pw" name="me_pw">
						  			<a class="btn btn-outline-danger ml-2" href="<c:url value="/professor/changepw"/>">비밀번호 변경</a>
					  			</div>
					  			<label id="me_pw-error" class="error" for="me_pw" style="display: none;">필수 항목입니다.</label>
							</div>
							<div class="form-group">
					  			<label for="name">이름</label>
					  			<input type="text" class="form-control" id="me_name" name="me_name" value="${user.me_name}">
							</div>
							<div class="form-group">
					  			<label for="email">이메일</label>
					  			<input type="text" class="form-control" id="me_email" name="me_email" value="${user.me_email}">
							</div>
							<div class="text-right">
								<button type="submit" class="btn btn-outline-warning">수정</button>
							</div>
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$('#form').validate({
			rules : {
				me_pw : {
					required : true,
					regex : /^[a-zA-Z0-9!@#$]{4,15}$/
				},
				me_name : {
					required : true					
				},
				me_email : {
					required : true,
					email : true
				}
			},
			messages : {
				me_pw : {
					required : '필수 항목입니다.',
					regex : '비밀번호는 영어, 숫자, 특수문자(!@#$)만 가능하며, 4~15자이어야 합니다.'
				},
				me_name : {
					required : '필수 항목입니다.',
				},
				me_email : {
					required : '필수 항목입니다.',
					email : 'email 형식이 아닙니다'
				}
			},
			submitHandler : function(){
				return true;
			}
			});
		$.validator.addMethod('regex', function(value, element, regex){
			var re = new RegExp(regex);
			return this.optional(element) || re.test(value);
		}, "정규표현식을 확인하세요.");	
	</script>
</body>
</html>