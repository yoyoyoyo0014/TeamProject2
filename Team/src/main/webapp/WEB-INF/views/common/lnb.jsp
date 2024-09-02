<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%-- lnb 메뉴 --%>
	<div class="lnb_wrap">
		<div class="user_info_wrap">
			<div class="user_info_group">
				<i class="ic_student"></i>
				<!-- <i class="ic_professor"></i>
				<i class="ic_admin"></i> -->
				<div class="user_info_text">
					<span>사용자1</span>님 환영합니다.
				</div>
			</div>
			<a href="<c:url value="/logout"/>" class="logout">
				<i class="ic_logout"></i>
				<span class="blind">로그아웃</span>
			</a>
		</div>
	
		<nav class="lnb">
			<ul class="lnb_group">
				<%-- 학생 메뉴 --%>
				<c:if test="${user.me_authority == 'STUDENT'}">
					<li class="lnb_item">
						<a href="<c:url value="/student/subjectlist"/>" class="lnb_link">
							<i class="ic_subject"></i>
							<span>과목조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/"/>" class="lnb_link">
							<i class="ic_class"></i>
							<span>수강신청</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/student/gradelist"/>" class="lnb_link">
							<i class="ic_grade"></i>
							<span>성적조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/"/>" class="lnb_link">
							<i class="ic_user-modify"></i>
							<span>개인정보수정</span>
						</a>
					</li>
				</c:if>
				<%-- 학생 메뉴 --%>
				
				
				
				<%-- 교수 메뉴 --%>
				<c:if test="${user.me_authority == 'PROFESSOR'}">
					<li class="lnb_item">
						<a href="<c:url value="/professor/subjectlist"/>" class="lnb_link">
							<i class="ic_subject"></i>
							<span>과목조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/professor/lecturelist"/>" class="lnb_link">
							<i class="ic_lecture"></i>
							<span>강의조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/"/>" class="lnb_link">
							<i class="ic_user-modify"></i>
							<span>개인정보수정</span>
						</a>
					</li>
				</c:if>
				<%-- 교수 메뉴 --%>
				
				
				
				<%-- 관리자 메뉴 --%>
				<c:if test="${user.me_authority == 'ADMIN'}">
					<li class="lnb_item">
						<a href="<c:url value="/admin/subjectlist"/>" class="lnb_link">
							<i class="ic_subject"></i>
							<span>과목조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/"/>" class="lnb_link">
							<i class="ic_lecture"></i>
							<span>강의조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/admin/gradelist"/>" class="lnb_link">
							<i class="ic_grade"></i>
							<span>성적조회</span>
						</a>
					</li>
					<li class="lnb_item">
						<a href="<c:url value="/"/>" class="lnb_link">
							<i class="ic_people"></i>
							<span>회원등록</span>
						</a>
					</li>
				</c:if>
				<%-- 관리자 메뉴 --%>
				
				
				
				<%-- 공통 메뉴 --%>
				<li class="lnb_item">
					<a href="<c:url value="/notice/list"/>" class="lnb_link">
						<i class="ic_notice"></i>
						<span>공지사항</span>
					</a>
				</li>
				<%-- 공통 메뉴 --%>
				
			</ul>
		</nav>
	
		<div class="lnb_ft_logo_wrap">
			<h1 class="main_logo">
				<a class="kh_ft_logo" title="KH UNIVERSITY LOGO" href="<c:url value="/main"/>"></a>
			</h1>
		</div>
	</div>