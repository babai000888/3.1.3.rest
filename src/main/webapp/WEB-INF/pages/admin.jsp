<!DOCTYPE html>
<html lang="en" xmlns:th="http://thymeleaf.org">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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
                        <a href="admin" class="nav-link active" aria-current="page">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="admin" />
                            </svg>
                            Admin
                        </a>
                    </li>
                    <li>
                        <a href="roles" class="nav-link">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="roles" />
                            </svg>
                            Roles
                        </a>
                    </li>
                    <li>
                        <a href="user" class="nav-link">
                            <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="user" />
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
                        <a class="nav-link active" aria-current="page" data-toggle="pill" role="tab" href="#table">Users
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
                                <th scope="row" th:text="${user.id}">id</th>
                                <td th:text="${user.name}">name</td>
                                <td th:text="${user.lastName}">lastName</td>
                                <td th:text="${user.age}">age</td>
                                <td th:text="${user.email}">email</td>
                                <td th:text="${user.roles}">roles</td>
                                <td><a class="btn btn-info text-white editButton" th:value="@{/edit(id=${user.id})}">Edit</a></td>
                                <td><a class="btn btn-danger text-white deleteButton" th:value="@{/edit(id=${user.id})}">Delete</a>
                                </td>

                                <script>
                                    jQuery(document).ready(function () {

                                        let button = jQuery('.editButton');
                                        button.on('click', function (event) {
                                            event.preventDefault();
                                            let href = jQuery(this).attr('value');
                                            jQuery.get(href, function (userData, status) {
                                                jQuery('#uId').val(userData.id).attr('placeholder', userData.id);
                                                jQuery('#uName').val(userData.name).attr('placeholder', userData.name);
                                                jQuery('#uLastName').val(userData.lastName).attr('placeholder', userData.lastName);
                                                jQuery('#uAge').val(userData.age).attr('placeholder', userData.age);
                                                jQuery('#uEmail').val(userData.email).attr('placeholder', userData.email);
                                                jQuery('#uPassword').val(userData.password).attr('placeholder', userData.password);
                                                jQuery('#uRoles').val(userData.roles).attr('placeholder', userData.roles);
                                            });
                                            jQuery("#editModal").modal();
                                        });
                                    });
                                </script>

                                <!-- Modal Edit begin -->
                                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalTitle"
                                     aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalTitle">Edit user</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div id="printId" class="modal-body">
                                                <div class="container-fluid">
                                                    <form action="editUser" method="post">

                                                        <!-- Vertical -->
                                                        <div class="form-group text-center">
                                                            <label for="uID">ID</label>
                                                            <input type="text" th:field="${nuser.id}" minlength="2" maxlength="20" id="uId"
                                                                   class="form-control" readonly />
                                                            <label for="FirstName">First Name</label>
                                                            <input type="text" th:field="${nuser.name}" minlength="2" maxlength="20" id="uName"
                                                                   class="form-control" />
                                                            <label for="LastName">Last Name</label>
                                                            <input type="text" th:field="${nuser.lastName}" minlength="2" maxlength="20"
                                                                   id="uLastName" class="form-control" />
                                                            <label for="age">Age</label>
                                                            <input type="number" th:field="${nuser.age}" min="0" max="100" id="uAge"
                                                                   class="form-control" />
                                                            <label for="email">Email</label>
                                                            <input type="email" th:field="${nuser.email}" id="uEmail" class="form-control" />
                                                            <label for="password">Password</label>
                                                            <input type="password" th:field="${nuser.password}" minlength="4" maxlength="10"
                                                                   id="uPassword" class="form-control" />
                                                            <label for="role">Role</label>
                                                            <select th:name="checkedRoles" id="uRoles" class="form-control" multiple required
                                                                    size="2">
                                                                <div th:each="role : ${listRoles}">
                                                                    <option th:text="${role.getRole()}" th:value="${role.getId()}" name="roles">
                                                                    </option>
                                                                </div>
                                                            </select>
                                                            <br>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                                            </button>
                                                            <button type="submit" class="btn btn-primary">Edit</button>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal Edit end -->

                                <script>
                                    jQuery(document).ready(function () {

                                        let button = jQuery('.deleteButton');
                                        button.on('click', function (event) {
                                            event.preventDefault();
                                            let href = jQuery(this).attr('value');
                                            jQuery.get(href, function (userData, status) {
                                                jQuery('#dId').val(userData.id).attr('placeholder', userData.id);
                                                jQuery('#dName').val(userData.name).attr('placeholder', userData.name);
                                                jQuery('#dLastName').val(userData.lastName).attr('placeholder', userData.lastName);
                                                jQuery('#dAge').val(userData.age).attr('placeholder', userData.age);
                                                jQuery('#dEmail').val(userData.email).attr('placeholder', userData.email);
                                                jQuery('#dPassword').val(userData.password).attr('placeholder', userData.password);
                                                jQuery('#dRoles').val(userData.roles).attr('placeholder', userData.roles);
                                            });
                                            jQuery("#deleteModal").modal();
                                        });
                                    });
                                </script>

                                <!-- Modal Delete begin -->
                                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
                                     aria-labelledby="editModalTitle" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="deleteModalTitle">Delete user</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div id="printId1" class="modal-body">
                                                <div class="container-fluid">
                                                    <form action="delete" method="get">

                                                        <!-- Vertical -->
                                                        <div class="form-group text-center">
                                                            <label for="uID">ID</label>
                                                            <input type="text" th:field="${nuser.id}" minlength="2" maxlength="20" id="dId"
                                                                   class="form-control" readonly />
                                                            <label for="FirstName">First Name</label>
                                                            <input type="text" th:field="${nuser.name}" minlength="2" maxlength="20" id="dName"
                                                                   class="form-control" readonly />
                                                            <label for="LastName">Last Name</label>
                                                            <input type="text" th:field="${nuser.lastName}" minlength="2" maxlength="20"
                                                                   id="dLastName" class="form-control" readonly />
                                                            <label for="age">Age</label>
                                                            <input type="number" th:field="${nuser.age}" min="0" max="100" id="dAge"
                                                                   class="form-control" readonly />
                                                            <label for="email">Email</label>
                                                            <input type="email" th:field="${nuser.email}" id="dEmail" class="form-control"
                                                                   readonly />
                                                            <label for="password">Password</label>
                                                            <input type="password" th:field="${nuser.password}" minlength="4" maxlength="10"
                                                                   id="dPassword" class="form-control" readonly />
                                                            <label for="role">Role</label>
                                                            <select th:name="checkedRoles" id="dRoles" class="form-control" multiple required
                                                                    size="2" readonly>
                                                                <div th:each="role : ${listRoles}">
                                                                    <option th:text="${role.getRole()}" th:value="${role.getId()}" name="roles">
                                                                    </option>
                                                                </div>
                                                            </select>
                                                            <br>


                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                                            </button>
                                                            <button type="submit" class="btn btn-danger"
                                                                    th:value="@{/delete(id=${user.id})}">Delete
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal Delet end -->

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
                                        <input type="text" th:field="${nuser.name}" required minlength="2" maxlength="20" id="FirstName"
                                               class="form-control" placeholder="${nuser.name}">
                                        <label for="LastName">Last Name</label>
                                        <input type="text" th:field="${nuser.lastName}" minlength="2" maxlength="20" id="LastName"
                                               class="form-control" placeholder="${nuser.lastName}">
                                        <label for="age">Age</label>
                                        <input type="number" th:field="${nuser.age}" min="0" max="100" id="age" class="form-control"
                                               placeholder="${nuser.age}">
                                        <label for="email">Email</label>
                                        <input type="email" th:field="${nuser.email}" id="email" class="form-control"
                                               placeholder="${nuser.email}">
                                        <label for="password">Password</label>
                                        <input type="password" th:field="${nuser.password}" required minlength="4" maxlength="10"
                                               id="password" class="form-control" placeholder="${nuser.password}">
                                        <label for="role">Role</label>
                                        <select th:name="checkedRoles" id="role" class="form-control" multiple required size="2">
                                            <div th:each="role : ${listRoles}">
                                                <option th:text="${role.getRole()}" th:value="${role.getId()}" name="roles"></option>
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

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>