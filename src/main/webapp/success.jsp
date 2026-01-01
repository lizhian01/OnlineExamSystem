<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>成功</title></head>
<body>
<h2>登录成功</h2>
<p>当前用户：<%= session.getAttribute("username") %></p>
</body>
</html>
