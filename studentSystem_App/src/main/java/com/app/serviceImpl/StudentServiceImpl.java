package com.app.serviceImpl;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.model.Student;
import com.app.repository.StudentRepository;
import com.app.serviceI.StudentServiceI;
@Service
public class StudentServiceImpl  implements StudentServiceI{
@Autowired
StudentRepository sr;
	@Override
	public void saveStudent(Student s) {
		sr.save(s);
	}
	@Override
	public List<Student> getAllStudents() {
		return (List<Student>) sr.findAll();
	}
	@Override
	public List<Student> serchStudentsByBatch(String batchNumber) {
		return sr.findAllByBatchNumber(batchNumber);
	}
	@Override
	public Student getSingleStudent(int rollno) {
		
		Optional<Student>opStudent=sr.findById(rollno);
		
		return opStudent.get();
	}
	@Override
	public void updateStudentFees(int rollno, float amount) {
Optional<Student>opStudent=sr.findById(rollno);
Student st=opStudent.get();
st.setFeesPaid(st.getFeesPaid()+amount);
sr.save(st);
	}
	@Override
	public void updateStudentBatch(int rollno, String batchNumber) {
		    Student st = sr.findById(rollno).orElse(null);
		    if (st != null) {
		        st.setBatchNumber(batchNumber);
		        sr.save(st);
		    }
		}
	@Override
	public void deleteStudentById(int rollno) {
		    sr.deleteById(rollno);
		
		
	}
	@Override
	public Student getStudentByUsernameAndPassword(String username, String password) {
	    return sr.findByStudentFullNameAndPassword(username, password);
	}
	@Override
    public void submitAttendance(Student s) {
        s.setDate(LocalDate.now());
        s.setStatus("Present");
        sr.save(s);
    }

    @Override
    public boolean isAttendanceSubmitted(int rollno) {
        return sr.existsByRollnoAndDate(rollno, LocalDate.now());
    }
    
    @Override
    public void saveLecture(Student lecture) {
        sr.save(lecture);
    }

    @Override
    public List<Student> getLecturesByBatch(String batchNumber) {
        return sr.findAllByBatchNumber(batchNumber);
    }

    @Override
    public List<Student> getAllLectures() {
        return (List<Student>) sr.findAll();
    }
}
	


