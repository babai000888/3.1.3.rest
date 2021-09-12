<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <title>userList</title>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    
</nav>




<h1> TABLE of USERS </h1>
<br>
<div>
    <div>
        <a th:href="@{/}" class="btn btn-info">Return to Start page</a>
    </div>
</div>
<br>
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


