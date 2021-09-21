//
//
// // Modal window
// const wrapper = document.querySelectorAll('.wrapper')
//
// wrapper.forEach(function (element) {
//     element.addEventListener('click', handleClickModal)
// })
// // catch edit/delete button click
// async function handleClickModal(e) {
//     let modal = document.querySelectorAll('.' + e.target.name)
//     let userid = e.target.attributes.value.value.toString()
//     const urlUser = "/api/users/" + userid
//     // GET user data
//     let user = await sendRequest('GET', urlUser)
//     // set user data
//      modal[0].value = user.id
//      modal[1].value = user.name
//      modal[2].value = user.lastName
//      modal[3].value = user.age
//      modal[4].value = user.email
//      modal[5].value = user.password
//
//     console.log(modal[6])
//     console.log
//     // generate select roles
//      modal[6].innerHTML = '';
//      const urlRoles = "/api/roles"
//     // GET list of roles
//      let roles = await sendRequest('GET',urlRoles)
//      for(let role of roles) {
//         let option = document.createElement("option")
//         option.text=role.role
//         option.setAttribute("value", role.id)
//         modal[6].appendChild(option)
//     }
//     // launch modal window
//     var myModal = new bootstrap.Modal(document.getElementById(e.target.name))
//     myModal.show()
//     // PUT/DELETE user data
//
//
//     const submit = document.querySelectorAll('.Submit')
//     submit.forEach(function (element) {
//         element.addEventListener('click', handleClickSubmit)
//     })
//     // catch esubmit button click
//     async function handleClickSubmit(el) {
// console.log(modal[6])
//
//         const body= {
//             id: modal[0].value,
//             name: modal[1].value,
//             lastName: modal[2].value,
//             age: modal[3].value,
//             email: modal[4].value,
//             password: modal[5].value,
//             roles: modal[6].values
//         }
//         console.log(body)
//         console.log(el.target.outerText)
//             switch(el.target.outerText) {
//                 case 'Edit':
//                     let put = await sendRequest('PUT', '/api/users', body)
//             }
//        // let submitButton = document.querySelectorAll('.' + el.target.class)
//
//
//     }
//
//
//
//
//
//  //   let post = await sendRequest('PUT',urlRoles, body)
//
// }
