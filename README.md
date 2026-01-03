# 在线考试系统

这是一个基于Java的在线考试系统项目，适用于教育机构或企业内部培训评估场景。系统提供了用户登录、题库管理、考试记录、成绩统计等核心功能，并采用MVC架构结合Servlet和FreeMarker模板引擎实现。

## 项目结构概览

- **`DBUtil.java`**：数据库连接工具类，用于获取数据库连接。
- **`LoginServlet.java`**：处理用户登录请求。
- **`LogoutServlet.java`**：处理用户登出请求。
- **`AuthFilter.java`**：认证过滤器，用于拦截未登录用户的访问。

### 核心模型类

- **`ExamQuestion`**：考试题目实体类，包含题干、选项、答案、分数等字段。
- **`ExamScore`**：考试成绩实体类，包含学号、姓名、总成绩等字段。
- **`Student`**：学生信息实体类，包含学号和姓名。

### 系统功能页面

- **登录与登出**：用户通过登录进入系统，考试结束后可登出。
- **题库管理**：支持题目的增删改查操作。
- **考试记录**：记录每次考试的答题情况和得分。
- **成绩统计**：展示学生的考试成绩数据。
- **用户管理**：支持管理员对用户账号进行管理。
- **系统设置**：提供主题、插件、缓存等系统级配置。

## 技术栈

- **后端**：Java Servlet + JDBC
- **前端**：HTML + CSS + Bootstrap + AdminLTE
- **模板引擎**：FreeMarker
- **数据库**：MySQL（配置在`jdbc.properties`中）
- **构建工具**：Maven（`pom.xml`）
- **配置文件**：Spring（`applicationContext.xml`）、Shiro（`context-shiro.xml`）、Ehcache（`ehcache.xml`）等

## 系统截图

- **首页**：展示核心功能模块。
- <img width="331" height="238" alt="image" src="https://github.com/user-attachments/assets/7f089236-ce14-44fc-beed-d643a46f7f98" />
- **考试题库管理**：提供题目的增删改查功能。
- <img width="486" height="356" alt="image" src="https://github.com/user-attachments/assets/29a89007-c8ba-421d-b634-6990eb960abe" />
<img width="328" height="439" alt="image" src="https://github.com/user-attachments/assets/7aeff239-d2b5-47ea-973c-c1b0813797d1" />
- **考试记录查看**：查看历史考试记录。
- <img width="486" height="214" alt="image" src="https://github.com/user-attachments/assets/f3a4d113-2075-43e2-bb57-17f068d75acf" />
- **成绩统计页面**：以图表或列表形式展示考试成绩。
- <img width="395" height="199" alt="image" src="https://github.com/user-attachments/assets/440cd3ef-44c2-4779-9fc3-c720695f02d8" />
- **用户管理界面**：管理员可管理用户账户。
- **主题与插件设置**：支持自定义主题和第三方插件配置（如GitHub、微博登录等）。

## 安装与部署

### 1. 环境要求

- JDK 1.8 或以上
- Maven 3.x
- Tomcat 8.x 或 Jetty 9.x
- MySQL 5.7 或以上

### 2. 数据库配置

修改 `src/main/resources/jdbc.properties` 文件中的数据库连接信息：

```properties
url=jdbc:mysql://localhost:3306/examdb
username=root
password=yourpassword
```

### 3. 构建项目

使用 Maven 构建项目：

```bash
mvn clean package
```

构建完成后，将生成的 `.war` 文件部署到 Tomcat 或 Jetty 中。

### 4. 启动服务器

将 `target/onlineexamsystem.war` 文件复制到 Tomcat 的 `webapps` 目录下，启动 Tomcat：

```bash
cd /path/to/tomcat/bin
./startup.sh
```

访问系统：

```
http://localhost:8080/onlineexamsystem
```

## 使用说明

- **管理员登录**：进入后台管理页面，可进行题库管理、用户管理、考试记录查看等操作。
- **学生考试**：学生登录后可参加在线考试。
- **成绩查看**：考试结束后，系统自动评分并显示成绩。

## 扩展性

- **插件系统**：支持第三方登录（GitHub、微博、OSChina）、短信服务（阿里大鱼）、存储服务（本地、FTP）等插件。
- **流程引擎**：支持通过 `flowdefine` 和 `flow` 模块配置考试流程。
- **主题系统**：支持切换前端主题（位于 `src/main/webapp/WEB-INF/ftl/theme/` 目录）。

## 贡献指南

欢迎贡献代码或改进文档。请遵循以下步骤：

1. Fork 项目仓库
2. 创建新分支 (`git checkout -b feature/new-feature`)
3. 提交更改 (`git commit -am 'Add new feature'`)
4. 推送分支 (`git push origin feature/new-feature`)
5. 提交 Pull Request

## 开源许可

本项目采用 MIT License。详见 `LICENSE` 文件。

## 联系方式

如有问题，请提交 Issue 或联系作者：

- Gitee 主页：[https://gitee.com/lizhien518](https://gitee.com/lizhien518)
