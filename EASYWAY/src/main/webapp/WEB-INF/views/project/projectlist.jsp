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

<!--jQuery, Bootstrap, fontawesome 등 참고사항 -->
<!-- 주의! jQuery가 Bootstrap보다 위에 있어야 합니다.  -->
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="canonical"
   href="https://getbootstrap.com/docs/5.0/examples/sidebars/">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
   crossorigin="anonymous"></script>

<!-- EASYWAY CSS, JS -->
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/sidebars.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/project_list.css" rel="stylesheet">
<script src="/resources/js/menu.js"></script>

</head>
<body>
   <jsp:include page="../public/sidebar.jsp" />

   <div class="page-divider">
      <div class="sidebar-background"></div>


      <!-- 페이지 표현 부분 -------------------------------------------------------------------------->
      <div class="easyway-wrapper easyway-wrapper-p-list">
         <!--       <a href="projectInsertForm.do">프로젝트 생성</a> -->
         <button type="button" class="easyway-btn-p-list" data-bs-toggle="modal"
            data-bs-target="#staticBackdrop">프로젝트 생성</button>

         <!-- Modal -->
         <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
            data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <form action="projectcreate" method="post">
                  
                     <input type="hidden" id="token" name="${_csrf.parameterName}" data-token-name="${_csrf.headerName}" value="${_csrf.token}" />
                  
                     <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">프로젝트 생성</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                           aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <div>
                           프로젝트 이름 : <input type="text" name="projectName"><br>
                           시작일 : <input type="date" name="projectStart"><br>
                           종료일 : <input type="date" name="projectEnd"><br>
                           프로젝트 설명 <br>
                           <textarea rows="6" cols="50" name="projectContent"></textarea>
                           <br>
                           <!--                         <input type="submit" class="btn btn-primary mb-3" -->
                           <!--                            value="등록"> -->
                        </div>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                           data-bs-dismiss="modal">취소</button>
                        <input type="submit" class="btn btn-primary" value="등록">
                        <!--                      <button type="button" class="btn btn-primary">생성</button> -->
                     </div>
                  </form>
               </div>
            </div>
         </div>


         <table class="board-list" border="1">
            <tr>
               <th>프로젝트 명</th>
               <th>시작일</th>
               <th>종료일</th>
               <th>입장하기</th>
            </tr>
            <c:forEach var="project" items="${list}">
               <tr>
                  <td><a
                     href="projectboardlist?projectId=${project.projectId }">${project.projectName}</a></td>
                  <td><fmt:parseDate var="dt" value="${project.projectStart}"
                        pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${dt }"
                        pattern="yyyy/MM/dd" /></td>
                  <td><fmt:parseDate var="de" value="${project.projectEnd}"
                        pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate value="${de }"
                        pattern="yyyy/MM/dd" /></td>
                  <td><button class="easyway-btn"
                        onclick="location.href='projectboardlist?projectId=${project.projectId}'">입장하기</button></td>
               </tr>
            </c:forEach>
         </table>
         <br> <br>

      </div>
   </div>
   
</body>
</html>