package com.app.serviceI;

import java.util.List;

import com.app.model.Student;

public interface StudentServiceI {

public	void saveStudent(Student s);
public List<Student>getAllStudents();
public List<Student>serchStudentsByBatch(String batchNumber);
public Student getSingleStudent(int rollno);
public void updateStudentFees(int rollno, float amount);
public void updateStudentBatch(int rollno, String batchNumber);
public void deleteStudentById(int rollno);
Student getStudentByUsernameAndPassword(String username, String password);
void submitAttendance(Student s);
boolean isAttendanceSubmitted(int rollno);
void saveLecture(Student lecture);
List<Student> getLecturesByBatch(String batchNumber);
List<Student> getAllLectures();
}
