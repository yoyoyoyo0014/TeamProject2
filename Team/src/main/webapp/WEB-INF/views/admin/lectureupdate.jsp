<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>강의 수정</title>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<style>
	.error{
			 color: red; 
	}
</style>

</head>
<body>

	<div class="layout">
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
					<h1 class = "mb-3">강의 수정</h1>
					<form action="<c:url value="/admin/lectureupdate"/>" method ="post" id = "form">
						<input  type = "hidden" id ="num" name = "le_num" value ="${lec.le_num }">
						<label class ="mt-3" for="room" class = "m">강의실:</label>
						<input type="text" class="form-control" id="room" name="le_room" value="${lec.le_room}"  placeholder ="강의실 입력헤주세요. 예) A관 104호">
						<br>
						<label class ="mt-3" for="schedule">강의시간:</label>
						<input type="text" class="form-control" id="schedule" name="le_schedule" value="${lec.le_schedule}" placeholder ="강의시간을 입력헤주세요. 예) 월 1,2,3교시">
						<br>
						<label class ="mt-3" for="year">연도:</label>
						<input type="number" class="form-control" id="year" name="le_year" value="${lec.le_year}" placeholder ="강의연도를 입력헤주세요. 예) 2024">
						<label class ="mt-3" for="semester">학기:</label>
						<select  class="form-control" id="semester" name="le_semester">
						
							<c:if test="${lec.le_semester.equals('1학기')}">
								<option value="1학기" selected>1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름방학">여름방학</option>
								<option value="겨울방학">겨울방학</option>
							</c:if>
							<c:if test="${lec.le_semester.equals('2학기')}">
								<option value="1학기" >1학기</option>
								<option value="2학기" selected>2학기</option>
								<option value="여름방학">여름방학</option>
								<option value="겨울방학">겨울방학</option>
							</c:if>
							<c:if test="${lec.le_semester.equals('여름방학')}">
								<option value="1학기">1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름방학" selected>여름방학</option>
								<option value="겨울방학">겨울방학</option>
							</c:if>
							<c:if test="${lec.le_semester.equals('겨울방학')}">
								<option value="1학기">1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름방학" >여름방학</option>
								<option value="겨울방학" selected>겨울방학</option>
							</c:if>
						</select>
						
						<label class ="mt-3" for = "subject">과목 이름</label>
						<select class="form-control lec-sub-list" name="le_subject" id = "subject">
							
							<c:forEach items="${list}" var="list">
								<c:if test="${list.su_num eq lec.le_su_num}">
									<option value="${list.su_num}" selected>${list.su_name}</option>
								</c:if>
								<c:if test="${list.su_num ne lec.le_su_num}">
									<option value="${list.su_num}">${list.su_name}</option>
								</c:if>
							</c:forEach>
						</select>
						<label class ="mt-3" for = "professor"> 교수 이름</label>
						<select class="form-control lec-sub-list" name="le_professor" id = "professor">
							<c:forEach items="${meList}" var="list">
							<c:if test="${list.me_id eq lec.le_me_id}">
								<option value="${list.me_id}" selected>${list.me_name }</option>
							</c:if>
								<c:if test="${list.me_id ne lec.le_me_id}">
								<option value="${list.me_id}">${list.me_name }</option>
								</c:if>
							</c:forEach>
						</select>
						<button type ="submit" class="btn btn-outline-info col-12 mb-3 mt-5" style ="height : 50px"> 강의 수정</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

	$('#form').validate({
		rules : {
			le_room : {
				required : true,
				regex : /[a-zA-Z가-힣ㄱ-ㅎ,-]+ *관 *\d+ *호/
			},
			le_schedule : {
				required : true,
				regex : /[월,화,수,목,금,토,일] *[0-9,0-9]+ *교시/
			}
		},
		messages : {
			le_room : {
				required : '필수 항목입니다.',
				regex : '규칙에 맞게 강의실을 입력헤주세요. 예) A관 104호'
			},
			le_schedule : {
				required : '필수 항목입니다.',
				regex : '규칙에 맞게 강의시간을 입력헤주세요. 예) 월 1,2,3교시'
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

</html>