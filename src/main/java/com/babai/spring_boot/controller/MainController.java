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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final UserService userService;
    private final RoleService roleService;

    //Start page

    @GetMapping("/")
    public String startPage() { return "index"; }

    //User Page

    @GetMapping("/user")
    public String userPage() {return "user"; }

    // Admin page

    @GetMapping("/admin")
    public String getAllUsers() { return "admin"; }


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
