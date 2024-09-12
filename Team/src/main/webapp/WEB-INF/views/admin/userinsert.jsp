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
<title>회원 등록</title>
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
					<span class="breadCrumb_item">회원 등록</span>
				</div>
			</header>
			
			<div class="main_container">
				<div class="container">
					<h1 class="">회원 등록</h1>
					
					<form action="<c:url value="/admin/userinsert"/>" method="post" id="form">
						<div class="form-group">
				  			<label for="id">학번:</label>
				  			<input type="text" class="form-control" name="me_id">
						</div>
						<div class="form-group">
				  			<label for="name">이름:</label>
				  			<input type="text" class="form-control" name="me_name">
						</div>
						<div class="form-group">
				  			<label for="email">이메일:</label>
				  			<input type="text" class="form-control" name="me_email">
						</div>
						<div class="form-group">
							<label for="major">전공:</label>
							<select class="form-control" id="major" name="major">
								<c:forEach items="${list }" var="major">
									<c:if test="${major.ma_name ne \"교양\" }">
										<option value="${major.ma_num }">${major.ma_name}(전공번호:${major.ma_num})</option>
									</c:if>
								</c:forEach>
									<option value="700">[교수]:교양(전공번호:700)</option>
									<option value="001">[행정]:관리자(행정번호:001)</option>
							</select>
						</div>
						<div class="form-group">
							<label for="authority">권한:</label>
							<select class="form-control" id="authority" name="me_authority">
								<option value="STUDENT">학생</option>
								<option value="PROFESSOR">교수</option>
								<option value="ADMIN">관리자</option>
							</select>
						</div>
						<div class="text-right">												
							<button type="submit" class="btn btn-outline-primary">등록</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$('#form').validate({
			rules : {
				me_id : {
					required : true,
					regex : /^\d{8}$/,
					matchMajor : true,
					matchYear : true
				},
				me_name : {
					required : true					
				},
				me_email : {
					required : true,
					email : true
				},
				me_authority : {
					matchAuthority : true
				}
			},
			messages : {
				me_id : {
					required : '필수 항목입니다.',
					regex : '학번은 \'숫자\'로만 이루어져야 하며 규칙에 따른 8글자만 가능합니다.',
					matchMajor: '학번의 3번째부터 5번째까지의 숫자와 전공 번호가 일치해야 합니다.',
					matchYear: '학번의 앞 두 글자는 현재 연도와 일치해야 합니다.'
				},
				me_name : {
					required : '필수 항목입니다.'
				},
				me_email : {
					required : '필수 항목입니다.',
					email : 'email 형식이 아닙니다'
				},
				me_authority : {
					matchAuthority : '선택한 전공에 맞는 권한을 선택해야 합니다.'
				}
			},
			submitHandler : function(form){
				form.submit();
			}
			});
		$.validator.addMethod('regex', function(value, element, regex){
			var re = new RegExp(regex);
			return this.optional(element) || re.test(value);
		}, "정규표현식을 확인하세요.");	
		
		$.validator.addMethod('matchMajor', function(value, element){
			var meIdPart = value.substring(2, 5); // 3번째부터 5번째까지 추출
			var selectedMajor = $('#major').val(); // 선택한 전공의 값
			return meIdPart === selectedMajor; // 전공과 학번 부분이 같은지 비교
		}, "학번의 3번째부터 5번째까지의 숫자와 전공 번호가 일치해야 합니다.");
		
		$.validator.addMethod('matchAuthority', function(value, element){
			var selectedMajor = $('#major').val(); // 선택한 전공
			var selectedAuthority = $('#authority').val(); // 선택한 권한
			
			// 전공에 따른 권한 검증
			if (selectedMajor === '700' && selectedAuthority !== 'PROFESSOR') { // [교수] : 교양
				return false;
			}
			if (selectedMajor === '001' && selectedAuthority !== 'ADMIN') { // [행정] : 관리자
				return false;
			}
			return true;
		}, "선택한 전공에 맞는 권한을 선택해야 합니다.");
		
		$.validator.addMethod('matchYear', function(value, element){
			var currentYear = new Date().getFullYear().toString().substring(2, 4); // 현재 연도의 마지막 두 자리 (예: 2024 -> "24")
			var inputYear = value.substring(0, 2); // 학번의 앞 두 자리
			return inputYear === currentYear; // 앞 두 자리가 현재 연도와 같은지 비교
		}, "학번의 앞 두 글자는 현재 연도와 일치해야 합니다.");
	</script>
</body>
</html>