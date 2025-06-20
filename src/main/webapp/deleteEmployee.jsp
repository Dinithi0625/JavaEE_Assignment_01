<%@ page import="com.ijse.gdse.api.model.UserModel" %>
<%@ page import="org.apache.commons.dbcp2.BasicDataSource" %>
<%@ page import="com.ijse.gdse.api.dto.UserDTO" %><%--
  Created by IntelliJ IDEA.
  User: Shavindi
  Date: 6/17/2025
  Time: 5:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<% UserDTO user = UserModel.findById(request.getParameter("id"), (BasicDataSource) request.getServletContext().getAttribute("dataSource"));%>
<form class="row g-3" method="post" action="/delete?id=<%=user.getId()%>">
    <div class="col-md-6">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" required name="name" value="<%=user.getName()%>">
    </div>
    <div class="col-md-6">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" required name="email" value="<%=user.getEmail()%>">
    </div>
    <div class="col-12">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" placeholder="****" required name="password" value="<%=user.getPassword()%>">
    </div>

    <div class="col-12">
        <button type="submit" class="btn btn-danger">Delete</button>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
