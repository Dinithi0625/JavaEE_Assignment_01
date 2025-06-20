<%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/17/2025
  Time: 1:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<form class="row g-3" method="post" action="/create">
    <div class="col-md-6">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" required name="name">
    </div>
    <div class="col-md-6">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" required name="email">
    </div>
    <div class="col-12">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" placeholder="****" required name="password">
    </div>
    <div class="col-md-6">
        <label for="role" class="form-label">Role</label>
        <select id="role" name="role" class="form-select" required>
            <option selected disabled value="">Choose...</option>
            <option value="Admin">Admin</option>
            <option value="Employee">Employee</option>
        </select>
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
