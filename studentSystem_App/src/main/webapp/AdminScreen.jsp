<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Screen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .navbar-banner {
            position: relative;
            width: 100%;
            height: 300px;
            background-image: url('images/A.webp');
            background-size: cover;
            background-position: center;
        }

        .navbar-buttons {
            position: absolute;
            bottom: 20px;
            right: 30px;
        }

        .section-content {
            padding: 30px;
        }

        .heading {
            font-family: cursive;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            width: 100%;
        }

        .card-container {
            margin-top: -50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar with image -->
<div class="navbar-banner">
    <div class="navbar-buttons">
        <button class="btn btn-primary me-2" onclick="showSection('enrollSection')">Enroll Student</button>
        <button class="btn btn-success me-2" onclick="showSection('viewSection')">View Student</button>
        <button class="btn btn-info me-2" onclick="showSection('noticeSection')">Post Notice</button>
        <a href="/add_lecture"><button class="btn btn-warning me-2">Assign Lecture</button></a>
        <a href="/"><button class="btn btn-danger">Logout</button></a>
    </div>
</div>

<!-- Wrapper -->
<div class="container card-container">

    <!-- Enroll Section -->
    <section id="enrollSection" style="display: none;">
        <h3 class="heading">Student Enrollment Form</h3>
        <form action="/enroll_student" method="post" class="row g-3">
            <div class="col-md-6">
                <input type="text" name="studentFullName" class="form-control" placeholder="Full Name" required/>
            </div>
            <div class="col-md-6">
                <input type="email" name="studentEmail" class="form-control" placeholder="Email" required/>
            </div>
            <div class="col-md-6">
                <input type="password" name="password" class="form-control" placeholder="Password" required/>
            </div>
            <div class="col-md-6">
                <input type="number" name="studentAge" class="form-control" placeholder="Age" required/>
            </div>
            <div class="col-md-6">
                <input type="text" name="studentCollageName" class="form-control" placeholder="College Name" required/>
            </div>
            <div class="col-md-6">
                <input type="number" name="feesPaid" class="form-control" placeholder="Fees Paid" required/>
            </div>
            <div class="col-md-12">
                <label>Student Course:</label><br>
                <input type="radio" name="studentCourse" value="Java" checked> Java
                <input type="radio" name="studentCourse" value="Python"> Python
                <input type="radio" name="studentCourse" value="Testing"> Testing
            </div>
            <div class="col-md-6">
                <select class="form-select" name="batchMode" required>
                    <option disabled selected>Select Batch Mode</option>
                    <option value="Online">Online</option>
                    <option value="Offline">Offline</option>
                </select>
            </div>
            <div class="col-md-6">
                <select class="form-select" name="batchNumber" required>
                    <option disabled selected>Select Batch Number</option>
                    <c:forEach var="i" begin="160" end="165">
                        <option value="FDJ-${i}">FDJ-${i}</option>
                        <option value="REG-${i}">REG-${i}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="text-center">
                <input type="submit" value="Submit" class="btn btn-primary mt-3"/>
            </div>
        </form>
    </section>

    <!-- View Section -->
    <section id="viewSection" style="display: none;">
        <h3 class="heading">Student Details</h3>
        <form action="search" class="d-flex mb-3">
            <select class="form-select w-25" name="batchNumber">
                <option disabled selected>Select Batch Number</option>
                <c:forEach var="i" begin="160" end="165">
                    <option value="FDJ-${i}">FDJ-${i}</option>
                    <option value="REG-${i}">REG-${i}</option>
                </c:forEach>
            </select>
            <button class="btn btn-outline-primary ms-2">Search</button>
        </form>

        <marquee><h5 style="color: red;">${message}</h5></marquee>

        <table class="table table-bordered table-striped table-sm">
            <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Email</th><th>Age</th><th>College</th><th>Course</th>
                    <th>Batch No</th><th>Mode</th><th>Fees Paid</th><th>Password</th>
                    <th>Attendance</th><th>Marked Date</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${data}" var="s">
                    <tr>
                        <td>${s.rollno}</td>
                        <td>${s.studentFullName}</td>
                        <td>${s.studentEmail}</td>
                        <td>${s.studentAge}</td>
                        <td>${s.studentCollageName}</td>
                        <td>${s.studentCourse}</td>
                        <td>${s.batchNumber}</td>
                        <td>${s.batchMode}</td>
                        <td>${s.feesPaid}</td>
                        <td>${s.password}</td>
                        <td>
                            <c:choose>
                                <c:when test="${s.status == 'Present'}">
                                    <span class="badge bg-success">Present</span>
                                </c:when>
                                <c:when test="${s.status == 'Absent'}">
                                    <span class="badge bg-danger">Absent</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Not Marked</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${not empty s.date}">${s.date}</c:if>
                            <c:if test="${empty s.date}"><span class="text-muted">N/A</span></c:if>
                        </td>
                        <td>
                            <form action="/fees" method="get" style="display:inline;">
                                <input type="hidden" name="rollno" value="${s.rollno}"/>
                                <button type="submit" class="btn btn-outline-success btn-sm">Pay-Fees</button>
                            </form>
                            <form action="/batch" method="get" style="display:inline;">
                                <input type="hidden" name="rollno" value="${s.rollno}"/>
                                <button type="submit" class="btn btn-outline-primary btn-sm">Shift-Batch</button>
                            </form>
                            <form action="/remove" method="post" style="display:inline;">
                                <input type="hidden" name="rollno" value="${s.rollno}"/>
                                <button type="submit" class="btn btn-outline-danger btn-sm">Remove</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- Post Notice Section -->
    <section id="noticeSection" style="display: none;">
        <h3 class="heading">Post a New Notice</h3>
        <form action="save-notice" method="post" class="row g-3">
            <div class="col-md-6">
                <label>Title:</label>
                <input type="text" name="title" class="form-control" placeholder="Enter Title" required>
            </div>
            <div class="col-md-12">
                <label>Description:</label>
                <textarea name="description" rows="4" class="form-control" placeholder="Enter Description" required></textarea>
            </div>
            <div class="col-md-6">
                <label>Posted By:</label>
                <input type="text" name="postedBy" class="form-control" value="ADMIN" readonly>
            </div>
            <div class="text-center">
                <input type="submit" value="Post Notice" class="btn btn-info mt-3">
            </div>
        </form>
    </section>

</div>

<!-- JavaScript to toggle sections -->
<script>
    function showSection(sectionId) {
        const sections = ["enrollSection", "viewSection", "noticeSection"];
        sections.forEach(id => document.getElementById(id).style.display = "none");
        document.getElementById(sectionId).style.display = "block";
    }

    // Default section on page load
    window.onload = function () {
        showSection('viewSection');
    };
</script>
</body>
</html>
