<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>userList</title>
</head>
<body>
<br/>
<h1> TABLE of USERS </h1>
<div>
    <div>
        <a th:href="@{/add}" class="btn btn-info">Add new User</a>
        <p></p>
        <a th:href="@{/roles}" class="btn btn-info">Manage Roles</a>
        <p></p>
        <sec:authorize access="isAuthenticated()">
            <h4><a href="/logout">Logout</a></h4>
        </sec:authorize>
    </div>
</div>
<br/><br/>
<div>
    <table th:border="1">
        <thead>
        <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>Password</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Roles</th>
        </tr>
        </thead>
        <tbody>
        <tr  th:each="user : ${users}">
            <th scope="row" th:text="${user.getId()}">1</th>
            <td th:text="${user.getName()}">name</td>
            <td th:text="${user.getPassword()}">password</td>
            <td th:text="${user.getLastName()}">lastName</td>
            <td th:text="${user.getAge()}">age</td>
            <td th:text="${user.getRoles()}">roles</td>
            <td><a th:href="@{/delete(id=${user.id})}">Delete</a></td>
            <td><a th:href="@{/edit(id=${user.id})}">Edit</a></td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>


