<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shift Batch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e0f7fa);
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .btn-group-custom {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card border-primary">
        <div class="card-header bg-primary text-white text-center fs-5">
            Shift Batch for Roll No: <b>${st.rollno}</b>
        </div>
        <div class="card-body">
            <form action="/update_batch" method="post">
                <input type="hidden" name="rollno" value="${st.rollno}" />

                <div class="mb-3">
                    <label class="form-label">Current Batch:</label>
                    <input type="text" class="form-control bg-light" value="${st.batchNumber}" disabled />
                </div>

                <div class="mb-4">
                    <label for="batchNumber" class="form-label">Select New Batch:</label>
                    <select class="form-select" name="batchNumber" required>
                        <option value="">-- Select --</option>
                        <c:forEach var="i" begin="160" end="165">
                            <option value="FDJ-${i}">FDJ-${i}</option>
                            <option value="REG-${i}">REG-${i}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="btn-group-custom">
                    <button type="submit" class="btn btn-success">Update Batch</button>
                    <a href="/login" class="btn btn-outline-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
