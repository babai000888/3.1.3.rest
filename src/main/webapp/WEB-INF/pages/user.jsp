<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org">

<html>
<head>
    <title>Spring MVC</title>
</head>
<body>

<h1>User Homepage</h1>
<br>
    <br>
<sec:authorize access="isAuthenticated()">
    <h4><a href="/logout">Logout</a></h4>
</sec:authorize>
<br>
<div>
    <div>
        <a th:href="@{/}" class="btn btn-info">Return to Start page</a>
    </div>
</div>
<br>
<div>
    <table>
        <tbody>
        <tr>
            <td>ID: </td>
            <td>
            <td th:text="${user.getId()}">name</td>
            </td>
        </tr>
        <tr>
            <td>NAME(login):</td>
            <td>
            <td th:text="${user.getName()}">name</td>
            </td>
        </tr>
        <tr>
            <td>password:</td>
            <td>
            <td th:text="${user.getPassword()}">name</td>
            </td>
        </tr>
        <tr>
            <td>LAST NAME</td>
            <td>
            <td th:text="${user.getLastName()}">name</td>
            </td>
        </tr>
        <tr>
            <td>AGE</td>
            <td>
            <td th:text="${user.getAge()}">name</td>
            </td>
        </tr>
        <tr>
            <td>Roles</td>
            <td>
            <td th:text="${user.getRoles()}">name</td>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>