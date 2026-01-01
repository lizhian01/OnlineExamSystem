<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.onlineexamsystem.bean.ExamScore" %>
<%
  ExamScore sc = (ExamScore) session.getAttribute("score");
  if (sc == null) { response.sendRedirect(request.getContextPath()+"/login.jsp"); return; }
  boolean pass = sc.getTotalScore() >= 60;
%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>成绩展示</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css"/>
</head>
<body>
<nav class="navbar bg-white border-bottom">
  <div class="container">
    <span class="navbar-brand text-primary">Online Exam</span>
    <a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/logout">返回登录</a>
  </div>
</nav>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-12 col-md-8 col-lg-6">
      <div class="card p-4 p-md-5">
        <h3 class="mb-3">考试结果</h3>

        <div class="d-flex flex-wrap gap-2 mb-3">
          <span class="badge bg-light text-dark">学号：<%= sc.getStudentNo() %></span>
          <span class="badge bg-light text-dark">姓名：<%= sc.getStudentName() %></span>
        </div>

        <div class="display-6 fw-bold mb-2"><%= sc.getTotalScore() %> 分</div>
        <div class="mb-4">
          <% if (pass) { %>
          <span class="badge bg-success">及格</span>
          <% } else { %>
          <span class="badge bg-danger">不及格</span>
          <% } %>
        </div>

        <a class="btn btn-primary w-100 py-2" href="${pageContext.request.contextPath}/examIndex.jsp">返回首页</a>
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
