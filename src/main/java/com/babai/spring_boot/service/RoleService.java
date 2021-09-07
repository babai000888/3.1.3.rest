package com.babai.spring_boot.service;

import com.babai.spring_boot.model.Role;

import java.util.List;

public interface RoleService {

    List<Role> getAllRoles();
    Role getRoleById(Long id);
    void deleteRoleById(Long id);
    Role getRoleByName(String role);
    void addRoleByName(String role);
}


