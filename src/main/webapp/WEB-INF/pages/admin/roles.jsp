<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>ROLES</title>
</head>
<body>
<br/>
<h1> ROLES </h1>
<br/><br/>


<div>
    <div>
        <a th:href="@{/admin}" class="btn btn-info">Return to Admin page</a>
    </div>
</div>
<br>
<div>
    <table th:border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody>
        <tr  th:each="role : ${roles}">
            <td th:text="${role.getId()}">name</td>
            <td th:text="${role.getRole()}">name</td>
            <td><a th:href="@{/deleteRole(id=${role.id})}">Delete</a></td>
        </tr>
        </tbody>
    </table>

</div>


<form action="#" th:action="@{/addRole}" th:object="${newRole}" method="post">
    <table>
        <tbody>
        <tr>
            <td>ID:</td>
            <td>
                <input type="hidden" placeholder="*{id}" th:field="*{id}" />
            </td>
        </tr>
        <tr>
            <td>New role:</td>
            <td>
                <input type="text" th:field="*{role}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Submit" /> <input type="reset" value="Reset" />
            </td>
        </tr>
        </tbody>
    </table>
</form>





</body>
</html>


