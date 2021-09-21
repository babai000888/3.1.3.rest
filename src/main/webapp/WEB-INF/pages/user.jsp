<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/extras/spring-security">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <title>User Panel</title>
</head>

<body class="grey lighten=3">

<header>
    <NAVBAR>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark white scrolling-navbar bg-dark">
            <div class="container-fluid">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <a id="userMail"class="navbar-brand text-white">from script</a>
                    <span class="navbar-text text-white">with roles:&nbsp;</span>
                    <span id="userRoles" class="navbar-text text-white">from script</span>
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
            <div class="d-flex flex-column bg-white" >
                <br>
                <br>
                <ul class="nav nav-pills flex-column mb-auto" style="width: 200px;">
                        <li class="nav-item" th:if="${#request.isUserInRole('ROLE_ADMIN')}">
                            <a href="admin" class="nav-link">
                                <svg class="bi me-2" width="16" height="16">
                                    <use xlink:href="admin" />
                                </svg>
                                Admin
                            </a>
                        </li>
                    <li>
                        <a href="user" class="nav-link active" aria-current="page">
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
                <h3>User information-page</h3>
                <!-- USERS TABLE -->
                <table id="userTable" class="table table-light table-striped">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Age</th>
                        <th scope="col">Email</th>
                        <th scope="col">Role</th>
                    </tr>
                    </thead>
                    <tbody id="userBody">
<!--      Rows from script      -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</KONTEINER>


<!-- CRUD script -->
<script src="/js/rest.js"></script>
<script src="/js/tables.js"></script>
<script src="/js/mainUser.js"></script>
<script src="/js/crud.js"></script>

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