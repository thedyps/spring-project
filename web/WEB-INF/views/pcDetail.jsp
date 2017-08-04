<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${pcType} 컴퓨터 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/common.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/pcDetail.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/fonts/fonts.css" />">
  </head>
  <body>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>	
    <script src="<c:url value="/resources/js/pcDetail.js" />"></script>   
    <header>
		<tiles:insertAttribute name="top" />
	</header>
	<section>
		<tiles:insertAttribute name="center" />
	</section>
	<footer>
		<tiles:insertAttribute name="bottom" />
	</footer>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>
</html>