<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.example.onlineexamsystem.DBUtil" %>
<%@ page import="org.example.onlineexamsystem.bean.ExamQuestion" %>
<%@ page import="org.example.onlineexamsystem.bean.Student" %>
<%
  Student s = (Student) session.getAttribute("student");
  if (s == null) { response.sendRedirect(request.getContextPath()+"/login.jsp"); return; }

  List<ExamQuestion> list = new ArrayList<>();
  String sql = "SELECT id,title,optionA,optionB,optionC,optionD,answer,score FROM exam_question ORDER BY id LIMIT 10";
  try (Connection conn = DBUtil.getConnection();
       PreparedStatement ps = conn.prepareStatement(sql);
       ResultSet rs = ps.executeQuery()) {
    while (rs.next()) {
      ExamQuestion q = new ExamQuestion();
      q.setId(rs.getInt("id"));
      q.setTitle(rs.getString("title"));
      q.setOptionA(rs.getString("optionA"));
      q.setOptionB(rs.getString("optionB"));
      q.setOptionC(rs.getString("optionC"));
      q.setOptionD(rs.getString("optionD"));
      q.setAnswer(rs.getString("answer"));
      q.setScore(rs.getInt("score"));
      list.add(q);
    }
  } catch (Exception e) { e.printStackTrace(); }
%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>在线考试</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css"/>

  <style>
    /* 让底部提交栏不遮挡内容 */
    .page-pad { padding-bottom: 90px; }
    .sticky-submit {
      position: fixed;
      left: 0; right: 0; bottom: 0;
      background: rgba(255,255,255,.92);
      border-top: 1px solid rgba(0,0,0,.06);
      backdrop-filter: blur(8px);
      padding: 12px 0;
      z-index: 1000;
    }
  </style>

  <script>
    // 20分钟 = 1200秒
    let left = 20 * 60;

    function pad(n){ return n < 10 ? ("0" + n) : n; }

    function tick(){
      const m = Math.floor(left / 60);
      const s = left % 60;

      const timerEl = document.getElementById("timer");
      const timerHintEl = document.getElementById("timerHint");

      timerEl.innerText = pad(m) + ":" + pad(s);

      // 少于 60 秒提示变红
      if (left <= 60) {
        timerEl.classList.add("text-danger");
        timerHintEl.innerText = "即将结束，请尽快提交";
        timerHintEl.classList.remove("text-muted");
        timerHintEl.classList.add("text-danger");
      }

      if (left <= 0) {
        document.getElementById("examForm").submit();
        return;
      }
      left--;
      setTimeout(tick, 1000);
    }

    function confirmSubmit(){
      return confirm("确定提交试卷吗？提交后无法修改答案。");
    }

    window.onload = tick;
  </script>
</head>

<body>
<!-- 顶部导航 -->
<nav class="navbar bg-white border-bottom">
  <div class="container">
    <span class="navbar-brand text-primary">Online Exam</span>

    <div class="d-flex align-items-center gap-2">
      <span class="badge bg-light text-dark">学号：<%= s.getStudentNo() %></span>
      <span class="badge bg-light text-dark">姓名：<%= s.getStudentName() %></span>

      <span class="timer-pill">
        <span class="text-muted">剩余</span>
        <b id="timer">20:00</b>
      </span>
    </div>
  </div>
</nav>

<div class="container py-4 page-pad">
  <div class="row g-4">
    <!-- 左侧：说明/进度 -->
    <div class="col-12 col-lg-4">
      <div class="card p-4">
        <h5 class="mb-2">答题说明</h5>
        <ul class="mb-2">
          <li>单选题 <b><%= list.size() %></b> 题</li>
          <li>到时自动交卷</li>
          <li>建议每题至少选择一个选项</li>
        </ul>
        <small id="timerHint" class="text-muted">请合理安排时间</small>
      </div>

      <div class="card p-4 mt-3">
        <h6 class="mb-2">快速操作</h6>
        <div class="d-grid gap-2">
          <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/examIndex.jsp">返回首页</a>
          <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/logout">退出登录</a>
        </div>
      </div>
    </div>

    <!-- 右侧：题目 -->
    <div class="col-12 col-lg-8">
      <div class="card p-4">
        <div class="d-flex align-items-center justify-content-between">
          <h4 class="mb-0">试题答题</h4>
          <span class="badge bg-primary">单选题</span>
        </div>
        <hr/>

        <form id="examForm" action="${pageContext.request.contextPath}/doSubmitExam.jsp" method="post">
          <%
            for (ExamQuestion q : list) {
          %>
          <div class="question-card mb-3">
            <div class="d-flex justify-content-between align-items-start">
              <p class="mb-2">
                <b><%= q.getId() %>.</b> <%= q.getTitle() %>
              </p>
              <span class="badge bg-light text-dark"><%= q.getScore() %> 分</span>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" id="q<%= q.getId() %>A" value="A">
              <label class="form-check-label" for="q<%= q.getId() %>A">A. <%= q.getOptionA() %></label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" id="q<%= q.getId() %>B" value="B">
              <label class="form-check-label" for="q<%= q.getId() %>B">B. <%= q.getOptionB() %></label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" id="q<%= q.getId() %>C" value="C">
              <label class="form-check-label" for="q<%= q.getId() %>C">C. <%= q.getOptionC() %></label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="q_<%= q.getId() %>" id="q<%= q.getId() %>D" value="D">
              <label class="form-check-label" for="q<%= q.getId() %>D">D. <%= q.getOptionD() %></label>
            </div>
          </div>
          <% } %>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- 底部固定提交栏 -->
<div class="sticky-submit">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <div class="text-muted">
        已登录：<b><%= s.getStudentName() %></b>
      </div>
      <div class="d-flex gap-2">
        <button class="btn btn-outline-secondary" type="button"
                onclick="window.scrollTo({top:0, behavior:'smooth'});">
          回到顶部
        </button>
        <button class="btn btn-primary" type="button"
                onclick="if(confirmSubmit()) document.getElementById('examForm').submit();">
          提交试卷
        </button>
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
