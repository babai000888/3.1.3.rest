<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">


    <title>userList</title>

</head>

<body class="grey lighten=3">
<header>



    <nav class="navbar fixed-top navbar-expand-lg navbar-dark white scrolling-navbar bg-dark">
        <div class="container-fluid">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <span class="navbar-brand mb-0 h1">admin@mail.ru</span>
                    <span class="navbar-text text-white">with roles:&nbsp;</span>
                    <span class="navbar-text text-white">ADMIN USER</span>
            </ul>
            <sec:authorize access="isAuthenticated()">
                <a class="text-secondary" href="/logout">Logout</a>
            </sec:authorize>
        </div>
    </nav>





</header>





<div class="container-fluid">
    <div class="row">


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











        <div class="col" style="background:whitesmoke">
            <br>
            <br>
            <br>
            <h3>Admin Panel</h3>
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" data-toggle="pill" role="tab" href="#table">Users
                        Table</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="pill" role="tab" href="#user">New User</a>
                </li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active fade in" id="table">All Users

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
                                   data-bs-target="#exampleModal" th:href="@{/edit(id=${user.id})}">Edit</a></td>
                            <td><a class="btn btn-danger text-white" role="button"
                                   th:href="@{/delete(id=${user.id})}">Delete</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div role="tabpanel" class="tab-pane fade bg-white" id="user">Add new user
                    <div class="mx-auto text-center bg-white" style="width: 400px;">
                        <div class="container-fluid ">
                            <form action="addUser"  method="post">

                                <!-- Vertical -->
                                <div class="form-group">
                                    <label for="FirstName">First Name</label>
                                    <input type="text" th:field="${nuser.name}" required minlength="2" maxlength="20"
                                           id="FirstName" class="form-control" placeholder="${nuser.name}">
                                    <label for="LastName">Last Name</label>
                                    <input type="text" th:field="${nuser.lastName}" minlength="2" maxlength="20"
                                           id="LastName" class="form-control" placeholder="${nuser.lastName}">
                                    <label for="age">Age</label>
                                    <input type="number" th:field="${nuser.age}" min="0" max="100" id="age"
                                           class="form-control" placeholder="${nuser.age}">
                                    <label for="email">Email</label>
                                    <input type="email" th:field="${nuser.email}" id="email" class="form-control" placeholder="${nuser.email}">
                                    <label for="password">Password</label>
                                    <input type="password" th:field="${nuser.password}"required minlength="4"
                                           maxlength="10"  id="password" class="form-control" placeholder="${nuser.password}">
                                    <label for="role">Role</label>
                                    <select th:name="checkedRoles" id="role" class="form-control" multiple required size="2">
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
</div>

<!-- Modal -->
<div class="modal fade" id="editUser" tabindex="-1" aria-labelledby="editUserModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit user</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">


                <div class="container-fluid ">
                    <form action="addUser"  method="post">

                        <!-- Vertical -->
                        <div class="form-group">
                            <label for="FirstName">First Name</label>
                            <input type="text" th:field="${nuser.name}" required minlength="2" maxlength="20"
                                   id="FirstName" class="form-control" placeholder="${nuser.name}">
                            <label for="LastName">Last Name</label>
                            <input type="text" th:field="${nuser.lastName}" minlength="2" maxlength="20"
                                   id="LastName" class="form-control" placeholder="${nuser.lastName}">
                            <label for="age">Age</label>
                            <input type="number" th:field="${nuser.age}" min="0" max="100" id="age"
                                   class="form-control" placeholder="${nuser.age}">
                            <label for="email">Email</label>
                            <input type="email" th:field="${nuser.email}" id="email" class="form-control" placeholder="${nuser.email}">
                            <label for="password">Password</label>
                            <input type="password" th:field="${nuser.password}"required minlength="4"
                                   maxlength="10"  id="password" class="form-control" placeholder="${nuser.password}">
                            <label for="role">Role</label>
                            <select th:name="checkedRoles" id="role" class="form-control" multiple required size="2">
                                <div th:each="role : ${listRoles}">
                                    <option th:text="${role.getRole()}" th:value="${role.getId()}"
                                            name="roles"></option>
                                </div>
                            </select>
                            <br>

                        </div>

                    </form>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary btn-success">Edit</button>
            </div>
        </div>
    </div>
</div>


<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</body>

</html>