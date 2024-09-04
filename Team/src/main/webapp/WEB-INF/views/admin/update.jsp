<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<title>개인정보 수정</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<h2>개인정보 수정</h2>

<c:choose>
    <c:when test="${not empty user}">
        <form action="<c:url value='/admin/update'/>" method="post">
            <input type="hidden" name="me_id" value="${user.me_id}"/>

            <div>
                <label for="me_name">이름:</label>
                <input type="text" id="me_name" name="me_name" value="${user.me_name}" required/>
            </div>

            <div>
                <label for="me_pw">비밀번호:</label>
                <input type="password" id="me_pw" name="me_pw" placeholder="새 비밀번호 (변경하려면 입력)" />
            </div>

            <div>
                <label for="me_email">이메일:</label>
                <input type="email" id="me_email" name="me_email" value="${user.me_email}" required/>
            </div>

            <div>
                <button type="submit">수정</button>
                <a href="<c:url value='/admin/update'/>">취소</a>
            </div>
        </form>
    </c:when>
    <c:otherwise>
        <p>사용자 정보가 없습니다. 로그인 후 다시 시도해 주세요.</p>
    </c:otherwise>
</c:choose>

</body>
</html>