package model;

public class Student {
    private int studentId;
    private String studentName;

    // Constructors, Getters and Setters
    public Student(int studentId, String studentName) {
        this.studentId = studentId;
        this.studentName = studentName;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getStudentName() {
        return studentName;
    }
}
