package com.app.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.model.Student;
import com.app.serviceI.StudentServiceI;

@Controller
public class AdminController {
	@Autowired
	StudentServiceI ssi;
	
	@GetMapping("/")
public String prelogin()
{
return "login";	
}

	@GetMapping("/login")
	public String loginStudent(@RequestParam("username") String username,
	                           @RequestParam("password") String password,
	                           Model m) {

	    if (username.equals("ADMIN") && password.equals("admin")) {
	        List<Student> list = ssi.getAllStudents();
	        m.addAttribute("data", list);
	        return "AdminScreen";
	    }

	    // 🔑 Student Login
	    Student student = ssi.getStudentByUsernameAndPassword(username, password);
	    if (student != null) {
	        m.addAttribute("student", student);
	        //List<Student> st = ssi.getLecturesByBatch(student.getBatchNumber());
	       // m.addAttribute("lectureList", st);
	        List<Student> upcomingLectures = ssi.getLecturesByBatch(student.getBatchNumber());
	        m.addAttribute("upcomingLectures", upcomingLectures);

	        m.addAttribute("currentDate", java.time.LocalDate.now()
	                                  .format(java.time.format.DateTimeFormatter.ofPattern("dd-MM-yyyy")));

	        return "studentScreen"; // ➤ your JSP page for student dashboard
	    }

	    m.addAttribute("message", "Invalid username or password");
	    return "login";
	}

@PostMapping("/enroll_student")
public String saveStudent(@ModelAttribute Student s,Model m)
{ System.out.println("---------------Hiiiii");
System.out.println("✔ Received Password:"+s.getPassword());

	ssi.saveStudent(s);
	List<Student>list=ssi.getAllStudents();
	m.addAttribute("data",list);
	return "AdminScreen";
}
@RequestMapping("/search")
public String searchBatch(@RequestParam("batchNumber")String batchNumber,Model m )
{
List<Student>result=ssi.serchStudentsByBatch(batchNumber);
if(result.size()>0)
{
	m.addAttribute("data",result);
}else
{
	List<Student>list=ssi.getAllStudents();
	m.addAttribute("data",result);
m.addAttribute("message","No record availabe for this batchNumber" +batchNumber);
}
return"AdminScreen";
}

@RequestMapping("/fees")
public String onfees(@RequestParam(required = true) Integer rollno, Model m) {
System.out.println("hiiii.................");
	Student st=ssi.getSingleStudent(rollno);
	m.addAttribute("st",st);
	return"fees";
}

@RequestMapping("/payfees")
public String payfees(@RequestParam(required = true) Integer rollno,@RequestParam float amount,Model m)
{
	ssi.updateStudentFees(rollno,amount);
	List<Student>sts=ssi.getAllStudents();
	m.addAttribute("data",sts);
	return"AdminScreen";

}
@RequestMapping("/batch")
public String shiftBatch(@RequestParam int rollno, Model m) {
    Student st = ssi.getSingleStudent(rollno);
    m.addAttribute("st", st);
    return "shiftBatch";  // JSP page to select new batch
}

@PostMapping("/update_batch")
public String updateBatch(@RequestParam int rollno, @RequestParam String batchNumber, Model m) {
    ssi.updateStudentBatch(rollno, batchNumber);
    List<Student> list = ssi.getAllStudents();
    m.addAttribute("data", list);
    return "AdminScreen";
}
@RequestMapping("/remove")
public String removeStudent(@RequestParam int rollno, Model m) {
    ssi.deleteStudentById(rollno); // Make sure this method exists in your service
    List<Student> list = ssi.getAllStudents();
    m.addAttribute("data", list);
    return "AdminScreen";
}

@PostMapping("/submit_attendance")
public String submitAttendance(@RequestParam("rollno") int rollno,
                               @RequestParam("studentName") String studentName,
                               Model m) {
    Student st = ssi.getSingleStudent(rollno);

    if (st.getDate() != null && st.getDate().equals(LocalDate.now())) {
        m.addAttribute("msg", "Attendance already submitted today.");
    } else {
        st.setStatus("Present");
        st.setDate(LocalDate.now());

        ssi.saveStudent(st); 
        
        m.addAttribute("msg", "Attendance submitted successfully.");
    }

    m.addAttribute("student", st);
    m.addAttribute("currentDate", LocalDate.now().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));

    return "studentScreen";
}
@GetMapping("/add_lecture")
public String loadLectureForm(Model m) {
 return "AddLecture";
}

@PostMapping("/save_lecture")
public String saveLecture(@ModelAttribute Student s, Model m) {
    List<Student> students = ssi.serchStudentsByBatch(s.getBatchNumber());

    for (Student st : students) {
        st.setSubject(s.getSubject()); // ✅ Add this line

        st.setTeacher(s.getTeacher());
        st.setDayOfWeek(s.getDayOfWeek());
        st.setTimeSlot(s.getTimeSlot());
        st.setDate(s.getDate());

        ssi.saveStudent(st);
    }

    m.addAttribute("msg", "Lecture assigned to all students of batch " + s.getBatchNumber());
    return "AddLecture";
}

}
