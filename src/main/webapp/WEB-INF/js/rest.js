
// Send request function
async function sendRequest(method, url, body = null) {
    let response
    const headers = {'Content-Type': 'application/json'}
    if (method === "GET") {
        response = await fetch(url, {
            method: method,
            headers: headers
        })
    } else {
        response = await fetch(url, {
            method: method,
            body: JSON.stringify(body),
            headers: headers
        })
    }
    if (response.ok) {
        return response.json()
    } else {
        alert("Ошибка HTTP: " + response.status);
    }
}

var rolesArray =[]
async function getAllRoles() {
    if(rolesArray.length == 0) {
        let roles = await sendRequest('GET', "/api/roles")
        roles.forEach(element => rolesArray.push(element))
    }
    return rolesArray
}
var usersArray =[]
async function getAllUsers() {
    if(usersArray.length == 0) {
        let users = await sendRequest('GET', "/api/users")
        users.forEach(element => usersArray.push(element))
    }
    return usersArray
}

function getUserPrincipal() {
    return sendRequest('GET', "/api/users/principal")
}

function getUserById(userId){
//    const url = "/api/users/" + id
    let result
    usersArray.forEach(user => {
        if (user['id'] == userId) result = user
    })
    return result
}

function addUser(body) {
    sendRequest('POST', "/api/users/", body).then(resp=>{
        if(resp.id != null) {
            usersArray.push(resp)
            tableAddEditDelete(resp,tableAddRow("#usersBody","#usersTable",resp))
        }
    })
}

function editUser(body) {
    sendRequest('PUT', "/api/users/", body).then(resp=>{
        for (let i = 0; i < usersArray.length; i++) {
            if (usersArray[i]['id'] == resp.id) {
                usersArray[i] = resp
                updateUsersTable()
            }
        }
    })
}

function deleteUser(body) {
    sendRequest('DELETE', "/api/users/" + body.id).then(()=>{
        for (let i = 0; i < usersArray.length; i++) {
            let user = usersArray[i]
            if (user['id'] == body.id) {
                usersArray.splice(i,1)
                updateUsersTable()
            }
        }
    })
}
