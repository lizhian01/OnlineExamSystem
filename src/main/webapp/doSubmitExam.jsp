<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.example.onlineexamsystem.DBUtil" %>
<%@ page import="org.example.onlineexamsystem.bean.Student" %>
<%@ page import="org.example.onlineexamsystem.bean.ExamScore" %>
<%
  request.setCharacterEncoding("UTF-8");
  Student s = (Student) session.getAttribute("student");
  if (s == null) { response.sendRedirect(request.getContextPath()+"/login.jsp"); return; }

  int total = 0;

  // 取正确答案
  Map<Integer, String> ans = new HashMap<>();
  Map<Integer, Integer> scoreMap = new HashMap<>();

  String qsql = "SELECT id, answer, score FROM exam_question ORDER BY id LIMIT 10";
  try (Connection conn = DBUtil.getConnection();
       PreparedStatement ps = conn.prepareStatement(qsql);
       ResultSet rs = ps.executeQuery()) {
    while (rs.next()) {
      int id = rs.getInt("id");
      ans.put(id, rs.getString("answer"));
      scoreMap.put(id, rs.getInt("score"));
    }

    for (Integer id : ans.keySet()) {
      String userAns = request.getParameter("q_" + id);
      if (userAns != null && userAns.equalsIgnoreCase(ans.get(id))) {
        total += scoreMap.get(id);
      }
    }

    // 成绩入库
    String isql = "INSERT INTO exam_score(studentNo, studentName, totalScore) VALUES(?,?,?)";
    try (PreparedStatement ips = conn.prepareStatement(isql)) {
      ips.setString(1, s.getStudentNo());
      ips.setString(2, s.getStudentName());
      ips.setInt(3, total);
      ips.executeUpdate();
    }

  } catch (Exception e) { e.printStackTrace(); }

  ExamScore score = new ExamScore(s.getStudentNo(), s.getStudentName(), total);
  session.setAttribute("score", score);
  response.sendRedirect(request.getContextPath() + "/score.jsp");
%>
