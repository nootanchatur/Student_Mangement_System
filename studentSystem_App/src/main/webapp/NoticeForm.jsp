<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Post New Notice</title>
</head>
<body>
    <h2>Admin: Post New Notice</h2>

    <form action="save-notice" method="post">
        <label>Title:</label><br>
        <input type="text" name="title" required><br><br>

        <label>Description:</label><br>
        <textarea name="description" rows="5" cols="40" required></textarea><br><br>

        <label>Posted By:</label><br>
        <input type="text" name="postedBy" value="ADMIN" required><br><br>

        <input type="submit" value="Post Notice">
    </form>
</body>
</html>
