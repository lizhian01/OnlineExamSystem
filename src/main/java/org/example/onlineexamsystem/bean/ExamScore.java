package org.example.onlineexamsystem.bean;

public class ExamScore {
    private String studentNo;
    private String studentName;
    private int totalScore;

    public ExamScore() {}
    public ExamScore(String studentNo, String studentName, int totalScore) {
        this.studentNo = studentNo;
        this.studentName = studentName;
        this.totalScore = totalScore;
    }
    public String getStudentNo() { return studentNo; }
    public void setStudentNo(String studentNo) { this.studentNo = studentNo; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public int getTotalScore() { return totalScore; }
    public void setTotalScore(int totalScore) { this.totalScore = totalScore; }
}
