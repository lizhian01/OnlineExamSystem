package org.example.onlineexamsystem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 直接跳回登录页（也可以显示探针文本）
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean ok = false;

        // 如果你表名叫 t_user，这里改成：SELECT * FROM t_user ...
        String sql = "SELECT 1 FROM user WHERE username=? AND password=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                ok = rs.next();
            }

        } catch (Exception e) {
            // 出错先打印，便于你排查账号/库/驱动/时区等问题
            e.printStackTrace();
        }

        if (ok) {
            // 登录成功：可以先把用户名放 session 里
            request.getSession().setAttribute("username", username);
            response.sendRedirect(request.getContextPath() + "/success.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
        }
    }
}
