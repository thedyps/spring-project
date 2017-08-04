<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
<h1 id="title"><a href="<c:url value='/'/>">SMARTCOM</a></h1>
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-topmenu-collapse" >
					<span class="sr-only">네비게이션 확장</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="<c:url value='?pcType=${pcType}'/>" class="navbar-brand">${pcType} 컴퓨터</a>
			</div>
			<div class="collapse navbar-collapse navbar-topmenu-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='?pcType=Basic'/>">기본</a></li>
					<li><a href="<c:url value='?pcType=Office'/>">사무</a></li>
					<li><a href="<c:url value='?pcType=Middle'/>">중급</a></li>
					<li><a href="<c:url value='?pcType=Game'/>">게임</a></li>
					<li><a href="<c:url value='?pcType=3D'/>">3D 작업</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
				<c:if test="${authInfo eq null}">
					<li><a href="<c:url value='/login'/>"> 로그인 </a></li>
					<li><a href="<c:url value='/register/step1'/>"> 회원가입 </a></li>
				</c:if>
				<c:if test="${authInfo ne null}">
					<li><a class="disabled" role="presentation"><span class="label label-success login-success">${authInfo.name}님 환영합니다.</span></a></li>
					<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
				</c:if>
				</ul>
			</div>
		</div>
	</nav>
</div>
