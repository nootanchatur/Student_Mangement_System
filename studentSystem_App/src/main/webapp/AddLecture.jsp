<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Schedule Lecture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-4">

    <h2 class="text-center mb-4">📚 Schedule a Lecture</h2>

    <!-- ✅ Show message if lecture is scheduled successfully -->
    <c:if test="${not empty msg}">
        <div class="alert alert-success text-center w-50 mx-auto">${msg}</div>
    </c:if>

    <form action="/save_lecture" method="post" class="w-50 mx-auto shadow p-4 bg-light rounded">
        <div class="mb-3">
            <input type="text" name="subject" class="form-control" placeholder="Subject" required/>
        </div>
        <div class="mb-3">
            <input type="text" name="teacher" class="form-control" placeholder="Teacher Name" required/>
        </div>
        <div class="mb-3">
            <select name="batchNumber" class="form-control" required>
                <option disabled selected>Select Batch</option>
                <c:forEach var="i" begin="160" end="165">
                    <option value="FDJ-${i}">FDJ-${i}</option>
                    <option value="REG-${i}">REG-${i}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <select name="dayOfWeek" class="form-control" required>
                <option disabled selected>Select Day</option>
                <option>Monday</option>
                <option>Tuesday</option>
                <option>Wednesday</option>
                <option>Thursday</option>
                <option>Friday</option>
                <option>Saturday</option>
            </select>
        </div>
        <div class="mb-3">
            <input type="text" name="timeSlot" class="form-control" placeholder="Time (e.g., 10:00 AM - 11:00 AM)" required/>
        </div>
        <div class="mb-3">
            <input type="date" name="date" class="form-control" required/>
        </div>
        <div class="text-center">
            <input type="submit" class="btn btn-primary" value="Schedule Lecture"/>
        </div>
    </form>

    <!-- 🔙 Back Button -->
    <div class="text-center mt-3">
        <a href="/login?username=ADMIN&password=admin" class="btn btn-secondary">Back to Dashboard</a>
    </div>

</body>
</html>
