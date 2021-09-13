package com.babai.spring_boot;

import com.babai.spring_boot.model.User;
import com.babai.spring_boot.service.RoleService;
import com.babai.spring_boot.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import java.util.Set;

@Component
@RequiredArgsConstructor
public class SetupDataLoader implements
        ApplicationListener<ContextRefreshedEvent> {

    private final UserService userService;
    private final RoleService roleService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        roleService.addRoleByName("ROLE_ADMIN");
        roleService.addRoleByName("ROLE_USER");

        User admin = new User();
        //       admin.setId(1L);
        admin.setName("admin");
        admin.setPassword("admin");
        admin.setEmail("admin@mail.ru");
        //       admin.setLastName("INIT");
        //        admin.setAge(50);
        admin.setRoles(Set.of(roleService.getRoleByName("ROLE_ADMIN"),roleService.getRoleByName("ROLE_USER")));
        System.out.println(admin);
        userService.saveUser(admin);

        User user = new User();
        user.setName("user");
        user.setPassword("user");
        user.setEmail("user@mail.ru");
        user.setRoles(Set.of(roleService.getRoleByName("ROLE_USER")));
        userService.saveUser(user);

        System.out.println("==========================================================");
        System.out.println(admin + "\n" + user);
        System.out.println("==========================================================");
    }
}