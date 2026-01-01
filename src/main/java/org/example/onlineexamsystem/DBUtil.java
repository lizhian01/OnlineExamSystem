package org.example.onlineexamsystem;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    // 改成你的实际配置
    private static final String URL =
            "jdbc:mysql://localhost:3306/exam?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() throws Exception {
        // MySQL 8 推荐这个驱动类（不写也通常能自动加载，但写上更稳）
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
