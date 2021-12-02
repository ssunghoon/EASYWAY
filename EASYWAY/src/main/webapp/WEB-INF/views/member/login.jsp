<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>편하게 오피스 작업을! EasyWay!</title>

<!-- 부트스트랩 -->
<link rel="canonical"
   href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/log_in.css" rel="stylesheet">
</head>
<body class="text-center">

   <main class="form-signin"> <img
      src="/resources/image/EASYWAY_SYMBOL60.png" style="margin-bottom: 30px" />
   <form action="/login" method="post" accept-charset="utf-8">
      <h1 class="h3 mb-3 fw-normal">Easyway Log-in</h1>

      <div class="form-floating">
         <input type="email" class="form-control" id="floatingInput"
            name="username" placeholder="name@example.com">
            <label for="floatingInput">Email address</label> 
            
      </div>
      <div class="form-floating">
         <input type="password" class="form-control" id="floatingPassword"
            name="password" placeholder="Password"> <label
            for="floatingPassword">Password</label>
      </div>
      <button class="w-100 btn btn-lg" type="submit">Login</button>
      </div>
      <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
   </form>

   <div id="register">
      <span>아직 회원이 아니신가요? </span> <a href="/member/register">회원가입</a>
   </div>

   </main>

</body>
</html>