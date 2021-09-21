//////////////// Extract user from the form
function extractUser(form) {
    let roleIds = []

    for(let roleId of form[6].selectedOptions) {
        roleIds.push({id: roleId.value,role:roleId.text})
    }
    const body = {
        id:form[0].value,
        name: form[1].value,
        lastName: form[2].value,
        age: form[3].value,
        email: form[4].value,
        password: form[5].value,
        roles:roleIds
    }
    return body
}

//////////////// Validate user
function validate(body) {
    const regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    if(body.name != "" &&
        body.password != "" &&
        ( (body.email == "") || regexEmail.test(body.email) )) return true
    else return false
}


//////////////// Add user page
document.querySelector('#addUserButton').addEventListener('click', addNewUser)
async function addNewUser() {
    let body = extractUser(document.querySelectorAll('.addUserForm'))
    if(validate(body)) {
        addUser(body)
        $('a[href="#table"]').tab('show')
        for (let i = 0; i < 6; i++) { $('.addUserForm')[i].value = ""}
    } else alert("Wrong input! Please check:\n- First Name is empty\n- Password is empty\n- wrong Email format")
}

/////////////// Edit window launch
document.addEventListener('click', function(event) {
    if (event.target.classList.contains('MODAL')) handleClickModal(event)
})
async function handleClickModal(event) {
    let modal = document.querySelectorAll('.' + event.target.name)
    let userid = event.target.attributes.value.value.toString()
    let user = getUserById(userid)
    modal[0].value = user.id
    modal[1].value = user.name
    modal[2].value = user.lastName
    modal[3].value = user.age
    modal[4].value = user.email
    modal[5].value = user.password
    modal[6].innerHTML = '';
    let roles = await getAllRoles()
    roles.forEach(role => {
        let option = document.createElement("option")
        option.text = role.role
        option.setAttribute("value", role.id)
        user.roles.forEach(r => {
            if (r.id === role.id) option.setAttribute("selected", "selected")
        })
        modal[6].appendChild(option)
    })
    // launch modal window
    var myModal = new bootstrap.Modal(document.getElementById(event.target.name))
    myModal.show()
    // submit modal
     const submit = document.querySelectorAll('.Submit')
    submit.onclick = handleClickSubmit

     submit.forEach(function (element) {
         element.onclick = handleClickSubmit
     })
    function handleClickSubmit() {
        const body = extractUser(document.querySelectorAll('.' + event.target.name))
        if(validate(body)) {
            if(event.target.name == "editModal"){
                editUser(body)
            }
            if(event.target.name == "deleteModal"){
                deleteUser(body)
            }
        } else alert("Wrong input! Please check:\n- First Name is empty\n- Password is empty\n- wrong Email format")
    }
}

