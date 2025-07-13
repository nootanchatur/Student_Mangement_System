package com.app.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
private int rollno;
private String studentFullName;
private String studentEmail;
private int studentAge;
private String studentCollageName;
private double feesPaid;
private String studentCourse;
private String batchMode;
private String batchNumber;
private String password;
private LocalDate date;
private String status; // Present/Absent
private String teacher;
private String dayOfWeek;
private String timeSlot;
private String subject;

public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getTeacher() {
	return teacher;
}
public void setTeacher(String teacher) {
	this.teacher = teacher;
}
public String getDayOfWeek() {
	return dayOfWeek;
}
public void setDayOfWeek(String dayOfWeek) {
	this.dayOfWeek = dayOfWeek;
}
public String getTimeSlot() {
	return timeSlot;
}
public void setTimeSlot(String timeSlot) {
	this.timeSlot = timeSlot;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public LocalDate getDate() {
	return date;
}
public void setDate(LocalDate date) {
	this.date = date;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getRollno() {
	return rollno;
}
public void setRollno(int rollno) {
	this.rollno = rollno;
}
public String getStudentFullName() {
	return studentFullName;
}
public void setStudentFullName(String studentFullName) {
	this.studentFullName = studentFullName;
}
public String getStudentEmail() {
	return studentEmail;
}
public void setStudentEmail(String studentEmail) {
	this.studentEmail = studentEmail;
}
public int getStudentAge() {
	return studentAge;
}
public void setStudentAge(int studentAge) {
	this.studentAge = studentAge;
}
public String getStudentCollageName() {
	return studentCollageName;
}
public void setStudentCollageName(String studentCollageName) {
	this.studentCollageName = studentCollageName;
}
public double getFeesPaid() {
	return feesPaid;
}
public void setFeesPaid(double feesPaid) {
	this.feesPaid = feesPaid;
}
public String getStudentCourse() {
	return studentCourse;
}
public void setStudentCourse(String studentCourse) {
	this.studentCourse = studentCourse;
}
public String getBatchMode() {
	return batchMode;
}
public void setBatchMode(String batchMode) {
	this.batchMode = batchMode;
}
public String getBatchNumber() {
	return batchNumber;
}
public void setBatchNumber(String batchNumber) {
	this.batchNumber = batchNumber;
}
public static void saveLecture(Student lecture) {
	// TODO Auto-generated method stub
	
}


}
