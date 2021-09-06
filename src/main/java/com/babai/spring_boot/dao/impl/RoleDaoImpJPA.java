package com.babai.spring_boot.dao.impl;

import com.babai.spring_boot.dao.RoleDao;
import com.babai.spring_boot.model.Role;
import com.babai.spring_boot.repository.RoleRepository;
import com.babai.spring_boot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.List;


@Component
public class RoleDaoImpJPA implements RoleDao {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Override
    public List<Role> getAllRoles() { return roleRepository.findAll(); }

    @Override
    public Role getRoleById (Long id) {
        return roleRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteRole (Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public Role getRoleByName (String role) {
        return roleRepository.findRoleByRole(role).orElse(null);
    }

    @Override
    public boolean addRole(String role) {
        if (getRoleByName(role) != null) {
            return false;
        }
        roleRepository.save(new Role(role));
        return true;
    }

}
