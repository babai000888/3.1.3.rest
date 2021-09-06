package com.babai.spring_boot.service;

import com.babai.spring_boot.model.Role;
import java.util.List;

public interface RoleService {

    List<Role> getAllRoles();
    Role getRoleById(Long id);
    void deleteRole(Long id);
    Role getRoleByName(String role);
    void addRole(String role);
}


