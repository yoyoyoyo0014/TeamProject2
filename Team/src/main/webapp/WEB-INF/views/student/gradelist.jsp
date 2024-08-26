<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>성적조회</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
  <h1>성적 조회</h1>
	<form action="<c:url value="/student/gradelist"/>" method="post">
		<div class="form-group">
			<label for="year">연도:</label>
			<select id="yearSelect" name="year">
			</select>
			
			<label for="semester">학기:</label>
			<select id="semesterSelect" name="semester">
			</select>
			
			<button type="submit" class="btn btn-primary">조회</button>
		</div>
	</form>
	
	<table class="table">
		<thead>
			<tr>
				<th>연도</th>
				<th>학기</th>
				<th>과목</th>
				<th>학점</th>
				<th>성적</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list != null}">
				<c:set var="totalPoints" value="0" />
				<c:set var="totalCredits" value="0" />
				<c:forEach var="grade" items="${list}">
					<tr>
						<td>${grade.le_year}</td>
						<td>${grade.le_semester}</td>
						<td>${grade.su_name}</td>
						<td>${grade.su_point}</td>
						<td>${grade.co_grade}</td>
					</tr>
					<c:set var="gradeValue" value="0" />
						<c:choose>
							<c:when test="${grade.co_grade == 'A+'}"><c:set var="gradeValue" value="4.5" /></c:when>
							<c:when test="${grade.co_grade == 'A'}"><c:set var="gradeValue" value="4.0" /></c:when>
							<c:when test="${grade.co_grade == 'B+'}"><c:set var="gradeValue" value="3.5" /></c:when>
							<c:when test="${grade.co_grade == 'B'}"><c:set var="gradeValue" value="3.0" /></c:when>
							<c:when test="${grade.co_grade == 'C+'}"><c:set var="gradeValue" value="2.5" /></c:when>
							<c:when test="${grade.co_grade == 'C'}"><c:set var="gradeValue" value="2.0" /></c:when>
							<c:when test="${grade.co_grade == 'D+'}"><c:set var="gradeValue" value="1.5" /></c:when>
							<c:when test="${grade.co_grade == 'D'}"><c:set var="gradeValue" value="1.0" /></c:when>
							<c:when test="${grade.co_grade == 'F'}"><c:set var="gradeValue" value="0.0" /></c:when>
						</c:choose>
					<c:set var="totalPoints" value="${totalPoints + (grade.su_point * gradeValue)}" />
					<c:set var="totalCredits" value="${totalCredits + grade.su_point}" />
				</c:forEach>
			</c:if>
			<c:if test="${list == null}">
				<tr>
					<td colspan="5">조회할 성적을 선택하세요.</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="4">총 평점</th>
				<th>
					<c:if test="${totalCredits != 0}">
						${totalPoints / totalCredits}
					</c:if>
				</th>
			</tr>
		</tfoot>
		
	</table>
</div>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    const yearSelect = document.getElementById("yearSelect");
    const semesterSelect = document.getElementById("semesterSelect");

    const uniqueYears = new Set();
    const uniqueSemesters = new Set();

    <c:forEach var="grade" items="${list}">
        uniqueYears.add("${grade.le_year}");
        uniqueSemesters.add("${grade.le_semester}");
    </c:forEach>;

    uniqueYears.forEach(year => {
        const option = document.createElement("option");
        option.value = year;
        option.textContent = year;
        yearSelect.appendChild(option);
    });

    uniqueSemesters.forEach(semester => {
        const option = document.createElement("option");
        option.value = semester;
        option.textContent = semester;
        semesterSelect.appendChild(option);
    });
});
</script>

</body>
</html>