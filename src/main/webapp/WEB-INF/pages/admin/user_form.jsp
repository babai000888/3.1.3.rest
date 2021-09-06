<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org">

<html>
<head>
    <title>Spring MVC - Employee</title>
</head>
<body>

<h1>Fill in user data</h1>

<form action="#" th:action="${action}"  method="post" >
    <table>
        <tbody>
        <tr>
            <td>ID:</td>
            <td>
                <input type="hidden" placeholder="${user.id}" th:field="${user.id}" th:text="${user.id}" />
            </td>
        </tr>
        <tr>
            <td>NAME(login):</td>
            <td>
                <input type="text" placeholder="${user.name}" th:field="${user.name}" class="form-control"
                       required minlength="2" maxlength="20"/>
            </td>
        </tr>
        <tr>
            <td>password:</td>
            <td>
                <input type="text" placeholder="${user.password}" th:field="${user.password}" class="form-control"
                       required minlength="6" maxlength="10"/>
            </td>
        </tr>
        <tr>
            <td>LAST NAME</td>
            <td>
                <input type="text" placeholder="${user.lastName}" th:field="${user.lastName}" class="form-control"
                        minlength="2" maxlength="20" />
            </td>
        </tr>
        <tr>
            <td>AGE</td>
            <td>
                <input type="number" value="0" placeholder="${user.age}" th:field="${user.age}" class="form-control"
                       min="0" max="100" />
            </td>
        </tr>
        <tr>
            <td>Select roles: </td>
            <td>
                <th:block th:each="role: ${listRoles}">
                    <input type="checkbox" th:name="checkedRoles" th:value="${role.getId()}" class="m-2"/>
                    <label th:text="${role.getRole()}" ></label>
                </th:block>
            </td>
        </tr>

        <!-- ФОРМА ЧЕРЕЗ SELECT
        <select name="rolesSelected" multiple required size="10">
            <option disabled selected>select role</option>
            <div  th:each="role : ${allRoles}">
                <option th:text="${role.getRoleName()}" th:value="${role.getRoleId()}" name="roles"/>
            </div>
        </select>
        -->

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