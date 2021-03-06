<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav>

	<!-- sidebar -->
	<div class="nav-bar"	style="width: 230px;">
		
		<!-- 로고 -->
		<a href="/office/main" class="logo-a">
			<span class="fs-4">
				<img alt="LOGO" src="/resources/image/EASYWAY_SYMBOL60.png">
				<span class="office-name">${sessionScope.nowOfficeInfo.officeName}</span>
			</span>
		</a>
		
		<!-- 전 사원 메뉴 -->
		<ul class="nav nav-all nav-pills flex-column mb-auto">
			<li>
				<a href="/notice/noticelist" class="nav-link link-dark"> 
					<i class="nav-element fas fa-bullhorn"></i>
					<span class="nav-element">공지사항</span>
				</a>
			</li>
			<li>
				<a href="/attendance/attendancemain" class="nav-link link-dark">
					<i class="nav-element fas fa-briefcase"></i>
					<span class="nav-element">근태관리</span>
				</a>
			</li>
			<li>
				<a href="/sign/signmain" class="nav-link link-dark">
					<i class="nav-element fas fa-file-signature"></i>
					<span class="nav-element">전자결재</span>
				</a>
			</li>
			<li>
				<a href="/project/projectlist" class="nav-link link-dark">
					<i class="nav-element fas fa-users"></i>
					<span class="nav-element">프로젝트</span>
				</a>
			</li>
			<li>
				<a href="/schedule/schedulemain" class="nav-link link-dark">
					<i class="nav-element fas fa-calendar-alt"></i>
					<span class="nav-element">캘린더</span>
				</a>
			</li>
		</ul> <!-- end all-member-menu -->
		
	<sec:authentication property="principal" var="principal" />
	<sec:authorize access="isAuthenticated()">
		<c:set var="auth" value="ROLE_ADMIN" />
		<c:choose>
			<c:when test="${principal.member.memberAuth == auth}">
			<!-- 관리자 전용 메뉴 -->
			<ul class="nav nav-manager nav-pills flex-column mb-auto">
				<li>
					<a href="/office/admin/officesetting/vacationsetting" class="nav-link link-dark"> 
						<i class="nav-element fas fa-id-card"></i>
						<span class="nav-element">오피스 설정</span>
					</a>
				</li>
				<li>
					<a href="/office/admin/management/employeemanagement" class="nav-link link-dark">
						<i class="nav-element fas fa-users-cog"></i>
						<span class="nav-element">임직원 관리</span>
					</a>
				</li>
			</ul> <!-- end manager-menu -->
			</c:when>
		</c:choose>
	</sec:authorize>		
		<!-- 사이드바 하단 : 오피스로 돌아가기,  -->
		<ul class="nav nav-footer nav-pills flex-column mb-auto">
			<li>
				<a href="/office/officelist" class="nav-link link-dark"> 
					<i class="nav-element far fa-building"></i>
					<span class="nav-element">오피스로 돌아가기</span>
				</a>
			</li>
			<li>
				<form action="/member/logout" method="post" accept-charset="utf-8">
					<a href="" class="nav-link link-dark">
						<i class="nav-element fas fa-power-off"></i>
						<input type="submit" class="nav-element log-out" value="로그아웃" />
						<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					</a>
				</form>
			</li>
		</ul> <!-- end manager-menu -->
		
		
	</div> <!-- end sidebar -->

</nav>
