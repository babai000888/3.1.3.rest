package com.babai.spring_boot;

import com.babai.spring_boot.model.User;
import com.babai.spring_boot.service.RoleService;
import com.babai.spring_boot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Component
public class SetupDataLoader implements
        ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;

    @Override
    @Transactional
    public void onApplicationEvent(ContextRefreshedEvent event) {

        roleService.addRole("ROLE_ADMIN");
        roleService.addRole("ROLE_USER");

        User admin = new User("admin","admin");
        userService.save(admin, List.of(roleService.getRoleByName("ROLE_ADMIN").getId()
                                        ,roleService.getRoleByName("ROLE_USER").getId()));
        User user = new User("user","user");
        userService.save(user, List.of(roleService.getRoleByName("ROLE_USER").getId()));

        System.out.println("==========================================================");
        System.out.println(user + "\n" +admin);
        System.out.println("==========================================================");
    }
}