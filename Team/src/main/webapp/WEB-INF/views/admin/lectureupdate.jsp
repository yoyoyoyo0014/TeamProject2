<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>강의 수정</title>
</head>
<body>

	<div class="layout">
		<jsp:include page="/WEB-INF/views/common/lnb.jsp"/>
			<div class="main_layout">
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
				<div class="main_container">
					<div class="container-fluid">
					<h1 class = "mb-3">강의 수정</h1>
					<form action="<c:url value="/admin/lectureupdate"/>" method ="post">
						<input  type = "hidden" id ="num" name = "le_num" value ="${lec.le_num }">
						<label class ="mt-3" for="room" class = "m">강의실:</label>
						<input type="text" class="form-control" id="room" name="le_room" value="${lec.le_room}"  placeholder ="강의실 입력헤주세요. 예) A관 104호">
						<label class ="mt-3" for="schedule">강의시간:</label>
						<input type="text" class="form-control" id="schedule" name="le_schedule" value="${lec.le_schedule}" placeholder ="강의시간을 입력헤주세요. 예) 월 1,2,3교시">
						<label class ="mt-3" for="semester">학기:</label>
						<select  class="form-control" id="semester" name="le_semester">
						
							<c:if test="${lec.le_semester.equals('1학기')}">
								<option value="1학기" selected>1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름방학">여름방학</option>
							</c:if>
							<c:if test="${lec.le_semester.equals('2학기')}">
								<option value="1학기" >1학기</option>
								<option value="2학기" selected>2학기</option>
								<option value="여름방학">여름방학</option>
							</c:if>
							<c:if test="${lec.le_semester.equals('여름방학')}">
								<option value="1학기">1학기</option>
								<option value="2학기">2학기</option>
								<option value="여름방학" selected>여름방학</option>
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
</html>