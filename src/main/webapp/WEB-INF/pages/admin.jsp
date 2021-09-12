<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Admin Panel</title>
</head>

<body class="grey lighten=3">

<header>
    <NAVBAR>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark white scrolling-navbar bg-dark">
            <div class="container-fluid">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <a class="navbar-brand text-white">
                        <script>
                            document.write("[[${userActive.getEmail()}]]");
                        </script>
                    </a>
                    <span class="navbar-text text-white">with roles:&nbsp;</span>
                    <span class="navbar-text text-white">
                            <script>
                                document.write("[[${userActive.getRoles()}]]");
                            </script>
                        </span>
                </ul>
                <sec:authorize access="isAuthenticated()">
                    <a class="text-secondary" href="/logout">Logout</a>
                </sec:authorize>
            </div>
        </nav>
    </NAVBAR>
</header>

<KONTEINER>
    <div class="container-fluid">
        <div class="row">

            <!-- SIDEBAR -->
            <div class="d-flex flex-column bg-white">
                <br>
                <br>
                <br>
                <ul class="nav nav-pills flex-column mb-auto" style="width: 200px;">
                    <li class="nav-item">
                        <a href="#" class="nav-link active" aria-current="page">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#home" />
                            </svg>
                            Admin
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link text-blue">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#speedometer2" />
                            </svg>
                            User
                        </a>
                    </li>
                </ul>
            </div>

            <!-- TABS -->
            <div class="col" style="background:whitesmoke">
                <br>
                <br>
                <br>
                <h3>Admin Panel</h3>
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" data-toggle="pill" role="tab"
                           href="#table">Users
                            Table</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" role="tab" href="#user">New User</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="table">All Users
                        <!-- USERS TABLE -->
                        <table class="table table-light table-striped">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Age</th>
                                <th scope="col">Email</th>
                                <th scope="col">Role</th>
                                <th scope="col">Edit</th>
                                <th scope="col">Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr th:each="user : ${users}">
                                <th scope="row" th:text="${user.getId()}">1</th>
                                <td th:text="${user.getName()}">name</td>
                                <td th:text="${user.getLastName()}">lastName</td>
                                <td th:text="${user.getAge()}">age</td>
                                <td th:text="${user.getEmail()}">email</td>
                                <td th:text="${user.getRoles()}">roles</td>
                                <td><a class="btn btn-info text-white" role="button" data-bs-toggle="modal"
                                       data-bs-target="#exampleModal"
                                       th:href="@{/edit(id=${user.id})}">Edit</a></td>
                                <td><a class="btn btn-danger text-white" role="button"
                                       th:href="@{/delete(id=${user.id})}">Delete</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- NEWUSER -->
                    <div role="tabpanel" class="tab-pane fade bg-white" id="user">Add new user
                        <div class="mx-auto text-center bg-white" style="width: 400px;">
                            <div class="container-fluid ">
                                <form action="addUser" method="post">

                                    <!-- Vertical -->
                                    <div class="form-group">
                                        <label for="FirstName">First Name</label>
                                        <input type="text" th:field="${nuser.name}" required minlength="2"
                                               maxlength="20" id="FirstName" class="form-control"
                                               placeholder="${nuser.name}">
                                        <label for="LastName">Last Name</label>
                                        <input type="text" th:field="${nuser.lastName}" minlength="2" maxlength="20"
                                               id="LastName" class="form-control" placeholder="${nuser.lastName}">
                                        <label for="age">Age</label>
                                        <input type="number" th:field="${nuser.age}" min="0" max="100" id="age"
                                               class="form-control" placeholder="${nuser.age}">
                                        <label for="email">Email</label>
                                        <input type="email" th:field="${nuser.email}" id="email"
                                               class="form-control" placeholder="${nuser.email}">
                                        <label for="password">Password</label>
                                        <input type="password" th:field="${nuser.password}" required minlength="4"
                                               maxlength="10" id="password" class="form-control"
                                               placeholder="${nuser.password}">
                                        <label for="role">Role</label>
                                        <select th:name="checkedRoles" id="role" class="form-control" multiple
                                                required size="2">
                                            <div th:each="role : ${listRoles}">
                                                <option th:text="${role.getRole()}" th:value="${role.getId()}"
                                                        name="roles"></option>
                                            </div>
                                        </select>
                                        <br>

                                        <button type="submit" class="btn btn-success">Add new user</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</KONTEINER>

<!-- DEBUGSCRIPTS -->
<script>
    document.write("userActive =======" + "[[${userActive.toString()}]]");
</script>
<br>
<script>
    document.write("users =======" + "[[${users.toString()}]]");
</script>
<br>
<script>
    document.write("listRoles =======" + "[[${listRoles.toString()}]]");
</script>



<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>