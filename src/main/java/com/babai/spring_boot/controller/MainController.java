package com.babai.spring_boot.controller;

import com.babai.spring_boot.model.Role;
import com.babai.spring_boot.model.User;
import com.babai.spring_boot.service.RoleService;
import com.babai.spring_boot.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final UserService userService;
    private final RoleService roleService;

    //Start page

    @GetMapping("/")
    public String startPage() {
        return "index";
    }

    //User Page

    @GetMapping("/user")
    public String userPage(Model model) {
        model.addAttribute("user", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        return "user";
    }

    // Admin page + delete user

    @GetMapping("/admin")
    public String getAllUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin";
    }

    @GetMapping("/delete")
    private String deleteUserById( Long id ) {
        userService.deleteUserById(id);
        return "redirect:/admin";
    }

    // Add new user page

    @GetMapping("/add")
    public String addUser(Model model) {
        model.addAttribute(new User());
        model.addAttribute("listRoles", roleService.getAllRoles());
        model.addAttribute("action", "addUser");
        return "admin/user_form";
    }

    @PostMapping("/addUser")
    public String addUser (User user, @RequestParam(value = "checkedRoles"
            , required = false) List<Long> roleIds) {
        if(roleIds !=null) {
            for (Long roleId : roleIds) {
                user.addRole(roleService.getRoleById(roleId));
            }
        }
        userService.addUser(user);
        return "redirect:/admin";
    }

    // Edit user page

    @GetMapping("/edit")
    private String editUser (Model model, Long id) {
        System.out.println(userService.getUserById(id).toString());
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("listRoles", roleService.getAllRoles());
        model.addAttribute("action", "editUser");
        return "admin/user_form";
    }

    @PostMapping("/editUser")
    public String updateUser(User user, @RequestParam(value = "checkedRoles"
            , required = false) List<Long> roleIds) {
        if(roleIds != null) {
            for (Long roleId : roleIds) {
                user.addRole(roleService.getRoleById(roleId));
            }
        }
        userService.saveUser(user);
        return "redirect:/admin";
    }

// Edit roles page

    @GetMapping("/roles")
    public String editRoles(Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        model.addAttribute("newRole", new Role());
        return "admin/roles";
    }

    @GetMapping("/deleteRole")
    private String deleteRoleById( Long id ) {
        roleService.deleteRoleById(id);
        return "redirect:/roles";
    }

    @PostMapping("/addRole")
    public String roleAddByName(String role) {
        roleService.addRoleByName(role);
        return "redirect:/roles";
    }
}
