# Online Examination System

This is a Java-based online examination system project designed for educational institutions or enterprise internal training assessment scenarios. The system provides core functionalities such as user login, question bank management, exam records, and score statistics, implemented using the MVC architecture combined with Servlet and FreeMarker template engine.

## Project Structure Overview

- **`DBUtil.java`**: Database connection utility class for obtaining database connections.
- **`LoginServlet.java`**: Handles user login requests.
- **`LogoutServlet.java`**: Handles user logout requests.
- **`AuthFilter.java`**: Authentication filter to intercept access from unauthenticated users.

### Core Model Classes

- **`ExamQuestion`**: Entity class for exam questions, including fields such as question text, options, answer, and score.
- **`ExamScore`**: Entity class for exam scores, including fields such as student ID, name, and total score.
- **`Student`**: Entity class for student information, including student ID and name.

### System Functional Pages

- **Login and Logout**: Users log in to access the system and log out after completing an exam.
- **Question Bank Management**: Supports create, read, update, and delete (CRUD) operations for questions.
- **Exam Records**: Records答题情况 and scores for each exam session.
- **Score Statistics**: Displays student exam score data.
- **User Management**: Allows administrators to manage user accounts.
- **System Settings**: Provides system-level configurations such as themes, plugins, and caching.

## Technology Stack

- **Backend**: Java Servlet + JDBC
- **Frontend**: HTML + CSS + Bootstrap + AdminLTE
- **Template Engine**: FreeMarker
- **Database**: MySQL (configured in `jdbc.properties`)
- **Build Tool**: Maven (`pom.xml`)
- **Configuration Files**: Spring (`applicationContext.xml`), Shiro (`context-shiro.xml`), Ehcache (`ehcache.xml`), etc.

## System Screenshots

- **Homepage**: Displays core functional modules.
- **Question Bank Management**: Provides CRUD operations for questions.
- **Exam Record Viewing**: View historical exam records.
- **Score Statistics Page**: Displays exam scores in chart or list format.
- **User Management Interface**: Administrators can manage user accounts.
- **Theme and Plugin Settings**: Supports custom themes and third-party plugin configurations (e.g., GitHub, Weibo login).

## Installation and Deployment

### 1. Environment Requirements

- JDK 1.8 or higher
- Maven 3.x
- Tomcat 8.x or Jetty 9.x
- MySQL 5.7 or higher

### 2. Database Configuration

Modify the database connection information in `src/main/resources/jdbc.properties`:

```properties
url=jdbc:mysql://localhost:3306/examdb
username=root
password=yourpassword
```

### 3. Build the Project

Use Maven to build the project:

```bash
mvn clean package
```

After building, deploy the generated `.war` file to Tomcat or Jetty.

### 4. Start the Server

Copy the `target/onlineexamsystem.war` file to Tomcat's `webapps` directory and start Tomcat:

```bash
cd /path/to/tomcat/bin
./startup.sh
```

Access the system:

```
http://localhost:8080/onlineexamsystem
```

## Usage Instructions

- **Admin Login**: Access the backend management page to perform operations such as question bank management, user management, and exam record viewing.
- **Student Exam**: Students can take online exams after logging in.
- **Score Viewing**: After the exam, the system automatically grades and displays the results.

## Extensibility

- **Plugin System**: Supports third-party logins (GitHub, Weibo, OSChina), SMS services (Aliyun DaYu), and storage services (local, FTP).
- **Workflow Engine**: Supports configuring exam workflows via the `flowdefine` and `flow` modules.
- **Theme System**: Supports switching frontend themes (located in `src/main/webapp/WEB-INF/ftl/theme/` directory).

## Contribution Guidelines

Contributions to code or documentation are welcome. Please follow these steps:

1. Fork the project repository
2. Create a new branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push the branch (`git push origin feature/new-feature`)
5. Submit a Pull Request

## Open Source License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For any questions, please submit an Issue or contact the author:

- Gitee Homepage: [https://gitee.com/lizhien518](https://gitee.com/lizhien518)