<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
        }
        .card {
            margin: 30px auto;
            max-width: 900px;
            border-radius: 15px;
            padding: 20px;
        }
        h2, h4 {
            font-family: 'Segoe UI', sans-serif;
            color: #2e4053;
        }
        table {
            font-size: small;
        }
    </style>
</head>
<body>

<div class="card shadow">
    <h2 class="text-center">Welcome, ${student.studentFullName} 👋</h2>
    <hr>

    <!-- Student Info -->
    <h4>📄 My Info</h4>
    <table class="table table-bordered table-sm">
        <tr><th>Email</th><td>${student.studentEmail}</td></tr>
        <tr><th>Age</th><td>${student.studentAge}</td></tr>
        <tr><th>College</th><td>${student.studentCollageName}</td></tr>
        <tr><th>Course</th><td>${student.studentCourse}</td></tr>
        <tr><th>Batch Mode</th><td>${student.batchMode}</td></tr>
        <tr><th>Batch Number</th><td>${student.batchNumber}</td></tr>
        <tr><th>Fees Paid</th><td>₹ ${student.feesPaid}</td></tr>
    </table>

    <!-- Attendance Section -->
    <h4 class="mt-4">✅ Mark Attendance</h4>
    <form action="/submit_attendance" method="post" class="d-flex justify-content-between align-items-center mb-3">
        <input type="hidden" name="rollno" value="${student.rollno}"/>
        <input type="hidden" name="studentName" value="${student.studentFullName}"/>
        <button type="submit" class="btn btn-success">Submit Attendance</button>
        <span class="text-muted">Date: ${currentDate}</span>
    </form>

    <!-- Attendance Message -->
    <c:if test="${not empty msg}">
        <div class="alert alert-info">${msg}</div>
    </c:if>
<h3>Upcoming Lectures</h3>

<c:if test="${not empty upcomingLectures}">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Subject</th>
                <th>Teacher</th>
                <th>Batch</th>
                <th>Day</th>
                <th>Time</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
<c:forEach var="lecture" items="${upcomingLectures}">
                <tr>
                    <td>${lecture.subject}</td>
                    <td>${lecture.teacher}</td>
                    <td>${lecture.batchNumber}</td>
                    <td>${lecture.dayOfWeek}</td>
                    <td>${lecture.timeSlot}</td>
                    <td>${lecture.date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty upcomingLectures}">
    <p>No upcoming lectures scheduled.</p>
</c:if>

        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="/" class="btn btn-danger">Logout</a>
    </div>
</div>

</body>
</html>
