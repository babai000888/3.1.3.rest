package com.babai.spring_boot.dao;

import com.babai.spring_boot.model.Role;
import java.util.List;

public interface RoleDao {

    List<Role> getAllRoles();
    Role getRoleById (Long id);
    void deleteRole (Long id);
    Role getRoleByName (String role);
    boolean addRole (String role);
}
