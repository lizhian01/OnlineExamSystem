package org.example.onlineexamsystem.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // no-op
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String path = request.getRequestURI();
        String ctx = request.getContextPath();

        // 1) 放行：登录页、登录处理、退出、静态资源
        boolean allow =
                path.equals(ctx + "/") ||
                        path.equals(ctx + "/index.jsp") ||
                        path.equals(ctx + "/login.jsp") ||
                        path.equals(ctx + "/doLogin.jsp") ||   // ✅ 如果你用 doLogin.jsp 处理登录，必须放行
                        path.equals(ctx + "/login") ||         // ✅ 如果你用 LoginServlet 处理登录，也放行
                        path.equals(ctx + "/logout") ||
                        path.startsWith(ctx + "/css/") ||
                        path.startsWith(ctx + "/js/") ||
                        path.startsWith(ctx + "/images/")||
                        path.startsWith(ctx + "/assets/");


        if (allow) {
            chain.doFilter(req, resp);
            return;
        }

        // 2) 登录态判断：兼容你可能使用的不同 session key（避免 key 不一致导致一直被踢）
        HttpSession session = request.getSession(false);
        Object loginObj = null;
        if (session != null) {
            loginObj = session.getAttribute("user");
            if (loginObj == null) loginObj = session.getAttribute("username");
            if (loginObj == null) loginObj = session.getAttribute("student");
        }

        if (loginObj == null) {
            response.sendRedirect(ctx + "/login.jsp");
            return;
        }

        chain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
        // no-op
    }
}
