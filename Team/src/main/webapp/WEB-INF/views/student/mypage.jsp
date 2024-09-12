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
<style type="text/css">
	.error{color : red;}
</style>
<title>개인정보수정</title>
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
					<h1 class="mt-3">개인정보수정</h1>
					<c:if test="${user ne null}">
						<form action="<c:url value="/student/mypage"/>" method="post" id="form">
							<div class="form-group">
					  			<label for="id">학번:</label>
					  			<input type="text" class="form-control" id="me_id" name="me_id" readonly value="${user.me_id}">
							</div>
							<div class="form-group">
					  			<label for="pw">현재 비밀번호:</label>
					  			<input type="password" class="form-control" id="me_pw" name="me_pw">
					  			<a class="btn btn-outline-danger col-12" href="<c:url value="/student/changepw"/>">비밀번호 변경</a>
							</div>
							<div class="form-group">
					  			<label for="name">이름:</label>
					  			<input type="text" class="form-control" id="me_name" name="me_name" value="${user.me_name}">
							</div>
							<div class="form-group">
					  			<label for="email">이메일:</label>
					  			<input type="text" class="form-control" id="me_email" name="me_email" value="${user.me_email}">
							</div>												
							<button type="submit" class="btn btn-outline-info col-12">수정</button>
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