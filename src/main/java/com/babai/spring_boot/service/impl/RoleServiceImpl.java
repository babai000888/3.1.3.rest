package com.babai.spring_boot.service.impl;


import com.babai.spring_boot.dao.RoleDao;
import com.babai.spring_boot.model.Role;
import com.babai.spring_boot.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDao dao;

    @Override
    public List<Role> getAllRoles() { return dao.getAllRoles(); }
    @Override
    public Role getRoleById(Long id) { return dao.getRoleById(id); }
    @Override
    public void deleteRole(Long id) { dao.deleteRole(id); }
    @Override
    public Role getRoleByName(String role) { return dao.getRoleByName(role); }
    @Override
    public void addRole(String role) { dao.addRole(role); }


}
