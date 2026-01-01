package org.example.onlineexamsystem.bean;

public class Student {
    private String studentNo;
    private String studentName;

    public Student() {}
    public Student(String studentNo, String studentName) {
        this.studentNo = studentNo;
        this.studentName = studentName;
    }
    public String getStudentNo() { return studentNo; }
    public void setStudentNo(String studentNo) { this.studentNo = studentNo; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
}
