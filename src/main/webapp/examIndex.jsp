<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.onlineexamsystem.bean.Student" %>
<%
  Student s = (Student) session.getAttribute("student");
  if (s == null) { response.sendRedirect(request.getContextPath()+"/login.jsp"); return; }
%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>考试首页</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css"/>
</head>
<body>
<nav class="navbar bg-white border-bottom">
  <div class="container">
    <span class="navbar-brand text-primary">Online Exam</span>
    <div class="d-flex align-items-center gap-2">
      <span class="badge bg-light text-dark">学号：<%= s.getStudentNo() %></span>
      <span class="badge bg-light text-dark">姓名：<%= s.getStudentName() %></span>
      <a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/logout">退出</a>
    </div>
  </div>
</nav>

<div class="container py-5">
  <div class="row g-4">
    <div class="col-12 col-lg-7">
      <div class="card p-4">
        <h4 class="mb-2">考试须知</h4>
        <ul class="mb-0">
          <li>考试时长：20 分钟（到时自动交卷）</li>
          <li>题型：单选题 10 题，每题 10 分，总分 100 分</li>
          <li>请在倒计时结束前提交试卷</li>
        </ul>
      </div>
    </div>

    <div class="col-12 col-lg-5">
      <div class="card p-4">
        <h4 class="mb-2">准备好了吗？</h4>
        <p class="text-muted mb-3">点击开始考试，系统将进入答题页面并开始计时。</p>
        <a class="btn btn-primary w-100 py-2" href="${pageContext.request.contextPath}/exam.jsp">开始考试</a>
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
