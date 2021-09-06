<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org">

<html>
<head>
    <title>Spring MVC</title>
</head>
<body>

<h1>Start page</h1>
<br>
<br>
<div>
    <sec:authorize access="!isAuthenticated()">
        <h4><a href="/login">Login</a></h4>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <h4><a href="/logout">Logout</a></h4>
    </sec:authorize>
    <h4><a href="/user"> Homepage (for Users)</a></h4>
    <h4><a href="/admin"> Admin Page (for Admin)</a></h4>
</div>
<br>


</body>
</html>