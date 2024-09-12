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
<title>비밀번호 변경</title>
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
					<span class="breadCrumb_item">비밀번호 변경</span>
				</div>
			</header>
			
			<div class="main_container">
				<div class="container">
					<h1 class="mt-3">비밀번호 변경</h1>
					<c:if test="${user ne null}">
						<form action="<c:url value="/student/changepw"/>" method="post" id="form">
							<div class="form-group">
					  			<label for="pw">현재 비밀번호</label>
					  			<input type="password" class="form-control" id="me_pw" name="me_pw" placeholder="비밀번호를 입력하세요.">
							</div>
							<div class="form-group">
					  			<label for="newPw">변경할 비밀번호</label>
					  			<input type="password" class="form-control" id="newPw" name="newPw" placeholder="비밀번호를 입력하세요.">
							</div>
							<div class="form-group">
					  			<label for="newPw2">변경할 비밀번호 확인</label>
					  			<input type="password" class="form-control" id="newPw2" name="newPw2" placeholder="비밀번호를 입력하세요.">
							</div>
							<div class="text-right">
								<button type="submit" class="btn btn-outline-warning">비밀번호 변경</button>
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
				newPw : {
					required : true,
					regex : /^[a-zA-Z0-9!@#$]{4,15}$/
				},
				newPw2 : {
					equalTo : newPw
				}
			},
			messages : {
				me_pw : {
					required : '필수 항목입니다.',
					regex : '비밀번호는 영어, 숫자, 특수문자(!@#$)만 가능하며, 4~15자이어야 합니다.'
				},
				newPw : {
					required : '필수 항목입니다.',
					regex : '비밀번호는 영어, 숫자, 특수문자(!@#$)만 가능하며, 4~15자이어야 합니다.'
				},
				newPw2 : {
					equalTo : '변경할 비밀번호와 일치하지 않습니다.'
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