<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>편하게 오피스 작업을! EasyWay!</title>


</head>
<body>
					<form action="projectpostregister?projectBoardId=1"
						method="post">
							<div>
								<input type="hidden" name="projectId" value="${projectId }">
								제목 : <input type="text" name="projectPostTitle"><br>
								내용 : <input type="text" name="projectPostContent"><br>
								첨부파일 : <input type="text" name="projectPostFilePath"><br>
							</div>
							<input type="submit" class="btn btn-primary" value="등록">
							<input type="reset" value="취소">
					</form>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

	
</html>