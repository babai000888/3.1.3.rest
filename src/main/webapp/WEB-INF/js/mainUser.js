
async function initUserTable() {
    let user = await getUserPrincipal()
    tableNavbar(user,"#userMail", "#userRoles")
    tableAddRow("userBody","#userTable", user)
}


initUserTable()