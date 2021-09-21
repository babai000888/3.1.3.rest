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
                    <a id="usersMail" class="navbar-brand text-white">from script</a>
                    <span class="navbar-text text-white">with roles:&nbsp;</span>
                    <span id="usersRoles" class="navbar-text text-white">from script</span>
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
                        <a class="nav-link active" aria-current="page" data-toggle="pill"
                           role="tab" href="#table">Users Table</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" role="tab" href="#addUserForm">New User</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="table">All Users
                        <!-- USERS TABLE -->
                        <table id="usersTable" class="table table-light table-striped">
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
                            <tbody id="usersBody">
 <!--            Rows from script               -->
                            </tbody>
                        </table>
                    </div>

                    <!-- NEWUSER -->
                    <div id="addUserForm" role="tabpanel" class="tab-pane fade bg-white">Add new user
                        <div class="mx-auto text-center bg-white" style="width: 400px;">
                            <div class="container-fluid ">
                                <form>

                                    <!-- Vertical -->
                                    <div class="form-group">
                                        <input id="aid" type="hidden"  minlength="2" maxlength="20"
                                               class="form-control addUserForm" readonly />
                                        <label for="aname">First Name</label>
                                        <input id="aname" type="text" required minlength="2" maxlength="20"
                                               class="form-control addUserForm" >
                                        <label for="alastname">Last Name</label>
                                        <input id="alastname" type="text" minlength="2" maxlength="20"
                                               class="form-control addUserForm">
                                        <label for="aage">Age</label>
                                        <input id="aage" type="number" min="0" max="100"
                                               class="form-control addUserForm">
                                        <label for="aemail">Email</label>
                                        <input id="aemail" type="email"
                                               class="form-control addUserForm">
                                        <label for="apassword">Password</label>
                                        <input id="apassword" type="password" required minlength="4" maxlength="10"
                                               class="form-control addUserForm">
                                        <label for="aroles">Role</label>
                                        <select id="aroles" class="form-control addUserForm" multiple required
                                                size="2">
                                        </select>
                                        <br>

                                        <input id="addUserButton"  type="submit" value="Add new user" class="btn btn-success"></input>
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
                    <form>

                        <!-- Vertical -->
                        <div class="form-group text-center">
                            <label for="eid">ID</label>
                            <input id="eid" type="text"  minlength="2" maxlength="20"
                                   class="form-control editModal" readonly />
                            <label for="ename">First Name</label>
                            <input id="ename" type="text"  minlength="2" maxlength="20"
                                   class="form-control editModal"/>
                            <label for="elastname">Last Name</label>
                            <input id="elastname" type="text" minlength="2" maxlength="20"
                                   class="form-control editModal" field="sldkfj"/>
                            <label for="eage">Age</label>
                            <input id="eage" type="number" min="0" max="100"
                                   class="form-control editModal" />
                            <label for="eemail">Email</label>
                            <input id="eemail" type="email" class="form-control editModal" />
                            <label for="epassword">Password</label>
                            <input id="epassword" type="password" minlength="4" maxlength="10"
                                   class="form-control editModal" />
                            <label for="eroles">Role</label>
                            <select id="eroles" class="form-control editModal" multiple required
                                    size="2">
                                <-- filled by javascript -->
                            </select>
                            <br>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary Submit" data-dismiss="modal">Edit</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Modal Edit end -->


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
                    <form>

                        <!-- Vertical -->
                        <div class="form-group text-center">
                            <label>ID</label>
                            <input type="text" minlength="2" maxlength="20"
                                   class="form-control deleteModal" readonly />
                            <label>First Name</label>
                            <input type="text" minlength="2" maxlength="20"
                                   class="form-control deleteModal" readonly />
                            <label>Last Name</label>
                            <input type="text" minlength="2" maxlength="20"
                                   class="form-control deleteModal" readonly />
                            <label>Age</label>
                            <input type="number" min="0" max="100"
                                   class="form-control deleteModal" readonly />
                            <label>Email</label>
                            <input type="email" class="form-control deleteModal"
                                   readonly />
                            <label>Password</label>
                            <input type="password" minlength="4" maxlength="10"
                                   class="form-control deleteModal" readonly />
                            <label>Role</label>
                            <select class="form-control deleteModal" multiple required size="2" readonly>
                              <!-- filled by script -->
                            </select>
                            <br>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-danger Submit" data-dismiss="modal">Delete</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Modal Delete end -->



<!-- CRUD script -->
<script src="/js/rest.js"></script>
<script src="/js/tables.js"></script>
<script src="/js/mainAdmin.js"></script>
<script src="/js/event.js"></script>
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