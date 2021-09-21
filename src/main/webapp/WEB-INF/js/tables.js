
function rolesToString(roles) {
    let rolesString = ""
    roles.forEach(function(role){
        rolesString = rolesString + role.role + " "
    })
    return rolesString
}

async function tableNavbar(principal, navMail, navRoles) {
    document.querySelector(navMail).innerHTML = principal.email
    document.querySelector(navRoles).innerHTML = rolesToString(principal.roles)
}

function tableAddRow(body, tab, newRow) {
    const row = document.querySelector(tab).insertRow()
    row.id = "DEL"
    for(let key in newRow) {
        if(key !== "password") {
            if(key === "roles") row.insertCell().innerHTML = rolesToString(newRow[key])
            else row.insertCell().innerHTML = newRow[key]
        }
   }
   return row
}

function tableAddEditDelete(newRow,row) {
    row.insertCell().innerHTML =
        "<a class='btn btn-info text-white MODAL' name='editModal' value='" + newRow.id + "'>Edit</a>"
    row.insertCell().innerHTML =
        "<a class='btn btn-danger text-white MODAL' name='deleteModal' value='" + newRow.id + "'>Delete</a>"
}

function formRoles(roles, rolesTag) {
    for(let role of roles) {
        let option = document.createElement("option")
        option.text=role.role
        option.setAttribute("value", role.id)
        document.querySelector(rolesTag).appendChild(option)
    }
}
