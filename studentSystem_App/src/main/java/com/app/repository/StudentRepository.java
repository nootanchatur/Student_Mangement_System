package com.app.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.app.model.Student;
@Repository
public interface StudentRepository extends CrudRepository<Student, Integer>{
public List<Student>findAllByBatchNumber(String batchNumber);
Student findByStudentFullNameAndPassword(String studentFullName, String password);
List<Student> findByRollno(int rollno);
boolean existsByRollnoAndDate(int rollno, LocalDate date);

}