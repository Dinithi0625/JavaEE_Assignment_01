<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            overflow-x: hidden;
        }
        .sidebar {
            width: 220px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 60px;
        }
        .sidebar a {
            color: #fff;
            padding: 15px;
            display: block;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
        }
    </style>
</head>
<body>

<!-- 🔹 Sidebar -->
<div class="sidebar">
    <h5 class="text-white text-center">Dashboard</h5>
    <a href="admin.jsp">Admin</a>
    <a href="employee.jsp">Employee List</a>
    <a href="createEmployee.jsp">Create Employee</a>
</div>

<!-- 🔸 Main Content -->
<div class="content">

    <% String msg = (String) session.getAttribute("loginSuccess"); %>
    <% if (msg != null) { %>
    <div id="successAlert" class="alert alert-success"><%= msg %></div>
    <% session.removeAttribute("loginSuccess"); %>
    <% } %>

    <h2>Welcome, Admin!</h2>
    <p>Use the sidebar to navigate through the admin features.</p>

    <hr>

    <h4>All Employees</h4>
    <%
        BasicDataSource ds = (BasicDataSource) request.getServletContext().getAttribute("dataSource");
        List<UserDTO> users = UserModel.getAll(ds);
    %>
    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Role</th>
            <th>Email</th>
            <th>Options</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (UserDTO user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getPassword() %></td>
            <td><%= user.getRole() %></td>
            <td><%= user.getEmail() %></td>
            <td>
                <a href="updateEmployee.jsp?id=<%= user.getId() %>" class="btn btn-info btn-sm">Update</a>
                <a href="deleteEmployee.jsp?id=<%= user.getId() %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

<script>
    window.addEventListener("DOMContentLoaded", function () {
        const alertBox = document.getElementById("successAlert");
        if (alertBox) {
            setTimeout(function () {
                alertBox.style.transition = "opacity 0.5s ease";
                alertBox.style.opacity = "0";
                setTimeout(() => {
                    alertBox.style.display = "none";
                }, 500);
            }, 2000);
        }
    });
</script>
</body>
</html>
