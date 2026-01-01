<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>在线考试系统 - 登录</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css"/>

    <script>
        function checkForm(){
            const no = document.getElementById("studentNo").value.trim();
            const name = document.getElementById("studentName").value.trim();
            if(!no || !name){
                alert("请填写完整信息");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<nav class="navbar bg-white border-bottom">
    <div class="container">
        <span class="navbar-brand text-primary fw-bold">Online Exam</span>
        <span class="text-muted">Web 开发课程设计</span>
    </div>
</nav>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-12 col-md-7 col-lg-5">
            <div class="card p-4 p-md-5">
                <h3 class="mb-1">考生登录</h3>
                <div class="text-muted mb-3">请输入学号与姓名进入考试系统</div>

                <% String err = request.getParameter("error");
                    if ("1".equals(err)) { %>
                <div class="alert alert-danger" role="alert">
                    学号或姓名错误，请重试
                </div>
                <% } %>

                <!-- 如果你用 doLogin.jsp：保持这一行 -->
                <form action="${pageContext.request.contextPath}/doLogin.jsp" method="post" onsubmit="return checkForm();">
                    <!-- 如果你用 LoginServlet(/login)：把上面 action 改为下面这一行 -->
                    <!-- <form action="${pageContext.request.contextPath}/login" method="post" onsubmit="return checkForm();"> -->

                    <div class="mb-3">
                        <label class="form-label">学号</label>
                        <input class="form-control" id="studentNo" name="studentNo" placeholder="例如：20250001" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">姓名</label>
                        <input class="form-control" id="studentName" name="studentName" placeholder="例如：张三" required>
                    </div>

                    <button class="btn btn-primary w-100 py-2" type="submit">登录</button>

                    <div class="mt-3 text-center">
                        <small class="text-muted">示例账号：20250001 / 张三</small>
                    </div>
                </form>
            </div>

            <div class="text-center mt-3">
                <small class="text-muted">© 2026 Online Exam System</small>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
