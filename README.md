# 🎓 Student Management System (Spring Boot + JSP)

A full-stack web application that allows administrators to manage students, lectures, attendance, and notices. Students can log in to view lectures, mark attendance, and stay updated with important announcements.

---

## 🚀 Features

### 🔐 Authentication
- Role-based login for *Admin* and *Student*
- Secure user access to relevant modules

### 👩‍🏫 Admin Functionality
- View and manage all student records
- Assign lectures by *day, **time, **subject, and **teacher*
- Post *notices* visible to all students
- View attendance reports

### 👨‍🎓 Student Functionality
- Login with unique credentials
- View *upcoming lectures* (filtered by batch)
- *Mark attendance* for scheduled lectures
- View personal *attendance percentage*
- Access the latest *notices*

---

## 🛠 Tech Stack

| Layer            | Technology             |
|------------------|------------------------|
| Language         | Java                   |
| Backend          | Spring Boot (MVC)      |
| View             | JSP, JSTL, HTML, CSS   |
| ORM              | Hibernate (JPA)        |
| Database         | MySQL                  |
| Architecture     | MVC, Layered (Controller-Service-Repository) |

---

## 🗃 Database Tables (Sample)

- student  
- lecture  
- attendance  
- notice  
- admin (optional)  

Each table is linked via appropriate foreign keys to maintain relational integrity.

---

## 📊 Screens & Features Preview

- ✅ *Admin Dashboard*  
  - Manage students  
  - Schedule lectures  
  - Post notices  

- ✅ *Student Dashboard*  
  - View upcoming lectures  
  - Mark attendance  
  - View attendance percentage  
  - Read notices  

---

## 📦 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/nootanchatur/student-management-system.git 
