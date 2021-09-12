<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>

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





<body>

<header>


    <!-- NAVBAR++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
    <NAVBAR>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <ul>
                    <a class="navbar-brand">
                        <script>
                            document.write("[[${userActive.getEmail()}]]");
                        </script>
                    </a>
                    <span class="navbar-text text-white">with roles:</span>
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



    <div class="row">

<div class="col">
<!-- SIDEBAR ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<SIDEBAR>
    <div class="d-flex flex-column bg-white">
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="#" class="nav-link active" aria-current="page">
                    <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#adminPage" />
                    </svg>
                    Admin
                </a>
            </li>
            <li>
                <a href="#" class="nav-link link-dark">
                    <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#userPage" />
                    </svg>
                    User
                </a>
            </li>
        </ul>
    </div>


</SIDEBAR>
    </div>

        <div class="col-md-auto">

        <TABS>

            <div class="col" style="background:whitesmoke">

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
                </div>
            </div>
        </TABS>

        </div>

    </div>













<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
-->
</body>

</html>