package com.babai.spring_boot.controller;






import com.babai.spring_boot.model.Role;
import com.babai.spring_boot.model.User;
import com.babai.spring_boot.service.RoleService;
import com.babai.spring_boot.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@ResponseBody
@RequestMapping("/api")
@RequiredArgsConstructor
public class RestController {
    private final UserService userService;
    private final RoleService roleService;

    @GetMapping("/roles")
    public List<Role> getAllRoles() { return roleService.getAllRoles(); }

    @GetMapping("/users")
    public List<User> getAllUsers() {
        return userService.getAllUsers();
    }

    @GetMapping("/users/principal")
    public Object getUserPrincipal() {
        return SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    @GetMapping("/users/{id}")
    public Object getUserById(@PathVariable Long id) {
        return userService.getUserById(id);
    }

    @PostMapping("/users")
    public User addUser(@RequestBody User user) {
        userService.addUser(user);
        return user;
    }

    @PutMapping("/users")
    public User editUser(@RequestBody User user) {
        userService.saveUser(user);
        return user;
    }

    @DeleteMapping("/users/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUserById(id);
        return "{  \"result\" : \"OK\" }";
    }

}