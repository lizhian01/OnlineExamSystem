<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.example.onlineexamsystem.DBUtil" %>
<%@ page import="org.example.onlineexamsystem.bean.Student" %>
<%
  request.setCharacterEncoding("UTF-8");
  String studentNo = request.getParameter("studentNo");
  String studentName = request.getParameter("studentName");

  boolean ok = false;

  String sql = "SELECT 1 FROM student WHERE studentNo=? AND studentName=? LIMIT 1";
  try (Connection conn = DBUtil.getConnection();
       PreparedStatement ps = conn.prepareStatement(sql)) {

    ps.setString(1, studentNo);
    ps.setString(2, studentName);
    try (ResultSet rs = ps.executeQuery()) {
      ok = rs.next();
    }
  } catch (Exception e) {
    e.printStackTrace();
  }

  if (ok) {
    session.setAttribute("student", new Student(studentNo, studentName));
    response.sendRedirect(request.getContextPath() + "/examIndex.jsp");
  } else {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
  }
%>
