
async function initUsersTable() {
    let principal = await getUserPrincipal()
    tableNavbar(principal,"#usersMail", "#usersRoles")
    let users = await getAllUsers()
    users.forEach(user =>
        tableAddEditDelete(user,tableAddRow("#usersBody","#usersTable",user)))
    formRoles(await getAllRoles(), "#aroles")
}

async function updateUsersTable() {
    const rowsToDelete = document.querySelectorAll('#DEL')
    rowsToDelete.forEach(row => row.remove())
    let users = await getAllUsers()
    users.forEach(user =>
        tableAddEditDelete(user,tableAddRow("#usersBody","#usersTable",user)))
}


initUsersTable()






